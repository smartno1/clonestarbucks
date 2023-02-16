package com.spring.starbucks.favorite.service;

import com.spring.starbucks.favorite.domain.Favorite;
import com.spring.starbucks.favorite.repository.FavoriteMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Log4j2
public class FavoriteService {

    private final FavoriteMapper favoriteMapper;

    public boolean saveService(Favorite favorite){
        return favoriteMapper.save(favorite);
    }
    public Favorite findOneService(Favorite favorite){
        return favoriteMapper.findOne(favorite);
    }
}
