package com.spring.starbucks.menu.controller;

import com.spring.starbucks.coffee.domain.Coffee;
import com.spring.starbucks.coffee.service.CoffeeService;
import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.service.MenuService;
import com.spring.starbucks.coffee.upload.FileUtils;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Update;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2 // log.info("")
@RequiredArgsConstructor
@RequestMapping("/menu")
@PropertySource("classpath:upLoadPath.properties")
public class MenuController {

    private final MenuService menuService;

    @GetMapping("/list")
    public String list(Model model) {
//        List<Menu> menuList = menuService.findAllService();
//        model.addAttribute("list", menuList);
        return "menu/menuList";
    }

    @GetMapping("/addMenuForm")
    public String addMenuForm(Model model) {

        return "menu/addMenuForm";
    }

}
