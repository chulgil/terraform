package com.example.feedserver.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/feed")
public class FeedController {

    @Value("${spring.application.name}")
    private String applicationName;

    @Value("${spring.profiles.active:default}")
    private String activeProfile;

    @GetMapping("/health")
    public Map<String, Object> health() {
        Map<String, Object> response = new HashMap<>();
        response.put("status", "UP");
        response.put("application", applicationName);
        response.put("profile", activeProfile);
        response.put("timestamp", LocalDateTime.now());
        response.put("message", "Feed Server is running!");
        return response;
    }

    @GetMapping("/info")
    public Map<String, Object> info() {
        Map<String, Object> response = new HashMap<>();
        response.put("name", "Feed Server");
        response.put("version", "1.0.0");
        response.put("description", "Spring Boot 3.1 Feed Server Application");
        response.put("javaVersion", System.getProperty("java.version"));
        response.put("springBootVersion", "3.1.5");
        response.put("timestamp", LocalDateTime.now());
        return response;
    }
} 