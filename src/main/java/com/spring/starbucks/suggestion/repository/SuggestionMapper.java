package com.spring.starbucks.suggestion.repository;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.suggestion.domain.Suggestion;
import com.spring.starbucks.suggestion.domain.SuggestionUpdateDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SuggestionMapper {

    Suggestion findOne (int id);

    List<Suggestion> findAll(Search search);

    boolean insert(Suggestion suggestion);

    boolean update(SuggestionUpdateDto dto);

    boolean delete(Search search);

    int getTotalCount(Search search);


}
