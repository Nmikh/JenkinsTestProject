package com.controllers;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

    @GetMapping("/hello")
    public ResponseEntity home() {
        int a = 21;
        String b = "ssss";

        return new ResponseEntity("Hello from Rest", HttpStatus.OK);
    }
}
