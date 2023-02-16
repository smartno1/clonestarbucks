package com.spring.starbucks.coffee.controller;

import com.spring.starbucks.coffee.domain.Coffee;
import com.spring.starbucks.coffee.service.CoffeeService;
import com.spring.starbucks.coffee.upload.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@Log4j2
@RequestMapping("/coffee")
@RequiredArgsConstructor
@PropertySource("classpath:upLoadPath.properties")
public class CoffeeController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final CoffeeService coffeeService;

    @GetMapping("/bean")
    public String beanList(@ModelAttribute("kind") String kind, Model model){
        log.info("/coffee/bean GET! - kind: {}",kind);
        List<Coffee> coffees = coffeeService.findAllService(kind);
        log.info("list - {}",coffees);
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

    @DeleteMapping("/deleteCoffeeBean")
    public ResponseEntity<String> delete(@RequestBody String id){
        log.info("/coffee/deleteCoffeeBean Get! id - {}", id);
        int nid = Integer.parseInt(id);
        String img = coffeeService.findOneService(nid).getImage(); // 이미지경로저장.
        boolean flag = coffeeService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
            return FileUtils.deleteFile(img, UPLOAD_PATH); // 파일 삭제
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @GetMapping("/editCoffeeBeanForm")
    public String editCoffeeBeanForm(String id, Model model){
        Coffee coffee = coffeeService.findOneService(Integer.parseInt(id));
        model.addAttribute("coffee",coffee);
        return "coffeeBean/editCoffeeBeanForm";
    }
}
