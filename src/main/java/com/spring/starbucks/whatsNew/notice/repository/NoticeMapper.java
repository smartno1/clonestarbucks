package com.spring.starbucks.whatsNew.notice.repository;


import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.whatsNew.notice.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoticeMapper {

    List<Notice> findAll();

    List<Notice> findAll2(Search search);

    int getTotalCount();

    int getTotalCount2(Search search);

    Notice findOne(int noticeId);

    boolean insert(Notice notice);

    boolean update(Notice notice);

    boolean delete(int noticeId);

    boolean upViewCount(int noticeId);
}
