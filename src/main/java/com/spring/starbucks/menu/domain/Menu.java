package com.spring.starbucks.menu.domain;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Menu {

    private int id;
    private int price;
    private String flavor;
    private String feel;
    private String degree;
    private String image;
    private String nameKr;
    private String nameEn;
    private String weight;
    private String kind;
    private String type;
    private String espressoKind;
    private String descriptionSummary;
    private String descriptionDetail;
    private String designStory;
    private String coffeeTastingNote;
    private String tastingNotes;
    private String enjoyWith;
    private String relative;
    private String processingMethod;
    private Date regDate;
    private MultipartFile file;
    private String weight2;
    private String calorie1;
    private String calorie2;
    private String calorie3;
    private String calorie4;
    private String calorie5;
    private String calorie6;
    private String detail;

    private String sid;


}
