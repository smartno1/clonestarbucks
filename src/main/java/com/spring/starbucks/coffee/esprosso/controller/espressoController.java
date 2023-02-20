package com.spring.starbucks.coffee.esprosso.controller;

import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.service.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/coffee/espresso")
public class espressoController {

    private final MenuService menuService;

    @GetMapping("/list")
    public String list(){
        return "coffee/espresso/espresso";
    }

    @GetMapping("/detail")
    public String americano(String type){
        return "redirect:/coffee/espresso/"+type;
    }

    @GetMapping("/americano")
    public String americano(Model model){
        List<Menu> menuList = menuService.findAllService2("espresso", "americano");
        model.addAttribute("menuList", menuList);
        log.info("menu - {}",menuList);
        return "coffee/espresso/americano";
    }
    @GetMapping("/cappuccino")
    public String cappuccino(Model model){
        List<Menu> menuList = menuService.findAllService2("espresso", "cappuccino");
        model.addAttribute("menuList", menuList);

        return "coffee/espresso/cappuccino";
    }
    @GetMapping("/mocha")
    public String mocha(Model model) {
        List<Menu> menuList = menuService.findAllService2("espresso", "mocha");
        model.addAttribute("menuList", menuList);
        return "coffee/espresso/mocha";
    }


}
