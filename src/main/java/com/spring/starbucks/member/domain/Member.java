package com.spring.starbucks.member.domain;


import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {


    private int birthYear;
    private int birthMonth;
    private int birthDay;
    private int level;
    private String name;
    private String account;
    private String password;
    private String email;
    private Gender gender;
    private String phone;
    private String nickname;

    private LocalDateTime regDate;
    private Auth auth;



}
