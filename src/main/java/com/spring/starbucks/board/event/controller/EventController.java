package com.spring.starbucks.board.event.controller;

import com.spring.starbucks.board.event.domain.Event;
import com.spring.starbucks.board.event.service.EventService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/board/event")
public class EventController {

    private final EventService eventService;

    @GetMapping("/list")
    public String list(Model model){

        List<Event> events =  eventService.findAllService();
        model.addAttribute("events", events);

        return "board/event/eventList";
    }

    @GetMapping("/detail")
    public String detail(int id, Model model){
        Event event = eventService.findOneService(id);

        model.addAttribute("event", event);
        return "board/event/eventDetail";
    }

}
