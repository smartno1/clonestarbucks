package com.spring.starbucks.menu.controller;

import com.spring.starbucks.coffee.upload.FileUtils;
import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.service.MenuService;
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
@Log4j2 // log.info("")
@RequiredArgsConstructor
@RequestMapping("/menu")
@PropertySource("classpath:upLoadPath.properties")
public class MenuController {
    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final MenuService menuService;

    @GetMapping("/list")
    public String menuList(@ModelAttribute("kind") String kind, Model model){
        log.info("/menu/menuList GET! - kind: {}",kind);
        List<Menu> menus = menuService.findAllService(kind);
        log.info("list - {}",menus);
        model.addAttribute("list",menus);
        return "menu/menuList";
    }
    @GetMapping("/addMenu")
    public String addMenuForm() {

        return "menu/addMenuForm";
    }
    @PostMapping("/addMenu")
    public String addMenu(Menu menu, HttpSession session){
        log.info("/menu/addMenuFrom POST! - {}", menu);
        log.info(menu.getNameEn());
        log.info(menu.getDesignStory());
        boolean flag = menuService.saveService(menu);
        return "redirect:/menu/list";

    }
    @GetMapping("/menuListDetail")
    public String detail(int id, Model model){
        log.info("/menu/menuListDetail GET! - id:{}",id);
        Menu menu = menuService.findOneService(id);
        model.addAttribute("menu", menu);

        return "menu/menuListDetail";
    }
    @DeleteMapping("/deleteMenulist")
    public ResponseEntity<String> delete(@RequestBody String id){
        log.info("/menu/deleteMenulist Get! id - {}", id);
        int nid = Integer.parseInt(id);
        String img = menuService.findOneService(nid).getImage(); // 이미지경로저장.
        boolean flag = menuService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
            return FileUtils.deleteFile(img, UPLOAD_PATH); // 파일 삭제
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
    @GetMapping("/editmenuListForm")
    public String editmenuListForm(String id, Model model){
        Menu menu = menuService.findOneService(Integer.parseInt(id));
        model.addAttribute("menu",menu);
        return "menu/editmenuListForm";
    }
}
