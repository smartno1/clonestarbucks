package com.spring.starbucks.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        // 리소스 경로 매칭을 해주지 않으면 상품등록 후 리스트로 갔을 때 이미지가 나오지 않음.
        registry.addResourceHandler("/img/**").addResourceLocations("file:///C:/demo/test1/strimg/img/");
//        registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/");
//        registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/");
    }
}
