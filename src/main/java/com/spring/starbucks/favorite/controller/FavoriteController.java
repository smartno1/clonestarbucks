package com.spring.starbucks.favorite.controller;

import com.spring.starbucks.favorite.domain.Favorite;
import com.spring.starbucks.favorite.service.FavoriteService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/favorite")
public class FavoriteController {

    private final FavoriteService favoriteService;

    @Transactional
    @PostMapping("/addCoffee")
    public ResponseEntity<String> addFavorite(@RequestBody String id, HttpSession session){
        log.info("/favorite/addCoffee POST! - {}", id);

        Favorite favorite = new Favorite();
        favorite.setAccount("account");
        favorite.setType("coffee");
        favorite.setTypeId(Integer.parseInt(id));
        log.info("favorite - {}", favorite);

        if(favoriteService.findOneService(favorite) != null){
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
}

