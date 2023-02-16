package com.spring.starbucks.whatsNew.notice.service;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.notice.domain.Notice;
import com.spring.starbucks.whatsNew.notice.repository.NoticeMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class NoticeService {

    final private NoticeMapper noticeMapper;

    public List<Notice> findAllService(Search search){
        return noticeMapper.findAll2(search);
    }

    public Notice findOne(int noticeId){
        return noticeMapper.findOne(noticeId);
    }

    public boolean insertService(Notice notice){
        return noticeMapper.insert(notice);
    }

    public boolean updateService(Notice notice){
        return noticeMapper.update(notice);
    }

    public boolean delete(int noticeId){
        return noticeMapper.delete(noticeId);
    }

    public boolean upViewCount(int noticeId){return noticeMapper.upViewCount(noticeId); }
}
