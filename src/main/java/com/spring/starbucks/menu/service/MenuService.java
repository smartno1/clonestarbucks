package com.spring.starbucks.menu.service;

import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.repository.MenuMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuService {

    private final MenuMapper menuMapper;

    public boolean insertService(Menu menu){

        return menuMapper.insert(menu);
    }

    public List<Menu> findAllService(){
        return menuMapper.findAll();
    }
}
