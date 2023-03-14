package com.spring.starbucks.member.controller;


import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.dto.GoogleOAuthRequest;
import com.spring.starbucks.member.dto.GoogleOAuthResponse;
import com.spring.starbucks.member.dto.LoginDTO;
import com.spring.starbucks.member.service.GoogleService;
import com.spring.starbucks.member.service.LoginFlag;
import com.spring.starbucks.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Map;

import static com.spring.starbucks.member.domain.OAuthValue.*;
import static com.spring.starbucks.member.domain.SNSLogin.GOOGLE;
import static com.spring.starbucks.member.domain.SNSLogin.KAKAO;
import static com.spring.starbucks.util.LoginUtils.LOGIN_FLAG;
import static com.spring.starbucks.util.LoginUtils.LOGIN_FROM;


@Controller
@Log4j2
@RequiredArgsConstructor
public class GoogleController {

    private final GoogleService googleService;

    private final MemberService memberService;


    @GetMapping("/google-login")
    public String google(){

        return "redirect:https://accounts.google.com/o/oauth2/v2/auth?client_id=" +GOOGLE_CLIENT_ID
                + "&redirect_uri="+GOOGLE_REDIRECT_URI
                + "&response_type=code"
                + "&scope=email%20profile%20openid"
                + "&access_type=offline"
                + "&prompt=consent";
    }
    @GetMapping("/oauth/google")
    public String googleLogin(String code, HttpSession session, HttpServletResponse response, Model model) throws Exception{

        log.info("Google Login Start, id token : {}",code);

        RestTemplate restTemplate = new RestTemplate();



        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategies.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);



        String jwtToken = googleService.getAccessToken(code,mapper,restTemplate);



        Member googleUser = googleService.getGoogleUserInfo(jwtToken,mapper,restTemplate);

        if(googleUser != null) {

            session.setAttribute(LOGIN_FLAG, googleUser);
            session.setAttribute(LOGIN_FROM, GOOGLE);
            session.setAttribute("jwtToken", jwtToken);
        }
        return "redirect:" + (String)session.getAttribute("redirectURI");

//        String type = "email";
//        String value = googleUser.getEmail();
//        boolean isMember = memberService.checkSignUpValue(type, value);
//        if(googleUser!=null) {
//            if (isMember) {
//
//                LoginDTO data = new LoginDTO();
//
//                data.setEmail(value);
//
//                LoginFlag flag = memberService.login(data, session, response);
//                log.info(flag);
//                model.addAttribute("loginMsg", flag);
//                if (flag == LoginFlag.SUCCESS) {
//                    log.info("google login success!!");
//
//                    String redirectURI = (String) session.getAttribute("redirectURI");
//                    if (redirectURI.contains("/member/modify")) return "redirect:/";
//                    return "redirect:" + redirectURI;
//
//                }
//
//            } else if (!isMember) {
//
////                boolean signUpFlag = memberService.signUp(googleUser);
//
//                log.info("구글 이메일과 연결 된 계정 없음");
//                model.addAttribute("loginMsg", LoginFlag.No_EMAIL);
//
//                return "redirect:/member/sign-in";
//
//            }
//        }

//        return null;


    }

}
