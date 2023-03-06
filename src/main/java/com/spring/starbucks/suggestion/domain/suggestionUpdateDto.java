package com.spring.starbucks.suggestion.domain;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class suggestionUpdateDto {
    private String id;
    private String type;
    private String keyword;
}
