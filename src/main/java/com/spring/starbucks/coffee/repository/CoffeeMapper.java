package com.spring.starbucks.coffee.repository;


import com.spring.starbucks.coffee.domain.Coffee;
import com.spring.starbucks.coffee.domain.Tastedto;
import com.spring.starbucks.favorite.domain.Favorite;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CoffeeMapper {

    Coffee findOne(int id);

    List<Coffee> findAll(String kind);

    List<Coffee> findAll2(Tastedto tastedto);

    boolean save(Coffee coffee);

    boolean update(Coffee coffee);

    boolean delete(int id);


}
