package com.spring.starbucks.whatsNew.news.service;


import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.news.domain.Kind;
import com.spring.starbucks.whatsNew.news.domain.News;
import com.spring.starbucks.whatsNew.news.domain.SearchKind;
import com.spring.starbucks.whatsNew.news.repository.NewsMapper;
import com.spring.starbucks.whatsNew.notice.domain.Notice;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class NewsService {

    private final NewsMapper newsMapper;

    public List<News> findAllService(Search search){
        return newsMapper.findAll(search);
    }
    public List<News> findAllService2(Search search){
        return newsMapper.findAll2(search);
    }

    public News findOne(int newsId){
        return newsMapper.findOne(newsId);
    }

    public boolean insertService(News news){
        return newsMapper.insert(news);
    }

    public boolean updateService(News news){
        return newsMapper.update(news);
    }

    public boolean delete(int newsId){
        return newsMapper.delete(newsId);
    }

    public int getTotalCount(Search search){
        return newsMapper.getTotalCount(search);
    }

    public int getTotalCount2(Search search){
        return newsMapper.getTotalCount2(search);
    }


}
