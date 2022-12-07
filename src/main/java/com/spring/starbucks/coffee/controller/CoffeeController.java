package com.spring.starbucks.coffee.controller;

import com.spring.starbucks.coffee.domain.Coffee;
import com.spring.starbucks.coffee.service.CoffeeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@Log4j2
@RequestMapping("/coffee")
@RequiredArgsConstructor
public class CoffeeController {

    private final CoffeeService coffeeService;

    @GetMapping("/bean")
    public String beanList(Model model){

        List<Coffee> coffees = coffeeService.findAllService();
        model.addAttribute("list",coffees);
        return "coffeeBean/coffeeBeanList";
    }

    @GetMapping("/addCoffee")
    public String addCoffeeForm(){

        return "coffeeBean/addCoffeeForm";
    }

    @PostMapping("/addCoffee")
    public String addCoffee(Coffee coffee, HttpSession session){
        log.info("/coffee/addCoffee POST! - {}", coffee);
        log.info(coffee.getNameEn());
        log.info(coffee.getDesignStory());
        boolean flag = coffeeService.saveService(coffee);

        return "redirect:/coffee/bean";

    }


    @GetMapping("/coffeeBeanDetail")
    public String detail(int id, Model model){
        log.info("/coffee/coffeeBeanDetail GET! - id:{}",id);
        Coffee coffee = coffeeService.findOneService(id);
        model.addAttribute("coffee", coffee);

        return "coffeeBean/coffeeBeanDetail";
    }

}
