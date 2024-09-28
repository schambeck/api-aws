package com.schambeck.aws;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class AwsApplication {
    
    public static void main(String[] args) {
        SpringApplication.run(AwsApplication.class, args);
    }
    
    @GetMapping("api/hello")
    public String hello() {
        return "Hello World v2";
    }
    
}
