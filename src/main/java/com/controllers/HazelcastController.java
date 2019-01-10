package com.controllers;

import com.hazelcast.core.HazelcastInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class HazelcastController {

    private final HazelcastInstance hazelcastInstance;

    private final static String TEST_MAP = "test-map";

    @Autowired
    HazelcastController(HazelcastInstance hazelcastInstance) {
        this.hazelcastInstance = hazelcastInstance;
    }

    @PostMapping(value = "/add")
    public ResponseEntity writeDataToHazelcast(
            @RequestParam String key, @RequestParam String value) {
        Map<String, String> hazelcastMap = hazelcastInstance.getMap(TEST_MAP);

        hazelcastMap.put(key, value);

        return new ResponseEntity(HttpStatus.OK);
    }

    @GetMapping(value = "/read")
    public ResponseEntity readDataFromHazelcast(@RequestParam String key) {
        Map<String, String> hazelcastMap = hazelcastInstance.getMap(TEST_MAP);

        return new ResponseEntity(hazelcastMap.get(key), HttpStatus.OK);
    }

}
