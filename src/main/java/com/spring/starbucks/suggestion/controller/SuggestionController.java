package com.spring.starbucks.suggestion.controller;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.suggestion.domain.Dto;
import com.spring.starbucks.suggestion.domain.Suggestion;
import com.spring.starbucks.suggestion.repository.SuggestionMapper;
import com.spring.starbucks.suggestion.service.SuggestionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/suggestion")
@Log4j2
@RequiredArgsConstructor
public class SuggestionController {

    private final SuggestionService suggestionService;


    @GetMapping("/vocList")
    public String vocList(Search search, Model model, HttpSession session) {
        log.info("/Suggestion/vocList GET! - forwarding to vocList.jsp");
        Member member = (Member) session.getAttribute("loginUser");
        if(member != null){
            search.setType("account");
            search.setKeyword(member.getAccount());
        }else{
            search.setType("noLogin");
        }

        List<Suggestion> sL = suggestionService.findAll(search);
        log.info("sL - {}", sL);
        model.addAttribute("sL", sL);

        return "suggestion/vocList";
    }


    @GetMapping("/csQuestion")
    public String csQuestion() {
        log.info("/Suggestion/csQuestion GET! - forwarding to csQuestion.jsp");

        return "suggestion/csQuestion";
    }

    @PostMapping("/insert")
    public String insert(Dto dto, HttpSession session){
        Member member = (Member) session.getAttribute("loginUser");
        Suggestion suggestion = new Suggestion();
        suggestion.setAccount(member.getAccount());
        suggestion.setTitle(dto.getTitle());
        suggestion.setContext(dto.getContext());
        suggestion.setPhone(dto.getPhone1()+"-"+dto.getPhone2()+"-"+dto.getPhone3());
        log.info("suggestion - {}",suggestion);
        boolean flag = suggestionService.insert(suggestion);

        return flag ? "/suggestion/vocList" : "/suggestion/csQuestion";
    }

    @GetMapping("/detail")
    public String detail(int id, Model model){
        Suggestion suggestion = suggestionService.findOne(id);

        model.addAttribute("s", suggestion);

        return "suggestion/detail";
    }

}

