package com.spring.starbucks.favorite.repository;

import com.spring.starbucks.favorite.domain.Favorite;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FavoriteMapper {

    boolean save (Favorite favorite);

    Favorite findOne (Favorite favorite);
}
