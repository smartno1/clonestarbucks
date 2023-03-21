package com.spring.starbucks.menu.controller;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.menu.upload.FileUtils;
import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.service.MenuService;
import com.spring.starbucks.util.LoginUtils;
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

    @GetMapping("/drinkList")
    public String drinkList(Search search, Model model){
        log.info("/menu/menuList GET! - kind: {}",search.getKind());
        log.info("type - {}", search.getType());
        List<Menu> menus = menuService.findAllService(search);
        log.info("list - {}",menus);
        model.addAttribute("list",menus);
        model.addAttribute("type", search.getKeyword());
        model.addAttribute("kind", search.getKind());
        return "menu/drinkList";
    }

    @GetMapping("/drinkAdd")
    public String drinkAddFrom() {

        return "menu/drinkAddForm";
    }
    @PostMapping("/drinkAdd")
    public String drinkAdd(Menu menu, HttpSession session){
        log.info("/menu/addMenuFrom POST! - {}", menu);
        menu.setRegister(LoginUtils.getCurrentMemberAccount(session));
        boolean flag = menuService.saveService(menu);
        return "redirect:/menu/drinkList";

    }
    @GetMapping("/drinkDetail")
    public String drinkDetail(int id, Model model){
        log.info("/menu/drinkDetail GET! - id:{}",id);
        Menu menu = menuService.findOneService(id);
        model.addAttribute("menu", menu);

        return "menu/drinkDetail";
    }
    @DeleteMapping("/drinkDelete")
    public ResponseEntity<String> drinkDelete(@RequestBody String id){
        log.info("/menu/deleteDrink Get! id - {}", id);
        int nid = Integer.parseInt(id);
        String img = menuService.findOneService(nid).getImage(); // 이미지경로저장.
        boolean flag = menuService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
            return FileUtils.deleteFile(img, UPLOAD_PATH); // 파일 삭제
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
    @GetMapping("/drinkEdit")
    public String drinkEditForm(String id, Model model){
        Menu menu = menuService.findOneService(Integer.parseInt(id));
        model.addAttribute("menu",menu);
        return "menu/drinkEditForm";
    }
    @PostMapping("/drinkEdit")
    public String drinkEdit(Menu menu, HttpSession session){
        menu.setId(Integer.parseInt(menu.getSid()));
        log.info("/menu/editDrink POST! - {}", menu);
        menu.setRegister(LoginUtils.getCurrentMemberAccount(session));
        boolean flag = menuService.updateService(menu);

        return "redirect:/menu/drinkDetail?id="+menu.getId();

    }

    @GetMapping("/foodList")
    public String foodList(Search search, Model model){
        log.info("/menu/foodList GET! - kind: {}",search.getKind());
        List<Menu> menus = menuService.findAllService(search);
        log.info("list - {}",menus);
        model.addAttribute("list",menus);
        model.addAttribute("type", search.getKeyword());
        model.addAttribute("kind", search.getKind());
        return "menu/foodList";
    }
    @GetMapping("/foodEdit")
    public String foodEditForm(String id, Model model){
        Menu menu = menuService.findOneService(Integer.parseInt(id));
        model.addAttribute("menu",menu);
        return "menu/foodEditForm";
    }
    @PostMapping("/foodEdit")
    public String foodEdit(Menu menu, HttpSession session){
        menu.setId(Integer.parseInt(menu.getSid()));
        log.info("/menu/foodEdit POST! - {}", menu);
        menu.setRegister(LoginUtils.getCurrentMemberAccount(session));
        boolean flag = menuService.updateService(menu);

        return "redirect:/menu/foodDetail?id="+menu.getId();
    }
    @GetMapping("/foodAdd")
    public String foodAddForm() {

        return "menu/foodAddForm";
    }
    @PostMapping("/foodAdd")
    public String foodAdd(Menu menu, HttpSession session){
        log.info("/menu/foodAdd POST! - {}", menu);
        menu.setRegister(LoginUtils.getCurrentMemberAccount(session));
        boolean flag = menuService.saveService(menu);
        return "redirect:/menu/food";

    }

    @DeleteMapping("/foodDelete")
    public ResponseEntity<String> foodDelete(@RequestBody String id){
        log.info("/menu/foodDelete id - {}", id);
        int nid = Integer.parseInt(id);
        String img = menuService.findOneService(nid).getImage(); // 이미지경로저장.
        boolean flag = menuService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
            return FileUtils.deleteFile(img, UPLOAD_PATH); // 파일 삭제
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
    @GetMapping("/foodDetail")
    public String foodDetail(int id, Model model){
        log.info("/menu/foodListDetail GET! - id:{}",id);
        Menu menu = menuService.findOneService(id);
        model.addAttribute("menu", menu);

        return "menu/foodDetail";
    }







    @GetMapping("/productList")
    public String productList(Search search, Model model){
        log.info("/menu/productList GET! - kind: {}",search.getKind());
        List<Menu> menus = menuService.findAllService(search);
        log.info("list - {}",menus);
        model.addAttribute("list",menus);
        model.addAttribute("type", search.getKeyword());
        model.addAttribute("kind", search.getKind());
        return "menu/productList";
    }
    @GetMapping("/productAdd")
    public String productAddForm() {

        return "menu/productAddForm";
    }
    @PostMapping("/productAdd")
    public String productAdd(Menu menu, HttpSession session){
        log.info("/menu/productAdd POST! - {}", menu);
        menu.setRegister(LoginUtils.getCurrentMemberAccount(session));
        boolean flag = menuService.saveService(menu);
        return "redirect:/menu/productList";

    }

    @GetMapping("/productDetail")
    public String productDetail(int id, Model model){
        log.info("/menu/productDetail GET! - id:{}",id);
        Menu menu = menuService.findOneService(id);
        model.addAttribute("menu", menu);

        return "menu/productDetail";
    }
    @DeleteMapping("/productDelete")
    public ResponseEntity<String> productDelete(@RequestBody String id){
        log.info("/menu/productDelete  id - {}", id);
        int nid = Integer.parseInt(id);
        String img = menuService.findOneService(nid).getImage(); // 이미지경로저장.
        boolean flag = menuService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
            return FileUtils.deleteFile(img, UPLOAD_PATH); // 파일 삭제
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
    @GetMapping("/productEdit")
    public String productEditForm(String id, Model model){
        Menu menu = menuService.findOneService(Integer.parseInt(id));
        model.addAttribute("menu",menu);
        return "menu/productEditForm";
    }
    @PostMapping("/productEdit")
    public String productEdit(Menu menu, HttpSession session){
        menu.setId(Integer.parseInt(menu.getSid()));
        log.info("/menu/productEdit POST! - {}", menu);
        menu.setRegister(LoginUtils.getCurrentMemberAccount(session));
        boolean flag = menuService.updateService(menu);

        return "redirect:/menu/productDetail?id="+menu.getId();
    }
}
