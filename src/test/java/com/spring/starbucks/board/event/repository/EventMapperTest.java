package com.spring.starbucks.board.event.repository;

import com.spring.starbucks.board.event.domain.Event;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataAccessException;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class EventMapperTest {

    @Autowired
    EventMapper eventMapper;

    @Test
    @DisplayName("게시물 20개를 입력한다")
    void insertTest() {

        LocalDate beginDate = LocalDate.of(2022,7,1);
        LocalDate endDate = LocalDate.of(2022,12,30);

        Event event = new Event();
        event.setKind("card");
        event.setListImg("/images/board/event/e1.jpg");
        event.setContentImg("/images/board/event/e1-1.jpg");
        event.setBeginDate(beginDate);
        event.setEndDate(endDate);
        for(int i = 0; i<20 ; i++){
            event.setTitle("이벤트"+i+"~~~~~~~~~~~~~~~~~~~~");
            eventMapper.insert(event);
        }


    }

    @Test
    @DisplayName("전체 게시물 조회, 반환된 리스트 사이즈는 20 이어야한다.")
    void findAll() {
        List<Event> list = eventMapper.findAll();

        assertEquals(20, list.size());
    }

    @Test
    @DisplayName("특정 게시물을 조회하고 아이디가 같아야한다.")
    void findOne() {
        int id = 1;
        Event event = eventMapper.findOne(id);

        assertEquals(id, event.getEventId());
    }

    @Test
    @Transactional
    @Rollback
    @DisplayName("특정 게시물의 데이터 변경")
    void update() {
        // given

        LocalDate beginDate = LocalDate.of(2022,7,1);
        LocalDate endDate = LocalDate.of(2022,8,30);
        Event event = new Event();
        event.setEventId(1);
        event.setKind("card");
        event.setTitle("이벤트1");
        event.setListImg("/images/board/event/e1.jpg");
        event.setContentImg("/images/board/event/e1-1.jpg");
        event.setBeginDate(beginDate);
        event.setEndDate(endDate);

        //when
        boolean update = eventMapper.update(event);
        Event e = eventMapper.findOne(1);

        //then
        assertTrue(update);
        assertEquals("이벤트1", e.getTitle());
    }

    @Test
    @Transactional
    @Rollback
    @DisplayName("특정게시물 삭제 후 특정 게시물이 조회되지 않아야한다.")
    void delete() {
        //given
        int id = 1;

        //when
        boolean remove = eventMapper.delete(id);

        //then
        assertTrue(remove);
        assertThrows(DataAccessException.class, () -> eventMapper.findOne(id));


    }
}