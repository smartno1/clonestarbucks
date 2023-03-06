package com.spring.starbucks.admin.controller;

import com.spring.starbucks.common.paging.PageMaker;
import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.member.domain.Auth;
import com.spring.starbucks.member.domain.DelMember;
import com.spring.starbucks.member.domain.Member;
import com.spring.starbucks.member.service.MemberService;
import com.spring.starbucks.suggestion.domain.Suggestion;
import com.spring.starbucks.suggestion.domain.suggestionUpdateDto;
import com.spring.starbucks.suggestion.service.SuggestionService;
import com.spring.starbucks.util.LoginUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.SpinnerUI;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/admin")
public class AdminController {


    private final MemberService memberService;
    private final SuggestionService suggestionService;


    @GetMapping("/member")
    public String member(Search search, Model model) {
        log.info("/admin/member GET! - forwarding to member.jsp");

        List<Member> memberList = memberService.findAll(search);
        PageMaker pm = new PageMaker(search, memberService.getTotalCount(search));

        model.addAttribute("memberList", memberList);
        model.addAttribute("pm",pm);
        model.addAttribute("s", search);

        return "admin/member";
    }

    @GetMapping("/member_detail")
    public String memberDetail(@RequestParam("account") String account, Search search, Model model){

        Member member = memberService.findUser(account);
        model.addAttribute("member", member);
        model.addAttribute("s", search);
        return "admin/member_detail";
    }

    @PostMapping("/member_modify")
    public String memberModify(Member member, HttpServletRequest request, HttpSession session){
        log.info("/admin/member_modify POST ! - {}", member);
        String redirectUri = request.getHeader("Referer");
        boolean flag = memberService.update(member);
        return "redirect:"+redirectUri;
    }

    @PostMapping("/member_delete")
    @ResponseBody
    public ResponseEntity<String> memberDelete(@RequestBody DelMember member, Model model, HttpServletRequest request){
        log.info("/admin/member_delete  reason: {}", member.getAccount() );
        log.info("/admin/member_delete  reason: {}", member.getDelReason() );
        String redirectUri = request.getHeader("Referer");
        redirectUri = redirectUri.substring(redirectUri.indexOf("pageNum"));
        log.info("referer : {}",redirectUri);
        String msg = memberService.deleteAccount(member.getAccount(), member.getDelReason());
        model.addAttribute("redirectUri",redirectUri);
        return new ResponseEntity<String >(msg, HttpStatus.OK);
    }

    @GetMapping("/deleted_member")
    public String deleted_member(Search search, Model model)
    {
        log.info("/admin/deleted_member GET! - forwarding to deletedMember.jsp");
        List<DelMember> delMemberList = memberService.delFindAll(search);
        PageMaker pm = new PageMaker(search, memberService.delGetTotalCount(search));

        model.addAttribute("memberList", delMemberList);
        model.addAttribute("pm",pm);
        model.addAttribute("s", search);

        return "admin/deletedMember";
    }

    @GetMapping("/deleted_member_detail")
    public String delMemberDetail(@RequestParam("account") String account, Search search, Model model){

        DelMember member = memberService.delAccountFind(account);
        model.addAttribute("member", member);
        model.addAttribute("s", search);
        log.info("delmember - {}", member);
        return "admin/deleted_member_detail";
    }

    @PostMapping("/deleted_member_modify")
    public String delMemberModify(DelMember member, HttpServletRequest request, HttpSession session){
        log.info("/admin/deleted_member_modify POST ! - {}", member);
        String redirectUri = request.getHeader("Referer");
        boolean flag = memberService.delAccountUpdate(member);
        return "redirect:"+redirectUri;
    }

    @PostMapping("/deleted_member_recovery")
    @ResponseBody
    public ResponseEntity<String> delMemberRecovery(@RequestBody String account, Model model, HttpServletRequest request){
        log.info("/admin/deleted_member_recovery - {}", account);
        String msg = "fail";
        String redirectUri = request.getHeader("Referer");
        redirectUri = redirectUri.substring(redirectUri.indexOf("pageNum"));
        log.info("referer : {}",redirectUri);
        if(memberService.recoveryAccount(account)){
            msg="success";
        };
        log.info("msg - {}", msg);
        model.addAttribute("redirectUri", redirectUri);

        return new ResponseEntity<String >(msg,HttpStatus.OK);
    }

    @GetMapping("/suggestion")
    public String suggestion(Search search, Model model) {
        List<Suggestion> suggestionsList = suggestionService.findAll(search);
        PageMaker pm = new PageMaker(search, suggestionService.getTotalCount(search));

        model.addAttribute("suggestionList" , suggestionsList);
        model.addAttribute("pm", pm);
        model.addAttribute("s", search);
        log.info("/admin/suggestion GET! - forwarding to suggestion.jsp");
        return "admin/suggestion";
    }

    @GetMapping("/suggestion_detail")
    public String suggestion_dt(@RequestParam("id") String id, Search search, Model model) {
        log.info("/admin/suggestion_dt GET! - forwarding to suggestion_detail.jsp");
        Suggestion suggestion = suggestionService.findOne(Integer.parseInt(id));

        //  확인 여부 컬럼에 폴스면 트루 설정 업데이트
        if(!suggestion.isConfirm() ){
            suggestionService.update(new suggestionUpdateDto(id, "confirm", "true"));
        }

        model.addAttribute("suggestion", suggestion);
        model.addAttribute("s", search);

        return "admin/suggestion_detail";
    }

    @PostMapping("/suggestion_reply")
    @ResponseBody
    public ResponseEntity<String> saveReply(suggestionUpdateDto dto){
        log.info("/suggestion_reply start - {}",dto);
        String msg;
        boolean flag = suggestionService.update(dto);
        if(flag){
            msg = "SUCCESS";
        }else{
            msg = "FAIL";
        }
        return new ResponseEntity<String>(msg, HttpStatus.OK);
    }

    @PostMapping("/suggestion_reply_delete")
    @ResponseBody
    public ResponseEntity<String> deleteReply(suggestionUpdateDto dto){
        String msg;
        boolean flag = suggestionService.update(dto);
        if(flag){
            msg = "SUCCESS";
        }else{
            msg = "FAIL";
        }
        return new ResponseEntity<String>(msg, HttpStatus.OK);
    }
}
