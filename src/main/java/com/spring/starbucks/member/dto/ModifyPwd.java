package com.spring.starbucks.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ModifyPwd {

    private String account;
    private String password;
    private String new_pw1;
    private String new_pw2;
}
