package com.spring.starbucks.member.service;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.member.domain.DelMember;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.dto.AutoLoginDTO;
import com.spring.starbucks.member.dto.LoginDTO;
import com.spring.starbucks.member.repository.DelMemberMapper;
import com.spring.starbucks.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.spring.starbucks.member.service.LoginFlag.*;
import static com.spring.starbucks.util.LoginUtils.*;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;
    private final DelMemberMapper delMemberMapper;

    private final BCryptPasswordEncoder encoder;


    public Member findUser(String account){
        return memberMapper.findUser(account);
    }

    public List<Member> findAll(Search search){
        return memberMapper.findAll(search);
    }

    public boolean signUp(Member member) {
        // 비밀번호 인코딩
        member.setPassword(encoder.encode(member.getPassword()));

        return memberMapper.register(member);
    }

    public boolean update(Member member) {

        return memberMapper.update(member);
    }

    // 중복확인 중간처리

    /**
     * 계정과 이메일의 중복을 확인하는 메서드
     *
     * @param type  - 확인할 정보 (ex: account or email)
     * @param value - 확인할 값
     * @return 중복이라면 true, 중복이 아니라면 false
     */
    public boolean checkSignUpValue(String type, String value) {
        Map<String, Object> checkMap = new HashMap<>();
        checkMap.put("type", type);
        checkMap.put("value", value);
        int memberCheck = memberMapper.isDuplicate(checkMap);
        int delMemberCheck = delMemberMapper.isDuplicate(checkMap);

        return (memberCheck + delMemberCheck) > 0;
    }

    // 회원 정보 조회 중간 처리
    public Member getMember(String account) {
        return memberMapper.findUser(account);
    }

    // 로그인 처리
    public LoginFlag login(LoginDTO inputData, HttpServletRequest request, HttpServletResponse response) {
        // 회원가입 여부 확인
//        Member foundMember = memberMapper.findUser(inputData.getAccount());
        HttpSession session = request.getSession();

        Member foundMember = new Member();
        if (inputData.getEmail() == null) {

            Map<String, Object> findMap = new HashMap<>();
            findMap.put("type", "account");
            findMap.put("value", inputData.getAccount());

            foundMember = memberMapper.findUser2(findMap);

        } else {
            Map<String, Object> findMap = new HashMap<>();
            log.info("email : {}", inputData.getEmail());
            findMap.put("type", "email");
            findMap.put("value", inputData.getEmail());

            foundMember = memberMapper.findUser2(findMap);

            session.setAttribute("loginUser", foundMember);
            session.setMaxInactiveInterval(60 * 60); // 1시간
            return SUCCESS;

        }

        log.info("멤버 : {}", foundMember);

        if (foundMember != null) {
            if (encoder.matches(inputData.getPassword(), foundMember.getPassword())) { //패스워드 암호화로 매치메소드를 사용해서 비교.
                // 로그인 성공
                // 세션에 사용자 정보기록 저장
                session.setAttribute("loginUser", foundMember);

                // 세션 타임아웃 설정
                session.setMaxInactiveInterval(60 * 60); // 1시간

                // 자동 로그인 처리
                if (inputData.isAutoLogin()) {
                    log.info("checked auto login user!!");
                    keepLogin(foundMember.getAccount(), session, response);
                }
                return SUCCESS;
            } else {
                // 비번 틀림
                return NO_PW;
            }
        } else {
            // 아이디 없음
            return NO_ACC;
        }
    }

    // 자동 로그인 처리
    private void keepLogin(String account, HttpSession session, HttpServletResponse response) {
        log.info("keepLogin");
        // 1. 자동로그인 쿠키 생성 - 쿠키의 값으로 현재 세션의 아이디를 저장
        String sessionId = session.getId();
        Cookie c = new Cookie(LOGIN_COOKIE, sessionId);
        // 2. 쿠키 설정 (수명, 사용 경로)
        int limitTime = 60 * 60 * 24 * 90; // 90일에 대한 초
        c.setMaxAge(limitTime);
        c.setPath("/"); // 전체경로
        // 3. 로컬에 쿠키 전송
        response.addCookie(c);

        // 4. DB에 쿠키값과 수명 저장
        // 자동로그인 유지시간(초)을 날짜로 변환
        long nowTime = System.currentTimeMillis();
        Date limitDate = new Date(nowTime + ((long) limitTime * 1000));

        AutoLoginDTO dto = new AutoLoginDTO(account, sessionId, limitDate);

        memberMapper.saveSessionValue(dto);
    }

    // 자동로그인 해제
    public void autoLogout(String account, HttpServletRequest request, HttpServletResponse response) {

        //1. 자동로그인 쿠키를 불러온 뒤 수명을 0초로 세팅해서 클라이언트에 돌려보낸다
        Cookie c = getAutoLoginCookie(request);
        if (c != null) {
            log.info("cookie dead : {}",c.getValue());
            c.setMaxAge(0);
            c.setValue("");
            log.info("cookie dead2 : {}",c.getValue());
            response.addCookie(c);

            //2. 데이터베이스 처리
            AutoLoginDTO dto = new AutoLoginDTO(account, "none", new Date());   // 세션 정보 삭제
            memberMapper.saveSessionValue(dto);
        }
    }


    // 마이페이지 validatePassword

    public boolean validatePassword(String password, Member loginUser) {

        boolean flag = encoder.matches(password, loginUser.getPassword());

        return flag;
    }

    // 회원 탈퇴 기능
    public String deleteAccount(String account, String reason, HttpSession session){
        String msg = "FAIL";
        try {
            if (account != null) {
                DelMember delMember = (DelMember)memberMapper.findUser(account);
                delMember.setDelReason(reason);
                delMember.setDeleter(getCurrentMemberAccount(session));
                log.info("delAccount start - {}", delMember);
                boolean flag = delAccountRegister(delMember);
                if (flag) {
                    if (deleteUser(account)) {
                            msg = "SUCCESS";
                    }
                }
            } else {
                msg = "NO_LOGIN";
            }
            return msg;
        }catch (Exception e){
            return msg;
        }
    }

    // 회원 복구 기능
    public boolean recoveryAccount(String account, HttpSession session){
        DelMember member = delAccountFind(account);
        member.setRecoverer(getCurrentMemberAccount(session));
        boolean flag = memberMapper.recovery(member);
        if(flag){
            boolean flag2 = delMemberMapper.delAccountDelete(account);

                return flag2;

        }
        return flag;
    }

    // 회원 삭제 기능
    public boolean deleteUser(String account){
        return memberMapper.deleteUser(account);
    }

    public int getTotalCount(Search search){
        return memberMapper.getTotalCount(search);
    }




    // 탈퇴 회원 테이블 관련 서비스 기능
    public boolean delAccountRegister(DelMember member) {

        return delMemberMapper.delAccountRegister(member);
    }

    public boolean delAccountUpdate(DelMember member) {

        return delMemberMapper.delAccountUpdate(member);
    }

    public DelMember delAccountFind(String account) {
        DelMember member = delMemberMapper.delAccountFind(account);
        // 복구가능 날짜 계산을 위해 30일을 더하고 날짜 포멧을 변경하여 문자열로 저장.
        LocalDateTime p = member.getDelRegDate().plusDays(30);
        member.setPrettierDate(p.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        return member;
    }

    public DelMember delAccountFind2(Map<String, Object> checkMap) {

        return delMemberMapper.delAccountFind2(checkMap);

    }

    public List<DelMember> delFindAll(Search search){
        return delMemberMapper.findAll(search);
    }

    public boolean delAccountDelete(String account){

        return delMemberMapper.delAccountDelete(account);
    }

    public int delGetTotalCount(Search search){
        return delMemberMapper.getTotalCount(search);
    }


}
