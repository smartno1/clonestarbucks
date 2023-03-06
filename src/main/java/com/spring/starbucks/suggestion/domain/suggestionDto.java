package com.spring.starbucks.suggestion.domain;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class suggestionDto {
    private String phone1;
    private String phone2;
    private String phone3;
    private String title;
    private String context;
}
