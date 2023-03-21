package com.spring.starbucks.suggestion.domain;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class SuggestionUpdateDto {
    private String id;
    private String type;
    private String keyword;
    private String replyer;
    private String checker;
    private String deleter;
}
