CREATE table starbucks.coffee(
     id INT(11) NOT NULL AUTO_INCREMENT
    ,price INT(11)
    ,flavor VARCHAR(100)
    ,feel VARCHAR(100)
    ,degree VARCHAR(100)
    ,image VARCHAR(300)
    ,name_kr VARCHAR(100)
    ,name_en VARCHAR(100)
    ,weight VARCHAR(30)
    ,kind VARCHAR(30)
    ,type VARCHAR(30)
    ,description_summary VARCHAR(500)
    ,description_detail VARCHAR(500)
    ,design_story VARCHAR(500)
    ,coffee_tasting_note VARCHAR(500)
    ,tasting_note VARCHAR(500)
    ,enjoy_with VARCHAR(500)
    ,relative VARCHAR(500)
    ,processing_method VARCHAR(500)
    ,reg_date DATETIME DEFAULT CURRENT_TIMESTAMP

    ,CONSTRAINT pk_coffee PRIMARY KEY (id)
);


CREATE TABLE starbucks.myfavorite(
    my_favorit_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY
    , account VARCHAR(50)
    , type VARCHAR(50)
    , type_id INT(11)
    , reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE starbucks.board_event(
    event_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY
    , kind VARCHAR(50)
    , title VARCHAR(50)
    , begin_date DATETIME
    , end_date DATETIME
    , list_img VARCHAR(50)
    , content_img VARCHAR(50)
    , reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE starbucks.board_news(
    news_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY
    , type VARCHAR(50)
    , title VARCHAR(50)
    , list_img VARCHAR(50)
    , content_img VARCHAR(50)
    , reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE starbucks.board_notice(
   notice_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY
    , title VARCHAR(50)
    , content_img VARCHAR(50)
    , conut INT(10) DEFAULT 0
    , reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
);