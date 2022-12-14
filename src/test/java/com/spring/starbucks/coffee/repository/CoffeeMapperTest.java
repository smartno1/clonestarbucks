package com.spring.starbucks.coffee.repository;

import com.spring.starbucks.coffee.bean.repository.CoffeeMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CoffeeMapperTest {

    @Autowired
    CoffeeMapper coffeeMapper;

    @Test
    @DisplayName("300개 게시물을 삽입한다.")
    void bulkInsert() {

    }

    @Test
    void findOne() {

    }

    @Test
    void findAll() {
    }

    @Test
    void update() {
    }

    @Test
    void delete() {
    }
}