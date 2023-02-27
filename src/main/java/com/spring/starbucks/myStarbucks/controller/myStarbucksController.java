package com.spring.starbucks.myStarbucks.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class myStarbucksController {


    @GetMapping("/myStarbucks")
    public String mystarbucks(){

        return "myStarbucks/my-Starbucks";
    }
}
