package com.spring.starbucks.myStarbucks.myMenu.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Favorite {

    private int myFavoriteId;
    private String account;
    private String type;
    private int typeId;
    private Date regDate;
}
