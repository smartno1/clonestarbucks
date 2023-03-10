package com.spring.starbucks.whatsNew.event.repository;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.event.domain.Event;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface EventMapper {

    boolean insert(Event event);

    List<Event> findAll(Search search);

    Event findOne(int id);

    boolean update(Event event);

    boolean delete(int id);


}
