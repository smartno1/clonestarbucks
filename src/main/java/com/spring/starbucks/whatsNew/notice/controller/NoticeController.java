package com.spring.starbucks.whatsNew.notice.controller;

import com.spring.starbucks.coffee.bean.upload.FileUtils;
import com.spring.starbucks.common.paging.Page;
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

import java.util.ArrayList;
import java.util.List;

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

        model.addAttribute("n", notice);
        return "whats_new/notice/editNotice";
    }

    @Transactional
    @PostMapping("/edit")
    public String update(Notice notice, Model model){
        log.info("POST update start - {}", notice);

        // 수정한 첨부파일과 기존의 첨부파일 목록을 비교하여 삭제된 파일경로를 찾아 파일 삭제.
        Notice n = noticeService.findOne(notice.getNoticeId());
        if(n.getAttach() != null) {
            String[] list = n.getAttach().split(",");
            log.info("list - {}", list);
            for (String p : list) {
                log.info("p - {}", p);
                if (!notice.getAttach().contains(p)) {
                    log.info("delete - {}", p);
                    FileUtils.deleteFile(p, UPLOAD_PATH);
                }
            }
        }

        boolean flag = noticeService.updateService(notice);

        return "redirect:/whats_new/notice/detail?noticeId="+notice.getNoticeId();
    }

    @Transactional
    @DeleteMapping("/delete")
    @ResponseBody
    public ResponseEntity<String> delete(@RequestBody String id){
        log.info("delete start 'id' - {}", id);
        int nid = Integer.parseInt(id);
        Notice n = noticeService.findOne(nid);
        String attach = n.getAttach();  // 첨부파일 경로저장.
        boolean flag = noticeService.delete(nid);  // DB 삭제

        if(flag){   //DB 삭제 성공시
            List<String> result= new ArrayList<>(); // 첨부파일 삭제 결과를 담을 리스트
            if(attach != null) {
                String[] attachList = attach.split(",");
                for(String p : attachList){
                    result.add(FileUtils.deleteFile(p,UPLOAD_PATH)); // 첨부파일 삭제하고 결과를 리스트에 담기
                }
            }
            if(result.contains("fail")) return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
            return new ResponseEntity<>("delete success" ,HttpStatus.OK);
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }
}
