package com.spring.starbucks.menu.domain;

import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.Date;

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
    private String descriptionSummary;
    private String descriptionDetail;
    private String designStory;
    private String coffeeTastingNote;
    private String tastingNote;
    private String enjoyWith;
    private String relative;
    private String processingMethod;
    private Date regDate;
    private MultipartFile file;
}
