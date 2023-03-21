package com.spring.starbucks.myStarbucks;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/myStarbucks")
public class myStarbucksController {

    @GetMapping("/index")
    public String myStarbucks(){

        return "myStarbucks/my-Starbucks";
    }

}
