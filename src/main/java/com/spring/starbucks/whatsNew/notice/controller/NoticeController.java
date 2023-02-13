package com.spring.starbucks.whatsNew.notice.controller;

import com.spring.starbucks.common.paging.Page;
import com.spring.starbucks.common.paging.PageMaker;
import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.notice.domain.Notice;
import com.spring.starbucks.whatsNew.notice.repository.NoticeMapper;
import com.spring.starbucks.whatsNew.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/whats_new/notice")
public class NoticeController {

    final private NoticeService noticeService;
    final private NoticeMapper noticeMapper;

    @GetMapping("/list")
    public String findAll2(Page page, @ModelAttribute("s") Search search, Model model){

        List<Notice> nList = noticeService.findAllService(search);

        PageMaker pm = new PageMaker(page, noticeMapper.getTotalCount2(search));

        model.addAttribute("nList", nList);
        model.addAttribute("pm", pm);

        return "whats_new/notice/noticeList";
    }

    @GetMapping("/detail")
    public String findOne(int noticeId, Model model){
        Notice notice = noticeService.findOne(noticeId);
        Notice prevNotice = noticeService.findOne(noticeId-1);
        Notice nextNotice = noticeService.findOne(noticeId+1);
        model.addAttribute("nt", notice);
        model.addAttribute("prevNt", prevNotice);
        model.addAttribute("nextNt", nextNotice);

        noticeService.upViewCount(noticeId); // 조회수 카운트

        return "whats_new/notice/noticeDetail";
    }

    @GetMapping("/add")
    public String add(){
        log.info("Get add start");
        return "whats_new/notice/addNotice";
    }

    @PostMapping("/add")
    public String addNotice(Notice notice){
        log.info("Post add start - {}", notice);
        boolean flag = noticeService.insertService(notice);
        return "redirect:/whats_new/notice/list";
    }

    @GetMapping("/edit")
    public String edit(int noticeId, Model model){
        Notice notice = noticeService.findOne(noticeId);

        model.addAttribute("nt", notice);
        return "whats_new/notice/editNotice";
    }

    @Transactional
    @PostMapping("/edit")
    public String update(Notice notice, Model model){
        log.info("POST update start - {}", notice);
        boolean flag = noticeService.updateService(notice);

        return "redirect:/whats_new/notice/detail?noticeId="+notice.getNoticeId();
    }

    @Transactional
    @DeleteMapping("/delete")
    @ResponseBody
    public ResponseEntity<String> delete(@RequestBody String id){
        log.info("delete start 'id' - {}", id);
        boolean flag = noticeService.delete(Integer.parseInt(id));
        ResponseEntity<String> re;
        if(flag){
            re = new ResponseEntity<String>("delete success", HttpStatus.OK);
        }else{
            re = new ResponseEntity<String>("delete fail", HttpStatus.BAD_REQUEST);
        }

        return re;
    }
}
