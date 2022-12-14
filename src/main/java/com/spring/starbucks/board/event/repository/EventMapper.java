package com.spring.starbucks.board.event.repository;

import com.spring.starbucks.board.event.domain.Event;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventMapper {

    boolean insert(Event event);

    List<Event> findAll();

    Event findOne(int id);

    boolean update(Event event);

    boolean delete(int id);


}
