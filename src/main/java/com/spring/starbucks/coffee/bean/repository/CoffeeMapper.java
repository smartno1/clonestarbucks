package com.spring.starbucks.coffee.bean.repository;


import com.spring.starbucks.coffee.bean.domain.Tastedto;
import com.spring.starbucks.coffee.bean.domain.Coffee;
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
