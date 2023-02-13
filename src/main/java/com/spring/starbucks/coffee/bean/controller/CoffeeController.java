package com.spring.starbucks.coffee.bean.controller;

import com.spring.starbucks.coffee.bean.domain.Tastedto;
import com.spring.starbucks.coffee.bean.domain.Coffee;
import com.spring.starbucks.coffee.bean.service.CoffeeService;
import com.spring.starbucks.coffee.bean.upload.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@Log4j2
@RequestMapping("/coffee/bean")
@RequiredArgsConstructor
@PropertySource("classpath:upLoadPath.properties")
public class CoffeeController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final CoffeeService coffeeService;

    @GetMapping("/list")
    public String beanList(@ModelAttribute("kind") String kind, Model model){
        log.info("/coffee/bean/list GET! - kind: {}",kind);
        List<Coffee> coffees = coffeeService.findAllService(kind);
        log.info("list - {}",coffees);
        model.addAttribute("list",coffees);
        return "coffee/coffeeBean/coffeeBeanList";
    }

    @GetMapping("/addCoffee")
    public String addCoffeeForm(){

        return "coffee/coffeeBean/addCoffeeForm";
    }

    @Transactional
    @PostMapping("/addCoffee")
    public String addCoffee(Coffee coffee, HttpSession session){
        log.info("/coffee/bean/addCoffee POST! - {}", coffee);
        log.info(coffee.getNameEn());
        log.info(coffee.getDesignStory());
        boolean flag = coffeeService.saveService(coffee);

        return "redirect:/coffee/bean/list";

    }

    @GetMapping("/coffeeBeanDetail")
    public String detail(int id, Model model){
        log.info("/coffee/bean/coffeeBeanDetail GET! - id:{}",id);
        Coffee coffee = coffeeService.findOneService(id);
        model.addAttribute("coffee", coffee);

        return "coffee/coffeeBean/coffeeBeanDetail";
    }

    @Transactional
    @DeleteMapping("/deleteCoffeeBean")
    public ResponseEntity<String> delete(@RequestBody String id){
        log.info("/coffee/bean/deleteCoffeeBean Delete! id - {}", id);
        int nid = Integer.parseInt(id);
        String img = coffeeService.findOneService(nid).getImage(); // 이미지경로저장.
        boolean flag = coffeeService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
           String result = FileUtils.deleteFile(img, UPLOAD_PATH); // 파일 삭제
            return new ResponseEntity<>(result, HttpStatus.OK);
        }else{
            return new ResponseEntity<>("fail", HttpStatus.NOT_ACCEPTABLE);
        }
    }

    @GetMapping("/editCoffeeBeanForm")
    public String editCoffeeBeanForm(String id, Model model){
        Coffee coffee = coffeeService.findOneService(Integer.parseInt(id));
        model.addAttribute("coffee",coffee);
        return "coffee/coffeeBean/editCoffeeBeanForm";
    }
    @Transactional
    @PostMapping("/editCoffeeBean")
    public String editCoffeeBean(Coffee coffee, HttpSession session){
        log.info("/coffee/bean/editCoffeeBean POST! - {}", coffee);
        boolean flag = coffeeService.updateService(coffee);

        return "redirect:/coffee/bean/coffeeBeanDetail?id="+coffee.getId();

    }

    @GetMapping("/productFinder")
    public String productFinder (){
        return "coffee/coffeeBean/productFinder";
    }

    @GetMapping("/findDone")
    public String findDone(Tastedto tastedto, Model model){
        List<Coffee> coffees = coffeeService.findAll2Service(tastedto);
        model.addAttribute("coffees", coffees);
        return "coffee/coffeeBean/findResult";
    }



}
