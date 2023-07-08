CREATE TABLE del_member(

                           id INT NOT NULL auto_increment
    , account VARCHAR(50) NOT NULL UNIQUE
    , password VARCHAR(150) NOT NULL
    , nickname VARCHAR(5) NOT NULL
    , name VARCHAR(50) NOT NULL
    , email VARCHAR(100) NOT NULL UNIQUE
    , phone VARCHAR(20) NOT NULL UNIQUE
    , birth_year int(4) NOT NULL
    , birth_month int(2) NOT NULL
    , birth_day int(2) NOT NULL
    , sl VARCHAR(10) NOT NULL
    , gender VARCHAR(2) NOT NULL
    , auth VARCHAR(20) DEFAULT 'COMMON'
    , level int(1) DEFAULT 1
    , reg_date DATETIME
    , session_id VARCHAR(200) DEFAULT 'none'
    , limit_time DATETIME
    , modifier VARCHAR(50)
    , del_reason VARCHAR(500)
    , deleter VARCHAR(50)
    , del_reg_date DATETIME DEFAULT current_timestamp
    , CONSTRAINT pk_tbl_user PRIMARY KEY(id)

);

ALTER TABLE del_member
    ADD FOREIGN KEY (deleter) REFERENCES tbl_member(account) ON DELETE SET NULL;
CREATE TABLE tbl_member(

                           id INT NOT NULL auto_increment
    , account VARCHAR(50) NOT NULL UNIQUE
    , password VARCHAR(150) NOT NULL
    , nickname VARCHAR(5) NOT NULL
    , name VARCHAR(50) NOT NULL
    , email VARCHAR(100) NOT NULL UNIQUE
    , phone VARCHAR(20) NOT NULL UNIQUE
    , birth_year int(4) NOT NULL
    , birth_month int(2) NOT NULL
    , birth_day int(2) NOT NULL
    , sl VARCHAR(10) NOT NULL
    , gender VARCHAR(2) NOT NULL
    , auth VARCHAR(20) DEFAULT 'COMMON'
    , level int(1) DEFAULT 5
    , recoverer VARCHAR(50)
    , recovery_time DATETIME
    , reg_date DATETIME DEFAULT current_timestamp
    , session_id VARCHAR(200) DEFAULT 'none'
    , limit_time DATETIME
    , CONSTRAINT pk_tbl_user PRIMARY KEY(id)

);
ALTER TABLE tbl_member
    ADD FOREIGN KEY (recoverer) REFERENCES tbl_member(account) ON DELETE SET NULL;