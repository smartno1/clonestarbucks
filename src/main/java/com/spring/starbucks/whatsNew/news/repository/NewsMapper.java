package com.spring.starbucks.whatsNew.news.repository;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.news.domain.Kind;
import com.spring.starbucks.whatsNew.news.domain.News;
import com.spring.starbucks.whatsNew.news.domain.SearchKind;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsMapper {

    List<News> findAll(Search search);
    List<News> findAll2(Search search);

    int getTotalCount(Search search);
    int getTotalCount2(Search search);

    News findOne(int newsId);

    boolean insert(News news);

    boolean update(News news);

    boolean delete(int newsId);


}
