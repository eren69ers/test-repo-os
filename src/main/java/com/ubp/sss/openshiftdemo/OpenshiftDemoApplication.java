package com.ubp.sss.openshiftdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class OpenshiftDemoApplication {

    @GetMapping("/")
    public String welcome() {
        return "Hello Chicken!";
    }

    @GetMapping("/{input}")
    public String successfulInput(@PathVariable String input) {
        return "Hello " + input + "! WHAT do you mean?!!! ";
    }

    public static void main(String[] args) {
        SpringApplication.run(OpenshiftDemoApplication.class, args);
    }

}
