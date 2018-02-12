package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.model.User;
import com.example.repository.UserRepository;


@Controller
public class PrintController {
	
	@Autowired
	UserController userController;
	@Autowired
	UserRepository userRepository;

	@RequestMapping(method = RequestMethod.GET, value="/")
    public String printview() {
        return "basic";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/sign_in")
    public String sign_in_view() {
        return "Sign_in";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/sign_up")
    public String sign_up_view() {
        return "Sign_up";
    }	
	
	@RequestMapping(method = RequestMethod.GET, value="/admin")
    public String admin_view(HttpSession session, Model model) {

		if( session.getAttribute("auth").equals("admin") ) {
			System.out.println("ADMIN");
			
		}
		else {
			System.out.println("NOT ADMIN");
			return "Failure";
		}
		
		
		List<User> list = userRepository.findAll();
		model.addAttribute("list", list);
        return "Admin";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/member")
    public String member_view(HttpSession session) {
        return "Member";
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
	
	@RequestMapping(value="/sign_in", method = RequestMethod.POST)
    String sign_in(HttpSession session, Model model, User user) {
		
		System.out.println("User ID : " + user.getId());
		System.out.println("User PW : " + user.getPw());
		
		if(userController.read(user.getId()) == null)
			return "Failure";
		
		User sUser = null;
		
		sUser = userController.read(user.getId());
		
		if(user.getPw().contentEquals(sUser.getPw())) {
			sUser = userController.read(user.getId());
            session.setAttribute("member", sUser);
            System.out.println("Login " + ((User)sUser).getId());
            
            if(sUser.getId().contentEquals("admin")) {
            	session.setAttribute("auth", "admin");
            }
            else {
            	session.setAttribute("auth", "user");
            }
            
            return "redirect:/";
		}
		
		else 
			return "Failure";
    }
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	String sessionclear(HttpSession session) {
		session.invalidate();
		System.out.println("Logout");
        return "redirect:/";
	}
}
