package com.spring.starbucks.coffee.bean.service;

import com.spring.starbucks.coffee.bean.domain.Coffee;
import com.spring.starbucks.coffee.bean.domain.Tastedto;
import com.spring.starbucks.coffee.bean.repository.CoffeeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class CoffeeService {

    private final CoffeeMapper coffeeMapper;

    public Coffee findOneService(int id){
        return coffeeMapper.findOne(id);
    }

    public List<Coffee> findAllService(String kind){
        return coffeeMapper.findAll(kind);
    }

    public List<Coffee> findAll2Service(Tastedto tastedto){
        return coffeeMapper.findAll2(tastedto);
    }

    public boolean saveService(Coffee coffee){
        return coffeeMapper.save(coffee);
    }

    public boolean updateService(Coffee coffee){
        return coffeeMapper.update(coffee);
    }

    public boolean deleteService(int id){
        return coffeeMapper.delete(id);
    }



}
