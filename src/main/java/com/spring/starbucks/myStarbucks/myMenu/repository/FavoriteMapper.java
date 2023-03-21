package com.spring.starbucks.myStarbucks.myMenu.repository;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.myStarbucks.myMenu.domain.Favorite;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavoriteMapper {

    boolean save (Favorite favorite);

    Favorite findOne (Favorite favorite);

    List<Favorite> findAll(Search search);

    int getTotalCount(Search search);

    boolean update(Favorite favorite);

    boolean delete(int id);
}
