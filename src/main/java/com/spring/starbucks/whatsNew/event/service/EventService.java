package com.spring.starbucks.whatsNew.event.service;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.menu.domain.Menu;
import com.spring.starbucks.whatsNew.event.repository.EventMapper;
import com.spring.starbucks.whatsNew.event.domain.Event;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

        List<Event> events = eventMapper.findAll(search);
        LocalDate current = LocalDate.now().minusDays(1);
        for(int i=0;i<events.size();i++) {
            Event event = events.get(i);

            //  종료날짜 비교하여 이벤트 종료여부 결정
            if (event.getEndDate().isAfter(current)) {
                log.info("ended");
                event.setEnded(false);
            }else{
                log.info("ing");
                event.setEnded(true);
            }
            // 제목 글자수 20 넘으면 짤라서 저장.
            String title = event.getTitle();
            if(title.length()>20){
                title = title.substring(0,20)+"...";
                event.setPrettierTitle(title);
            }
            // 이벤트 기간 저장.
            String p = event.getBeginDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " ~ "
                    + event.getEndDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            event.setPeriod(p);
        }
        return events;
    }

    public Event findOneService(int id){
        Event event = eventMapper.findOne(id);
        // 제목 글자수 20 넘으면 짤라서 저장.
        String title = event.getTitle();
        if(title.length()>20){
            title = title.substring(0,20)+"...";
            event.setPrettierTitle(title);
        }
        // 이벤트 기간 저장.
        String p = event.getBeginDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) + " ~ "
                + event.getEndDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        event.setPeriod(p);



        return event;
    }

    public boolean updateService(Event event){
        return eventMapper.update(event);
    }

    public boolean deleteService(int id){
        return eventMapper.delete(id);
    }
}
