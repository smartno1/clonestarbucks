package com.spring.starbucks.kakaoMap.controller;


import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/kakaoMap")
public class KakaoMapController {

    @GetMapping("/findStore")
    public String findStore(){


        return "/kakaoMap/store";

    }


    @GetMapping("/findDrive")
    public String findDrive(){


        return "/kakaoMap/drive";

    }





}
