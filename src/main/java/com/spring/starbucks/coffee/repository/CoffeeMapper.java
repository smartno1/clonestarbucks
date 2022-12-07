package com.spring.starbucks.coffee.repository;


import com.spring.starbucks.coffee.domain.Coffee;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CoffeeMapper {

    Coffee findOne(int id);

    List<Coffee> findAll();

    boolean save(Coffee coffee);

    boolean update(Coffee coffee);

    boolean delete(int id);

}
