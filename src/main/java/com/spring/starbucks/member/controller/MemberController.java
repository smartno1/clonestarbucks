package com.spring.starbucks.member.controller;


import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.dto.LoginDTO;
import com.spring.starbucks.member.service.LoginFlag;
import com.spring.starbucks.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.spring.starbucks.util.LoginUtils.LOGIN_FLAG;


@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {


    private final MemberService memberService;

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
    @GetMapping("/vocList")
    public void vocList() {
        log.info("/member/vocList GET! - forwarding to vocList.jsp");
    }
    @GetMapping("/csQuestion")
    public void csQuestion() {
        log.info("/member/csQuestion GET! - forwarding to csQuestion.jsp");
    }

    // 회원가입 처리 요청
    @PostMapping("/sign-up")
    public String signUp(Member member, RedirectAttributes ra, HttpServletRequest request, HttpServletResponse response) {
        log.info("/member/sign-up POST ! - {}", member);
        boolean flag = memberService.signUp(member);
        if (flag) ra.addFlashAttribute("msg", "reg-success");
        String uri = request.getHeader("Referer");
        log.info("referer - {}",uri);
        if(request.getSession().getAttribute("redirectURI") != null){
            uri = (String)request.getSession().getAttribute("redirectURI");
            log.info("redirectURI - {}",uri);
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

        return flag ? "/member/modify" : "redirect:/member/myPage/";

    }

    // 회원정보수정
    @PostMapping("/update")
    public String update(Member member, RedirectAttributes ra, HttpSession session) {
        log.info("/member/update POST ! - {}", member);
        boolean flag = memberService.update(member);
        if (flag) {
            ra.addFlashAttribute("msg", "mod-success");
            session.removeAttribute("loginUser");

            session.invalidate();

        } else {
            ra.addFlashAttribute("msg", "mod-failed");
        }
        return flag ? "redirect:/member/sign-in" : "redirect:/member/modify";
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
        String referer = request.getHeader("Referer");
        log.info("referer: {}", referer);


        request.getSession().setAttribute("redirectURI", referer);
    }

    // 로그인 요청 처리
    @PostMapping("/sign-in")
    @ResponseBody
    public ResponseEntity<String> signIn(LoginDTO inputData, Model model, HttpSession session // 세션정보 객체
            , HttpServletResponse response){

        log.info("/member/sign-in POST - {}", inputData);
//        log.info("session timeout : {}", session.getMaxInactiveInterval());

        log.info("memberService.login 시작");
        // 로그인 서비스 호출
        LoginFlag flag = memberService.login(inputData, session, response);
        model.addAttribute("loginMsg", flag);
        log.info("memberService.login 종료");
        log.info(flag);

        return new ResponseEntity<>(String.valueOf(flag),HttpStatus.OK);

    }

    @GetMapping("/sign-out")
    public ResponseEntity<String> signOut(HttpSession session) {
        ResponseEntity<String> res = new ResponseEntity<>("success",HttpStatus.OK);
        if (session.getAttribute("loginUser") != null) {
            // 1. 세션에서 정보를 삭제한다.
            session.removeAttribute("loginUser");

            // 2. 세션을 무효화한다.
            session.invalidate();

            return res;
        }
        return res;
    }







}
