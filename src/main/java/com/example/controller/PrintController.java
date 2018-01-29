package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.controller.UserController;
import com.example.model.User;


@Controller
public class PrintController {
	
	@RequestMapping(method = RequestMethod.GET, value="/")
    public String printview() {
        return "Main";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/Success")
    public String Successview() {
        return "Success";
    }
	
	@Autowired
	UserController userController;
	
	@RequestMapping(method = RequestMethod.POST, value="/login")	
    public String login(User user) {
		
		System.out.println(user.getId());
		System.out.println(user.getPw());	
		
		User temp = new User();
		if(userController.read(user.getId()) == null)
			return "Failure";
		
		temp = userController.read(user.getId());		
		if(user.getPw().contentEquals(temp.getPw())) {
			return "redirect:/Success";
		}
		
		else 
			return "Failure";
    }
	
	@RequestMapping(method = RequestMethod.POST, value = "/sign_up")
	public String sign_up(User user) {
		
		System.out.println(user.getId());
		System.out.println(user.getPw());
		System.out.println(user.getName());
		System.out.println(user.getAge());
		
		if(userController.read(user.getId()) == null) {
			userController.create(user);
			return "Success";
		}
		return "Failure";
	}
}
