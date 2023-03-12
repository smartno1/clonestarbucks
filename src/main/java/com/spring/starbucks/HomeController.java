package com.spring.starbucks;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j2
@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        log.info("welcome page open!");
        log.info("classpath/sr - ");
//        model.addAttribute("scroll", true);

        return "index";
    }

}
