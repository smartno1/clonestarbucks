CREATE table starbucks.menu(
                               id INT(11) NOT NULL AUTO_INCREMENT
    ,price INT(11)
    ,image VARCHAR(300)
    ,name_kr VARCHAR(100)
    ,name_en VARCHAR(100)
    ,weight VARCHAR(30)
    ,weight2 VARCHAR(30)
    ,calorie1 VARCHAR(30)
    ,calorie2 VARCHAR(30)
    ,calorie3 VARCHAR(30)
    ,calorie4 VARCHAR(30)
    ,calorie5 VARCHAR(30)
    ,calorie6 VARCHAR(30)
    ,kind VARCHAR(30)
    ,type VARCHAR(30)
    ,espresso_kind VARCHAR(30)
    ,description_summary VARCHAR(500)
    ,description_detail VARCHAR(500)
    ,register VARCHAR(50)
    ,reg_date DATETIME DEFAULT CURRENT_TIMESTAMP

    ,CONSTRAINT pk_coffee PRIMARY KEY (id)
);
ALTER TABLE menu
    ADD FOREIGN KEY (register) REFERENCES tbl_member(account) ON DELETE SET NULL;