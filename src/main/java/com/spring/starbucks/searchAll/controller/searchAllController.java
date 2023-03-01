package com.spring.starbucks.searchAll.controller;

import com.spring.starbucks.coffee.bean.domain.Coffee;
import com.spring.starbucks.coffee.bean.service.CoffeeService;
import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.menu.service.MenuService;
import com.spring.starbucks.whatsNew.event.domain.Event;
import com.spring.starbucks.whatsNew.event.service.EventService;
import com.spring.starbucks.whatsNew.news.domain.News;
import com.spring.starbucks.whatsNew.news.service.NewsService;
import com.spring.starbucks.whatsNew.notice.domain.Notice;
import com.spring.starbucks.whatsNew.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Log4j2
public class searchAllController {

    private final CoffeeService coffeeService;
    private final MenuService menuService;
    private final EventService eventService;
    private final NewsService newsService;
    private final NoticeService noticeService;


    @GetMapping("/search-all")
    public String searchAll(Search search, Model model){
        log.info("search - {}", search);

        List<Coffee> coffee = coffeeService.findAllService(search);
        List<Menu> menu = menuService.findAllService(search);
        List<Event> event = eventService.findAllService(search);
        List<News> news = newsService.findAllService(search);
        List<Notice> notice = noticeService.findAllService(search);
        log.info("cofee-{}",coffee);
        log.info("menu-{}",menu);
        log.info("event-{}",event);
        log.info("news-{}",news);
        log.info("notice-{}",notice);
        model.addAttribute("bean",coffee);
        model.addAttribute("menu",menu);
        model.addAttribute("event",event);
        model.addAttribute("news",news);
        model.addAttribute("notice",notice);
        model.addAttribute("keyword", search.getKeyword());

        return "searchAll/searchAll";

    }
}
