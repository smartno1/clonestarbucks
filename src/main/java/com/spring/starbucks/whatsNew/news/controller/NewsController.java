package com.spring.starbucks.whatsNew.news.controller;

import com.spring.starbucks.util.FileUtils;
import com.spring.starbucks.common.paging.PageMaker;
import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.news.domain.News;
import com.spring.starbucks.whatsNew.news.service.NewsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@Log4j2
@RequiredArgsConstructor
@PropertySource("classpath:upLoadPath.properties")
@RequestMapping("/whats_new/news")
public class NewsController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final NewsService newsService;

    @GetMapping("/list")
    public String findAll(@ModelAttribute("s") Search search, Model model){
        List<News> nList;
        PageMaker pm;
        if( search.getKind() == null || Objects.equals(search.getKind(), "") || Objects.equals(search.getKind(),"ALL")) {
            log.info("search 1 start - {}",search);
            nList = newsService.findAllService(search);
            pm = new PageMaker(search, newsService.getTotalCount(search));
            model.addAttribute("kind", "ALL");
        }else {
            log.info("search 2 start - {}",search);
            nList = newsService.findAllService2(search);
            pm = new PageMaker(search, newsService.getTotalCount2(search));
            log.info("nList - {}", nList);
            model.addAttribute("kind", search.getKind());
        }
        model.addAttribute("nList", nList);
        model.addAttribute("pm", pm);

        return "whats_new/news/newsList";
    }


    @GetMapping("/detail")
    public String findOne(String newsId, Search search, Model model){
        log.info("GET DETAIL newsID - {}",newsId );
        int nId = Integer.parseInt(newsId);
        News n = newsService.findOne(nId);
        News prev = newsService.findOne(nId-1);
        News next = newsService.findOne(nId+1);

        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        model.addAttribute("n",n);
        model.addAttribute("s", search);

        return "whats_new/news/newsDetail";
    }

    @GetMapping("/add")
    public String addForm(){
        return "whats_new/news/newsAdd";
    }

    @Transactional
    @PostMapping("/add")
    public String add(News news){
        log.info("POST ADD - {}", news);
        boolean flag = newsService.insertService(news);

        return "redirect:/whats_new/news/list";
    }

    @GetMapping("/edit")
    public String editForm(Integer newsId, Model model){
        News n = newsService.findOne(newsId);
        model.addAttribute("n", n);

        return "whats_new/news/newsEdit";
    }

    @Transactional
    @PostMapping("/edit")
    public String edit(News edit) {
        log.info("POST edit - {}",edit);
        // ????????? ??????????????? ????????? ???????????? ????????? ???????????? ????????? ??????????????? ?????? ?????? ??????.
        News n = newsService.findOne(edit.getNewsId());
        if(n.getAttach() != null) {
            String[] list = n.getAttach().split(",");
            log.info("list - {}", list);
            for (String p : list) {
                log.info("p - {}", p);
                if (!edit.getAttach().contains(p)) {
                    log.info("delete - {}", p);
                    FileUtils.deleteFile(p, UPLOAD_PATH);
                }
            }
        }

        boolean flag=newsService.updateService(edit);
        return "redirect:/whats_new/news/detail?newsId="+edit.getNewsId();
    }

    @Transactional
    @PostMapping("/delete")
    public ResponseEntity<String> deleteImg(@RequestBody String id){
        log.info("/whats_new/news/deleteImg id - {}", id);
        int nid = Integer.parseInt(id);
        News news = newsService.findOne(nid); // ?????????????????????.
        String img = news.getListImg();
        String attach = news.getAttach();
        boolean flag = newsService.delete(nid);            // DB ??????

        if(flag){   //DB ?????? ?????????
            List<String> result= new ArrayList<>();
            if(attach != null) {
                String[] attachList = attach.split(",");
                for(String p : attachList){
                    result.add(FileUtils.deleteFile(p,UPLOAD_PATH)); // ???????????? ??????
                }
            }
            result.add(FileUtils.deleteFile(img, UPLOAD_PATH)); // ????????? ????????? ?????? ??????
            if(result.contains("fail")) return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
            return new ResponseEntity<>("delete success" ,HttpStatus.OK);
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }


}
