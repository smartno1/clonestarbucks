package com.spring.starbucks.coffee.esprosso.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/coffee/espresso")
public class espressoController {

    @GetMapping("/list")
    public String list(){
        return "coffee/espresso/espresso";
    }

    @GetMapping("/detail")
    public String americano(String type){
        return "coffee/espresso/"+type;
    }


}
