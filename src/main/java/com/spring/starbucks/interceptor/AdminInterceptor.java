package com.spring.starbucks.interceptor;

import com.spring.starbucks.member.domain.Auth;
import com.spring.starbucks.util.LoginUtils;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Configuration
@Log4j2
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();

        log.info("admin interceptor preHandle start");
        if(!LoginUtils.isLogin(session)){
            log.info("로그인해주세요.");
            request.getSession().setAttribute("redirectURI",request.getRequestURI());
            response.sendRedirect("/member/sign-in");
            return false;
        }

        if(!Objects.equals(LoginUtils.getCurrentMemberAuth(session), "" + Auth.ADMIN)){
            log.info("관리자가 아닙니다.");
            response.sendRedirect("/");
            return false;
        }
        log.info("admin interceptor preHandel END");
        return true;
    }
}
