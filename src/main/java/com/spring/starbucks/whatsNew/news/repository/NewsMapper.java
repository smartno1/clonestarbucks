package com.spring.starbucks.whatsNew.news.repository;

import com.spring.starbucks.whatsNew.news.domain.News;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsMapper {

    boolean insert(News news);

    List<News> findAll();

    boolean update(News news);

    boolean delete(int newsId);

}
