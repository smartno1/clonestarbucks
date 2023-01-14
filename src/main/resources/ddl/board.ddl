
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
    , kind VARCHAR(50)
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