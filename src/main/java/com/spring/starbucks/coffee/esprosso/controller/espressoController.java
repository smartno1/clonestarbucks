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

    @GetMapping("/americano")
    public String americano(){
        return "coffee/espresso/americano";
    }

    @GetMapping("/cappuccino")
    public String cappuccino(){
        return "coffee/espresso/cappuccino";
    }

    @GetMapping("/mocha")
    public String mocha(){
        return "coffee/espresso/mocha";
    }
}
