package com.spring.starbucks.suggestion.domain;


import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@ToString
@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class Suggestion {

    private int id;
    private String account;
    private String title;
    private String context;
    private String phone;
    private LocalDate regDate;
    private boolean confirm;
    private LocalDateTime confirmDate;
    private String reply;
    private LocalDateTime replyDate;
    private boolean replyDone;

    // custom
    private int no;

}
