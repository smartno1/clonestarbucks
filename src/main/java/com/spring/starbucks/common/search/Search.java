package com.spring.starbucks.common.search;

import com.spring.starbucks.common.paging.Page;
import com.spring.starbucks.whatsNew.news.domain.Kind;
import com.spring.starbucks.whatsNew.news.domain.SearchKind;
import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Search extends Page {

    private String type; // 검색 조건
    private String keyword; // 검색 키워드

    // news custom
    private String kind;
}
