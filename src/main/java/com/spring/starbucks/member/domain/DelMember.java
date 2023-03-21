package com.spring.starbucks.member.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class DelMember extends Member {


    //----------
    private String delReason;
    private String deleter;
    private LocalDateTime delRegDate;
    private String prettierDate;


}
