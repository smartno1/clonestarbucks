package com.spring.starbucks.myStarbucks.myMenu.service;

import com.spring.starbucks.coffee.bean.domain.Coffee;
import com.spring.starbucks.coffee.bean.repository.CoffeeMapper;
import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.myStarbucks.myMenu.domain.Favorite;
import com.spring.starbucks.myStarbucks.myMenu.repository.FavoriteMapper;
import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.repository.MenuMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Log4j2
public class FavoriteService {

    private final FavoriteMapper favoriteMapper;

    private final CoffeeMapper coffeeMapper;
    private final MenuMapper menuMapper;

    public boolean saveService(Favorite favorite){
        return favoriteMapper.save(favorite);
    }
    public Favorite findOneService(Favorite favorite){
        return favoriteMapper.findOne(favorite);
    }

    public Map<String, List> findAll(Search search){
        log.info("favorite findAll : {}", search);
        List<Coffee> coffees = new ArrayList<>();
        List<Menu> menus = new ArrayList<>();
        List<Favorite> list = favoriteMapper.findAll(search);
        for(Favorite m : list){
            if(m.getType().equals("coffeeBean")){
                coffees.add(coffeeMapper.findOne(m.getTypeId()));
            }else if(m.getType().equals("menu")){
                menus.add(menuMapper.findOne(m.getTypeId()));
            }
        }
        Map<String, List> map = new HashMap<>();
        map.put("coffees", coffees);
        map.put("menus", menus);

        return map;
    }

    public boolean update(Favorite favorite){
        return favoriteMapper.update(favorite);
    }

    public boolean delete(int id){
        return favoriteMapper.delete(id);
    }


}
