package com.spring.starbucks.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
//import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;



@Configuration
@ComponentScan(basePackages = "com.spring.starbucks")
//@PropertySource("classpath:db_info.properties")
public class DataBaseConfig {

//    @Value("${local.db.username}")
//    private String username;
//
//    @Value("${local.db.password}")
//    private String password;
//
//    @Value("${local.db.url}")
//    private String url;


    @Bean
    public DataSource dataSource() {

        HikariConfig config = new HikariConfig();
        config.setUsername("popo");
        config.setPassword("alska2580");
        config.setJdbcUrl("jdbc:mysql://op-dev-database.cjwfzouhty53.ap-northeast-2.rds.amazonaws.com:3306/starbucks");
        config.setDriverClassName("org.mariadb.jdbc.Driver");

        return new HikariDataSource(config);
    }
}




