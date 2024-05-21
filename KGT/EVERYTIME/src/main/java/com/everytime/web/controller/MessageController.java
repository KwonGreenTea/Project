package com.everytime.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping
@Log4j
public class MessageController {
    
    @GetMapping("/chat")
    public String messageGet(HttpServletRequest request, RedirectAttributes reAttr) throws Exception{
        log.info("messageGet()");
        return "message";
    }
    
}
