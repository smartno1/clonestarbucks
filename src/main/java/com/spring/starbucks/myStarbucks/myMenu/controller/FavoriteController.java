package com.spring.starbucks.myStarbucks.myMenu.controller;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.myStarbucks.myMenu.domain.Favorite;
import com.spring.starbucks.myStarbucks.myMenu.service.FavoriteService;
import com.spring.starbucks.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/myStarbucks/favorite")
public class FavoriteController {

    private final FavoriteService favoriteService;

    @GetMapping("/list")
    public String favoriteList(Search search, Model model, HttpSession session){
        search.setType("account");
        search.setKeyword(LoginUtils.getCurrentMemberAccount(session));
        Map<String, List> map = favoriteService.findAll(search);
        model.addAttribute("coffees", map.get("coffees"));
        model.addAttribute("menus",map.get("menus"));

        return "myStarbucks/favorite/favoriteList";
    }

    @Transactional
    @PostMapping("/add")
    public ResponseEntity<String> favoriteAdd(@RequestBody Map<String, String> param, HttpSession session){
        log.info("/favorite/addCoffee POST! - {}", param.get("id"));

        Favorite favorite = new Favorite();
        favorite.setAccount(LoginUtils.getCurrentMemberAccount(session));
        favorite.setType(param.get("type"));
        favorite.setTypeId(Integer.parseInt(param.get("id")));
        log.info("favorite add - {}", favorite);

        if(favoriteService.findOneService(favorite) != null){
            log.info("favorite exist");
            return new ResponseEntity<>("exist", HttpStatus.EXPECTATION_FAILED);
        }

        boolean flag = favoriteService.saveService(favorite);

        if(flag){
            log.info("favorite save success");
            return new ResponseEntity<>("success", HttpStatus.OK);
        }
        log.info("favorite save fail");
        return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
    }

    @Transactional
    @PostMapping("/delete")
    @ResponseBody
    public String favoriteDelete(@RequestBody Map<String, String> param, HttpSession session){
        log.info("favorite delete : {}",param);
        Favorite favorite = new Favorite();
        favorite.setAccount(LoginUtils.getCurrentMemberAccount(session));
        favorite.setType(param.get("type"));
        favorite.setTypeId(Integer.parseInt(param.get("id")));
        log.info("favorite except - {}", favorite);
        favorite = favoriteService.findOneService(favorite);
        String msg;
        if(favorite == null){
            return "no_exist";
        }
        if(favoriteService.delete(favorite.getMyFavoriteId())){
            return "success";
        }
        return "fail";

    }

}

