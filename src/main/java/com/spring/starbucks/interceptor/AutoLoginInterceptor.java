package com.spring.starbucks.interceptor;

import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.repository.MemberMapper;
import com.spring.starbucks.member.service.LoginFlag;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.spring.starbucks.util.LoginUtils.LOGIN_FLAG;
import static com.spring.starbucks.util.LoginUtils.getAutoLoginCookie;

@Configuration
@Log4j2
@RequiredArgsConstructor
public class AutoLoginInterceptor implements HandlerInterceptor {

    private final MemberMapper memberMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("auto login prehandle");
        //1. 자동로그인 쿠키 탐색
        Cookie c = getAutoLoginCookie(request);


        //2. 자동로그인 쿠키가 발견될 경우 쿠키값을 읽어서 세션아이디를 확인
        if (c != null) {
            String sessionId = c.getValue();
            log.info("auto sid : {}", sessionId);

            //3. 쿠키에 저장된 세션아이디와 같은 값을 가진 회원정보 조회
            Member member = memberMapper.findMemberBySessionId(sessionId);
            log.info("auto member : {}", member);
            if (member != null) {
                // 4. 세션에 해당 회원정보를 저장
                request.getSession().setAttribute(LOGIN_FLAG, member);
            }
        }
        return true;
    }
}
