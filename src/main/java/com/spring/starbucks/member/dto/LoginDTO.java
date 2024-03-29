package com.spring.starbucks.member.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class LoginDTO {

    // 로그인 할때 클라이언트가 전송하는 데이터
    private String account;
    private String password;
    private String email;
    private boolean autoLogin;
    private boolean saveId;
}
