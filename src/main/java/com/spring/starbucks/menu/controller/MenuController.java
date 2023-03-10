package com.spring.starbucks.menu.controller;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.menu.upload.FileUtils;
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
    public String menuList(Search search, Model model){
        log.info("/menu/menuList GET! - kind: {}",search.getKind());
        log.info("type - {}", search.getType());
        List<Menu> menus = menuService.findAllService(search);
        log.info("list - {}",menus);
        model.addAttribute("list",menus);
        model.addAttribute("type", search.getKeyword());
        model.addAttribute("kind", search.getKind());
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
        String img = menuService.findOneService(nid).getImage(); // ?????????????????????.
        boolean flag = menuService.deleteService(nid);            // DB ??????

        if(flag){   //DB ?????? ?????????
            return FileUtils.deleteFile(img, UPLOAD_PATH); // ?????? ??????
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
    @PostMapping("/update")
    public String edit(Menu menu, HttpSession session){
        menu.setId(Integer.parseInt(menu.getSid()));
        log.info("/menu/editmenuListForm POST! - {}", menu);
        log.info(menu.getNameEn());
        log.info(menu.getDesignStory());
        boolean flag = menuService.updateService(menu);

        return "redirect:/menu/menuListDetail?id="+menu.getId();

    }

    @GetMapping("/food")
    public String foodmList(@ModelAttribute("kind") String kind, String type, Model model){
        log.info("/menu/foodList GET! - kind: {}",kind);
        log.info("type - {}", type);
        Search search = new Search();
        search.setType("kind");
        search.setKeyword(kind);
        List<Menu> menus = menuService.findAllService(search);
        log.info("food - {}",menus);
        model.addAttribute("food",menus);
        model.addAttribute("type", type);
        return "menu/foodList";
    }
    @GetMapping("/foodeditListForm")
    public String foodeditListForm(String id, Model model){
        Menu menu = menuService.findOneService(Integer.parseInt(id));
        model.addAttribute("menu",menu);
        return "menu/foodeditListForm";
    }
    @GetMapping("/foodaddMenu")
    public String foodaddMenuForm() {

        return "menu/foodaddMenuForm";
    }
    @PostMapping("/foodaddMenu")
    public String foodaddMenu(Menu menu, HttpSession session){
        log.info("/menu/foodaddMenuFrom POST! - {}", menu);
        log.info(menu.getNameEn());
        log.info(menu.getDesignStory());
        boolean flag = menuService.saveService(menu);
        return "redirect:/menu/food";

    }

    @DeleteMapping("/fooddeleteMenulist")
    public ResponseEntity<String> fooddelete(@RequestBody String id){
        log.info("/menu/fooddeleteMenulist Get! id - {}", id);
        int nid = Integer.parseInt(id);
        String img = menuService.findOneService(nid).getImage(); // ?????????????????????.
        boolean flag = menuService.deleteService(nid);            // DB ??????

        if(flag){   //DB ?????? ?????????
            return FileUtils.deleteFile(img, UPLOAD_PATH); // ?????? ??????
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
    @GetMapping("/foodListDetail")
    public String foodListDetail(int id, Model model){
        log.info("/menu/foodListDetail GET! - id:{}",id);
        Menu menu = menuService.findOneService(id);
        model.addAttribute("menu", menu);

        return "menu/foodListDetail";
    }







    @GetMapping("/sangpum")
    public String sangpumList(@ModelAttribute("kind") String kind, String type, Model model){
        log.info("/menu/sangpumlist GET! - kind: {}",kind);
        log.info("type - {}", type);
        Search search = new Search();
        search.setType("kind");
        search.setKeyword(kind);
        List<Menu> menus = menuService.findAllService(search);
        log.info("sangpum - {}",menus);
        model.addAttribute("sangpum",menus);
        model.addAttribute("type", type);
        return "menu/sangpumlist";
    }
    @GetMapping("/sangpumaddMenu")
    public String sangpumaddMenuForm() {

        return "menu/sangpumaddMenuForm";
    }
    @PostMapping("/sangpumaddMenu")
    public String fsangpumaddMenu(Menu menu, HttpSession session){
        log.info("/menu/sangpumaddMenuFrom POST! - {}", menu);
        log.info(menu.getNameEn());
        log.info(menu.getDesignStory());
        boolean flag = menuService.saveService(menu);
        return "redirect:/menu/sangpum";

    }

    @GetMapping("/sangpumListDetail")
    public String sangpumListDetail(int id, Model model){
        log.info("/menu/sangpumListDetail GET! - id:{}",id);
        Menu menu = menuService.findOneService(id);
        model.addAttribute("menu", menu);

        return "menu/sangpumListDetail";
    }
    @DeleteMapping("/sangpumMenulist")
    public ResponseEntity<String> sangpumdelete(@RequestBody String id){
        log.info("/menu/sangpumMenulist Get! id - {}", id);
        int nid = Integer.parseInt(id);
        String img = menuService.findOneService(nid).getImage(); // ?????????????????????.
        boolean flag = menuService.deleteService(nid);            // DB ??????

        if(flag){   //DB ?????? ?????????
            return FileUtils.deleteFile(img, UPLOAD_PATH); // ?????? ??????
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
    @GetMapping("/sangpumeditListForm")
    public String sangpumeditListForm(String id, Model model){
        Menu menu = menuService.findOneService(Integer.parseInt(id));
        model.addAttribute("menu",menu);
        return "menu/sangpumeditListForm";
    }
}
