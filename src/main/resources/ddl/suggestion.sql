CREATE table starbucks.suggestion(
                                     id INT(11) NOT NULL AUTO_INCREMENT
    ,account VARCHAR(50)
    ,title VARCHAR(100)
    ,context VARCHAR(500)
    ,phone VARCHAR(30)
    ,reg_date DATETIME DEFAULT CURRENT_TIMESTAMP
    ,checked TINYINT DEFAULT FALSE
    ,checker VARCHAR(50)
    ,check_date DATETIME
    ,reply VARCHAR(500)
    ,replyer VARCHAR(50)
    ,reply_date DATETIME
    ,reply_done TINYINT DEFAULT FALSE
    ,deleter VARCHAR(50)
    ,delete_time DATETIME

    ,CONSTRAINT pk_suggestion PRIMARY KEY (id)
);

ALTER TABLE suggestion
    ADD FOREIGN KEY (account) REFERENCES tbl_member(account) ON DELETE SET NULL;
ALTER TABLE suggestion
    ADD FOREIGN KEY (checker) REFERENCES tbl_member(account) ON DELETE SET NULL;
ALTER TABLE suggettion
    ADD FOREIGN KEY (replyer) REFERENCES tbl_member(account) ON DELETE SET NULL;
ALTER TABLE suggettion
    ADD FOREIGN KEY (deleter) REFERENCES tbl_member(account) ON DELETE SET NULL;