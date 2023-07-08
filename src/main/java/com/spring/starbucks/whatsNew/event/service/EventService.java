package com.spring.starbucks.whatsNew.event.service;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.event.repository.EventMapper;
import com.spring.starbucks.whatsNew.event.domain.Event;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class EventService {

    private final EventMapper eventMapper;

    public boolean saveService(Event event){

        return eventMapper.insert(event);
    }

    public List<Event> findAllService(Search search){
        if(search.getKind() == null || search.getKind() == ""){
            search.setKind("ALL");
        }
        // 리스트 가져오기
        List<Event> events = eventMapper.findAll(search);
        LocalDate current = LocalDate.now().minusDays(1);
        for(int i=0;i<events.size();i++) {
            Event event = events.get(i);

            //  종료날짜 비교하여 이벤트 종료여부 결정
            if(event.getEndDate() != null) { // null 을 검증
                if (event.getEndDate().isAfter(current)) {
                    log.info("ing");
                    event.setEnded(false);
                }else{
                    log.info("ended");
                    event.setEnded(true);
                }
            }else { // 종료날짜가 정해지지 않았으면
                event.setEnded(false);
            }
            // 제목 글자수 20 넘으면 짤라서 안넘으면 제목 그대로 따로 저장.
//            event.setPrettierTitle(prettierDate(event.getTitle())); => CSS로 대체

            // 이벤트 기간 저장.
            event.setPeriod(period(event.getBeginDate(), event.getEndDate(), event.getEndPoint()));
        }
        return events;
    }

    public Event findOneService(int id){
        Event event = eventMapper.findOne(id);
        // 제목 글자수 20 넘으면 짤라서 안넘으면 제목 그대로 따로 저장.
//        event.setPrettierTitle(prettierDate(event.getTitle())); ==> CSS로 대체
        // 이벤트 기간 저장.
        event.setPeriod(period(event.getBeginDate(), event.getEndDate(), event.getEndPoint()));

        return event;
    }

    public boolean updateService(Event event){
        return eventMapper.update(event);
    }

    public boolean deleteService(int id){
        return eventMapper.delete(id);
    }

    public String prettierDate(String title){
        if(title.length()>16){
            title = title.substring(0,16)+"...";
        }
        return title;
    }

    public String period(LocalDate begin, LocalDate end, String endP){
        String p ="기한 없음 ";
        if(begin != null) {
            p = begin.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " ~ "; // 시작날짜 저장.
        }
        if(end != null) {   // 종료날짜가 있으면
            p += end.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); //종료날짜 뒤에 이어서 저장.
        }
        if(endP != null){
            p += endP; // 종료시점이 있으면 뒤에 이이서 저장.
        }
        return p;
    }
}
