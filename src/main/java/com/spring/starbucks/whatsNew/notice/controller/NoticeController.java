package com.spring.starbucks.whatsNew.notice.controller;

import com.spring.starbucks.util.FileUtils;
import com.spring.starbucks.common.paging.PageMaker;
import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.news.domain.News;
import com.spring.starbucks.whatsNew.notice.domain.Notice;
import com.spring.starbucks.whatsNew.notice.repository.NoticeMapper;
import com.spring.starbucks.whatsNew.notice.service.NoticeService;
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
@RequestMapping("/whats_new/notice")
public class NoticeController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    final private NoticeService noticeService;
    final private NoticeMapper noticeMapper;

    @GetMapping("/list")
    public String findAll2(@ModelAttribute("s") Search search, Model model){

        List<Notice> nList = noticeService.findAllService(search);
        log.info("pageNum - {}", search.getPageNum());
        PageMaker pm = new PageMaker(search, noticeMapper.getTotalCount2(search));

        model.addAttribute("nList", nList);
        model.addAttribute("pm", pm);

        log.info("nList - {}",nList);

        return "whats_new/notice/noticeList";
    }
    @GetMapping("/indexNotice")
    @ResponseBody
    public List<Notice> indexNotice(Search search){
        log.info("amount - {}",search.getAmount());
        List<Notice> nl = noticeService.findAllService(search);
        log.info("index nl - {}", nl);
        return nl;
    }

    @GetMapping("/detail")
    public String findOne(int noticeId, @ModelAttribute("s") Search search,Model model){
        Notice notice = noticeService.findOne(noticeId);
        Notice prevNotice = noticeService.findOne(noticeId-1);
        Notice nextNotice = noticeService.findOne(noticeId+1);
        model.addAttribute("nt", notice);
        model.addAttribute("prevNt", prevNotice);
        model.addAttribute("nextNt", nextNotice);
        log.info("search - {}",search);

        noticeService.upViewCount(noticeId); // ????????? ?????????

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

        model.addAttribute("n", notice);
        return "whats_new/notice/editNotice";
    }

    @Transactional
    @PostMapping("/edit")
    public String update(Notice edit){
        log.info("POST update start - {}", edit);

        // ????????? ??????????????? ????????? ???????????? ????????? ???????????? ????????? ??????????????? ?????? ?????? ??????.
        Notice n = noticeService.findOne(edit.getNoticeId());
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

        boolean flag = noticeService.updateService(edit);

        return "redirect:/whats_new/notice/detail?noticeId="+edit.getNoticeId();
    }

    @Transactional
    @DeleteMapping("/delete")
    @ResponseBody
    public ResponseEntity<String> delete(@RequestBody String id){
        log.info("delete start 'id' - {}", id);
        int nid = Integer.parseInt(id);
        Notice n = noticeService.findOne(nid);
        String attach = n.getAttach();  // ???????????? ????????????.
        boolean flag = noticeService.delete(nid);  // DB ??????

        if(flag){   //DB ?????? ?????????
            List<String> result= new ArrayList<>(); // ???????????? ?????? ????????? ?????? ?????????
            if(attach != null) {
                String[] attachList = attach.split(",");
                for(String p : attachList){
                    result.add(FileUtils.deleteFile(p,UPLOAD_PATH)); // ???????????? ???????????? ????????? ???????????? ??????
                }
            }
            if(result.contains("fail")) return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
            return new ResponseEntity<>("delete success" ,HttpStatus.OK);
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
}
