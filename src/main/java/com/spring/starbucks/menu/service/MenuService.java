package com.spring.starbucks.menu.service;

import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.repository.MenuMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class MenuService {

    private final MenuMapper menuMapper;

//    public boolean insertService(Menu menu){
//
//        return menuMapper.insert(menu);
//    }
    public Menu findOneService(int id){
        return menuMapper.findOne(id);
    }

    public List<Menu> findAllService(String kind){
        return menuMapper.findAll(kind);
    }

    public boolean saveService(Menu menu){
        return menuMapper.save(menu);
    }

    public boolean updateService(Menu menu){
        return menuMapper.update(menu);
    }

    public boolean deleteService(int id){
        return menuMapper.delete(id);
    }

}
