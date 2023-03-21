package com.spring.starbucks.member.controller;


import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.domain.SNSLogin;
import com.spring.starbucks.member.dto.LoginDTO;
import com.spring.starbucks.member.dto.ModifyPwd;
import com.spring.starbucks.member.repository.MemberMapper;
import com.spring.starbucks.member.service.GoogleService;
import com.spring.starbucks.member.service.KakaoService;
import com.spring.starbucks.member.service.LoginFlag;
import com.spring.starbucks.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static com.spring.starbucks.util.LoginUtils.*;


@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {


    private final MemberService memberService;
    private final MemberMapper memberMapper;
    private final KakaoService kakaoService;
    private final GoogleService googleService;

    private final BCryptPasswordEncoder encoder;

    // 회원가입 양식 띄우기 요청
    @GetMapping("/sign-up")
    public void signUp() {
        log.info("/member/sign-up GET! - forwarding to sign-up.jsp");
    }
    @GetMapping("/find_ID")
    public void findID() {
        log.info("/member/find_ID GET! - forwarding to find_ID.jsp");
    }
    @GetMapping("/find_PW")
    public void findPW() {
        log.info("/member/find_PW GET! - forwarding to find_PW.jsp");
    }
    @GetMapping("/my_info")
    public void myinfo() {
        log.info("/member/my_info GET! - forwarding to my_info.jsp");
    }
    @GetMapping("/myinfo_out")
    public void myinfo_out() {
        log.info("/member/myinfo_out GET! - forwarding to myinfo_out.jsp");
    }
    @GetMapping("/myinfo_modify_pwd")
    public void myinfo_modify_pwd() {
        log.info("/member/myinfo_modify_pwd GET! - forwarding to myinfo_modify_pwd.jsp");
    }

    @PostMapping("/myinfo_modify_pwd")
    @ResponseBody
    public ResponseEntity<String> modify_pwd(ModifyPwd inputData, Model model, HttpSession session // 세션정보 객체
            , HttpServletResponse response){

        log.info("/member/myinfo_modify_pwd POST - {}", inputData);
        String msg="";
        boolean flag = false;
        Member m = new Member();
        // 아이디가 세션의 로그인 아이디와 인풋된 아이디가 일치하는지 검사
        if(!Objects.equals(getCurrentMemberAccount(session), inputData.getAccount())){
            msg = "MISSMATCH_ID";
            // 불일치시 "아이디 불일치 리턴" 문구 저장.
            return new ResponseEntity<>(msg,HttpStatus.OK);
        }else{ // 일치시 비번 검사
            // 세션 저장된 로그인 멤버 정보 가져오기
            m = (Member) session.getAttribute(LOGIN_FLAG);
            // 세션의 로그인 멤버 페스워드와 인풋 패스워드 일치 검사
            flag = memberService.validatePassword(inputData.getPassword(), m );
        }
        // 비번 일치하면
        if(flag){
            // 새로운 패스워드로 변경하고
            m.setPassword(encoder.encode(inputData.getNew_pw1()));
            if(memberService.update(m)) {
                // 비번 변경 성공시 성공 메시지 저장.
                msg = "SUCCESS";
            }else{
                // 실페시 실패 메시지 저장.
                msg = "FAIL";
            }
        }else{
            // 비번 불일치시 미스매치 비번 문구저장
            msg = "MISSMATCH_PW";
        }

        return new ResponseEntity<>(msg,HttpStatus.OK);
    }


    // 회원가입 처리 요청
    @PostMapping("/sign-up")
    public String signUp(Member member, RedirectAttributes ra, HttpServletRequest request) {
        log.info("/member/sign-up POST ! - {}", member);
        boolean flag = memberService.signUp(member);
        if (flag) ra.addFlashAttribute("msg", "reg-success");
        String uri = request.getHeader("Referer");
        log.info("referer - {}",uri);
        log.info("referer - {}",request.getSession().getAttribute("redirectURI"));
        if(request.getSession().getAttribute("redirectURI") != null){
            uri = (String)request.getSession().getAttribute("redirectURI");
            log.info("redirectURI - {}",uri);
        }
        if(uri.contains("/sign-up")){
            uri="/";
        }


        return flag ? "redirect:" + uri : "redirect:/member/sign-up";
    }

    //패스워드 검증후 회원정보 수정 양식 띄우기
    @PostMapping("/modify")
    public String viewMyPage(HttpSession session, String password) {

        log.info("/member/modify Post -{}", password);

        Member loginUser = (Member) session.getAttribute(LOGIN_FLAG);
        boolean flag = memberService.validatePassword(password, loginUser);

        log.info("/member/modify Post end -{}", flag);

        return flag ? "/member/modify" : "redirect:/myStarbucks";
    }

    // 회원정보수정
    @PostMapping("/update")
    public String update(Member member, RedirectAttributes ra, HttpSession session) {
        log.info("/member/update POST ! - {}", member);

        boolean reSignIn = true; // 비밀번호 변경시 다시로그인을 위한 flag
        Member m = (Member) session.getAttribute(LOGIN_FLAG);
//        회원 권한과 레벨은 인풋데이터로 받지 않고 기존의 것을 대입.
        member.setAuth(m.getAuth());
        member.setLevel(m.getLevel());
        if(member.getPassword() == null || member.getPassword() == ""){
//            패스워드를 변경하지 않아 널이 오면 기존의 패스워드를 대입. 재로그인 플래그는 폴스
            member.setPassword(m.getPassword());
            reSignIn = false;
        }
//        회원정보 업데이트
        boolean flag = memberService.update(member);
//        재로그인 , 업데이트 모두 true 면 세션 비우기
        if (flag) {
            ra.addFlashAttribute("msg", "mod-success");
            if(reSignIn) {
                session.removeAttribute("loginUser");
                session.invalidate();
            }
        } else {
            ra.addFlashAttribute("msg", "mod-failed");
        }
        return reSignIn&&flag ? "redirect:/member/sign-in" : "redirect:/myStarbucks/index";
    }

    // 아이디, 이메일 중복확인 비동기 요청 처리
    @GetMapping("/check")
    @ResponseBody
    public ResponseEntity<String> check(String type, String value) {
        log.info("/member/check?type={}&value={} GET!! ASYNC", type, value);
        boolean flag = memberService.checkSignUpValue(type, value);

        log.info("check flag - {}", String.valueOf(flag));
        return new ResponseEntity<>(String.valueOf(flag), HttpStatus.OK);
    }


    // 로그인 화면을 열어주는 요청처리
    @GetMapping("/sign-in")
    public void signIn(HttpServletRequest request) {
        log.info("/member/sign-in GET! - forwarding to sign-in.jsp");

        // 요청 정보 헤더 안에는 Referer라는 키가 있는데
        // 여기 안에는 이 페이지로 진입할 때 어디에서 왔는지 URI정보가 들어있음.
        String referer = (String)request.getSession().getAttribute("redirectURI");
        if(referer == null){
            referer = request.getHeader("Referer");
        }
        log.info("referer: {}", referer);

        request.getSession().setAttribute("redirectURI", referer);
    }

    // 로그인 요청 처리
    @PostMapping("/sign-in")
    @ResponseBody
    public ResponseEntity<Map<String, String>> signIn(LoginDTO inputData, Model model, HttpServletRequest request // 세션정보 객체
            , HttpServletResponse response){

        log.info("/member/sign-in POST - {}", inputData);
//        log.info("session timeout : {}", session.getMaxInactiveInterval());
        HttpSession session = request.getSession();
        Map<String,String> map = new HashMap<>();
        log.info("memberService.login 시작");
        // 로그인 서비스 호출 하여 결과값 저장.
        String flag = memberService.login(inputData, request, response).toString();
        model.addAttribute("loginMsg", flag);

        map.put("loginMsg", flag);
        map.put("name", getCurrentMemberName(session));
        map.put("redirectUri", session.getAttribute("redirectURI").toString());
        log.info("memberService.login 종료");

        return new ResponseEntity<>(map,HttpStatus.OK);

    }

    // 로그아웃
    @GetMapping("/sign-out")
    public ResponseEntity<Map<String, String>> signOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        Map<String, String> map = new HashMap<>();

        if (isLogin(session)) {
            // 세션 삭제전 로그인되어있는 유저 네임 가져오기
            map.put("name",getCurrentMemberName(session));

            // 만약 자동로그인 상태라면 해제한다.
            if (hasAutoLoginCookie(request)) {
                log.info("auto");
                memberService.autoLogout(getCurrentMemberAccount(session), request, response);
            }

            // SNS 로그인 상태라면 해당 SNS 로그아웃
            SNSLogin from = (SNSLogin) session.getAttribute(LOGIN_FROM);

            if(from != null){
                switch (from){
                    case KAKAO:
                        log.info("kakao logout");
                        // 카카오 로그아웃 처리
                        kakaoService.logout((String) session.getAttribute("accessToken"));
                        break;
                    case GOOGLE:
                        break;
                    case NAVER:
                        break;
                    case FACEBOOK:
                        break;
                }
            }
            //세션에서 정보 삭제
            session.removeAttribute("loginUser");

            // 2. 세션을 무효화한다.
            session.invalidate();
            map.put("msg", "success");
        }
        return new ResponseEntity<>( map, HttpStatus.OK);
    }

//    회원 탈퇴
    @PostMapping("/del_account")
    @ResponseBody
    public ResponseEntity<String> del_account(@RequestBody String reason, HttpSession session){
        log.info("reason - {}",reason);

        String msg = memberService.deleteAccount(getCurrentMemberAccount(session), reason, session);
        if (msg == "SUCCESS") {
            // 1. 세션에서 정보를 삭제한다.
            session.removeAttribute("loginUser");
            // 2. 세션을 무효화한다.
            session.invalidate();
        }
        return new ResponseEntity<String >(msg, HttpStatus.OK);
    }

}
