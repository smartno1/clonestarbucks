package com.spring.starbucks.config;


import com.spring.starbucks.interceptor.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {

    private final AdminInterceptor adminInterceptor;
    private final AutoLoginInterceptor autoLoginInterceptor;
    private final AfterLoginInterceptor afterLoginInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        //관리자 메뉴 인터셉터 설정
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/*")

        //메뉴 인터셉터 추가
                .addPathPatterns("/menu/*")
                .excludePathPatterns("/menu/list", "/menu/menuListDetail","/menu/food", "/menu/foodListDetail","/menu/sangpum","/menu/sangpumListDetail")
        // 커피 인터셉터 추가
                .addPathPatterns("/coffee/bean/addCoffee","/coffee/bean/deleteCoffeeBean","/coffee/bean/editCoffeeBeanForm","/coffee/bean/editCoffeeBean")
        //왓츠뉴 인터셉터추가
                // 이벤트
                .addPathPatterns("/whats_new/event/add","/whats_new/event/edit","/whats_new/event/delete")
                // 뉴스
                .addPathPatterns("/whats_new/news/add","/whats_new/news/edit","/whats_new/news/delete")
                // 공지사항
                .addPathPatterns("/whats_new/notice/add","/whats_new/notice/edit","/whats_new/notice/delete");


        // 오토 로그인 인터셉터
        registry.addInterceptor(autoLoginInterceptor)
                        .addPathPatterns("/**");

        // 로그인 후, 로그인중일때 로그인, 회원가입 차단. 인터셉터
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/member/sign-in","/member/sign-up");


    }
}