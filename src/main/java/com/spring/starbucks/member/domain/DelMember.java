package com.spring.starbucks.member.domain;

import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class DelMember {

    private int id;
    private int birthYear;
    private int birthMonth;
    private int birthDay;
    private int level;
    private String sl;
    private String name;
    private String account;
    private String password;
    private String email;
    private Gender gender;
    private String phone;
    private String nickname;
    private String delReason;
    private LocalDateTime delRegDate;

    private Date regDate;
    private Auth auth;

    //----------
    private int no;
    private String prettierDate;


}
