package com.spring.starbucks.menu.repository;

import com.spring.starbucks.menu.domain.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {

    boolean insert(Menu menu);

    boolean update(Menu menu);

    boolean delete(int id);

    List<Menu> findAll();

    Menu findOne(int id);

}
