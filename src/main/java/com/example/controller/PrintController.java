package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PrintController {
	
	@RequestMapping(method = RequestMethod.GET, value="/")
    public String printview() {
        return "Main";
    }
}
