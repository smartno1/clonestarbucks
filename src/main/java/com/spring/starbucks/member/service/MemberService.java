package com.spring.starbucks.member.service;

import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.dto.LoginDTO;
import com.spring.starbucks.member.repository.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

import static com.spring.starbucks.member.service.LoginFlag.*;

@Service
@Log4j2
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;

    private final BCryptPasswordEncoder encoder;



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
     * @param type - 확인할 정보 (ex: account or email)
     * @param value - 확인할 값
     * @return 중복이라면 true, 중복이 아니라면 false
     */
    public boolean checkSignUpValue(String type, String value) {
        Map<String, Object> checkMap = new HashMap<>();
        checkMap.put("type", type);
        checkMap.put("value", value);

        return memberMapper.isDuplicate(checkMap) == 1;
    }

    // 회원 정보 조회 중간 처리
    public Member getMember(String account) {
        return memberMapper.findUser(account);
    }

    // 로그인 처리
    public LoginFlag login(LoginDTO inputData, HttpSession session, HttpServletResponse response) {
        // 회원가입 여부 확인
//        Member foundMember = memberMapper.findUser(inputData.getAccount());


        Member foundMember = new Member();
        if(inputData.getEmail()==null){

            Map<String, Object> findMap = new HashMap<>();
            findMap.put("type", "account");
            findMap.put("value", inputData.getAccount());

            foundMember = memberMapper.findUser2(findMap);

        }else{
            Map<String, Object> findMap = new HashMap<>();
            log.info("email : {}",inputData.getEmail());
            findMap.put("type", "email");
            findMap.put("value", inputData.getEmail());

            foundMember = memberMapper.findUser2(findMap);

            session.setAttribute("loginUser", foundMember);
            session.setMaxInactiveInterval(60 * 60); // 1시간
            return SUCCESS;

        }

        log.info("멤버 : {}", foundMember);

        if (foundMember != null) {
            log.info("password : {} ", inputData.getPassword());
            log.info("encodePassword : {} ", foundMember.getPassword());
            log.info("encoder.matches : {}",encoder.matches(inputData.getPassword(), foundMember.getPassword()));
            if (encoder.matches(inputData.getPassword(), foundMember.getPassword())) { //패스워드 암호화로 매치메소드를 사용해서 비교.
                // 로그인 성공
                // 세션에 사용자 정보기록 저장
                session.setAttribute("loginUser", foundMember);

                // 세션 타임아웃 설정
                session.setMaxInactiveInterval(60 * 60); // 1시간
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





    // 마이페이지 validatePassword

    public boolean validatePassword(String password, Member loginuser){


        boolean flag = encoder.matches(password,loginuser.getPassword());

        return flag;


    }





}
