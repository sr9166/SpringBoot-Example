package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.session.data.mongo.config.annotation.web.http.EnableMongoHttpSession;

@SpringBootApplication
@EnableMongoHttpSession
public class SampleApplication {
    public static void main(String[] args) {
    	// 스프링 부트 어플리케이션 실행
        SpringApplication.run(SampleApplication.class, args);
    }
}