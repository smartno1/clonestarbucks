CREATE table starbucks.suggestion(
                                     id INT(11) NOT NULL AUTO_INCREMENT
    ,account VARCHAR(50)
    ,title VARCHAR(100)
    ,context VARCHAR(500)
    ,phone VARCHAR(30)
    ,reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
    ,confirm TINYINT DEFAULT FALSE
    ,confirm_date DATETIME
    ,reply VARCHAR(500)
    ,reply_date DATETIME
    ,reply_done TINYINT DEFAULT FALSE

    ,CONSTRAINT pk_suggestion PRIMARY KEY (id)
);