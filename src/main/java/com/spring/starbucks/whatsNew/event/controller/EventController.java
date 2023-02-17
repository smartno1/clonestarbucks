package com.spring.starbucks.whatsNew.event.controller;

import com.spring.starbucks.util.FileUtils;
import com.spring.starbucks.whatsNew.event.domain.Event;
import com.spring.starbucks.whatsNew.event.service.EventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@PropertySource("classpath:upLoadPath.properties")
@RequestMapping("/whats_new/event")
public class EventController {

    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;
    private final EventService eventService;

    @GetMapping("/list")
    public String list( String kind, Model model){

        log.info("list start - {}",kind);
        if(kind == null){
            kind = "ALL";
        }
        List<Event> events = eventService.findAllService(kind);
        model.addAttribute("events", events);
        model.addAttribute("kind", kind);
        log.info("events - {}", events);
        log.info("kind - {}", kind);

        return "whats_new/event/eventList";
    }
    @GetMapping("/add")
    public String addForm(){
        return "whats_new/event/eventAdd";
    }

    @Transactional
    @PostMapping("/add")
    public String add(Event add){
        log.info("POST ADD - {}", add);

        add.setBeginDate(LocalDate.parse(add.getBeginDateStr()));
        add.setEndDate(LocalDate.parse(add.getEndDateStr()));

        boolean flag = eventService.saveService(add);

        return "redirect:/whats_new/event/list";
    }

    @GetMapping("/edit")
    public String editForm(Integer id, Model model){
        Event e = eventService.findOneService(id);
        model.addAttribute("n", e);
        return "whats_new/event/eventEdit";
    }

    @Transactional
    @PostMapping("/edit")
    public String edit(Event edit) {
        log.info("POST edit - {}",edit);

        edit.setBeginDate(LocalDate.parse(edit.getBeginDateStr()));
        edit.setEndDate(LocalDate.parse(edit.getEndDateStr()));

        Event n = eventService.findOneService(edit.getEventId());
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


        boolean flag=eventService.updateService(edit);
        return "redirect:/whats_new/event/detail?id="+edit.getEventId();
    }

    @GetMapping("/detail")
    public String detail(int id, String kind, Model model){
        Event event = eventService.findOneService(id);
        List<Event> events = eventService.findAllService("ALL");

        model.addAttribute("kind", kind);
        model.addAttribute("event", event);
        model.addAttribute("events", events);
        return "whats_new/event/eventDetail";
    }

    @Transactional
    @PostMapping("/delete")
    public ResponseEntity<String> deleteImg(@RequestBody String id){
        log.info("/whats_new/event/delete id - {}", id);
        int nid = Integer.parseInt(id);
        Event e = eventService.findOneService(nid); // 이미지경로저장.
        String img = e.getListImg();
        String attach = e.getAttach();
        boolean flag = eventService.deleteService(nid);            // DB 삭제

        if(flag){   //DB 삭제 성공시
            List<String> result= new ArrayList<>();
            if(attach != null) {
                String[] attachList = attach.split(",");
                for(String p : attachList){
                    result.add(FileUtils.deleteFile(p,UPLOAD_PATH)); // 첨부파일 삭제
                }
            }
            result.add(FileUtils.deleteFile(img, UPLOAD_PATH)); // 리스트 썸네일 파일 삭제
            if(result.contains("fail")) return new ResponseEntity<>("fail", HttpStatus.NOT_ACCEPTABLE);
            return new ResponseEntity<>("delete success" ,HttpStatus.OK);
        }else{
            return new ResponseEntity<>("fail",HttpStatus.NOT_ACCEPTABLE);
        }
    }

}
