package com.spring.starbucks.coffee.service;

import com.spring.starbucks.coffee.domain.Coffee;
import com.spring.starbucks.coffee.repository.CoffeeMapper;
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

    public List<Coffee> findAllService(){
        return coffeeMapper.findAll();
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
