package com.spring.starbucks.suggestion.service;

import com.spring.starbucks.common.search.Search;
import com.spring.starbucks.suggestion.domain.Suggestion;
import com.spring.starbucks.suggestion.repository.SuggestionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j2
public class SuggestionService {

    private final SuggestionMapper suggestionMapper;

    public Suggestion findOne(int id){
        return suggestionMapper.findOne(id);
    }

    public List<Suggestion> findAll(Search search){
        return suggestionMapper.findAll(search);
    }

    public boolean insert(Suggestion suggestion){
        return suggestionMapper.insert(suggestion);
    }

    public boolean update(Suggestion suggestion){
        return suggestionMapper.update(suggestion);
    }

    public boolean delete(Search search){
        return suggestionMapper.delete(search);
    }

    public int getTotalCount(Search search){
        return suggestionMapper.getTotalCount(search);
    }

    public int getTotalCount2(Search search){
        return suggestionMapper.getTotalCount2(search);
    }
}
