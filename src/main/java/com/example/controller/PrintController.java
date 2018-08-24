package com.example.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.model.BuyList;
import com.example.model.Image;
import com.example.model.User;
import com.example.repository.ImageRepository;
import com.example.repository.UserRepository;


@Controller
public class PrintController {
	
	@Autowired
	UserController userController;
	@Autowired
	UserRepository userRepository;
	@Autowired
	ImageRepository imageRepository;
	@Autowired
	ImageController imageController;

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
	
	@RequestMapping(method = RequestMethod.GET, value="/upload")
    public String upload() {
        return "upload";
    }
	
	@RequestMapping(method = RequestMethod.POST, value="/cart_add")
    public String Cart_add(@RequestParam("productId") String itemid,
    					   @RequestParam("amount") int count,
    					   HttpSession session) {

		User sUser = userRepository.findOneByName((String)session.getAttribute("member.id"));
		Image image = imageRepository.findOne(itemid);
		BuyList m_buy = new BuyList();
		m_buy.setAmount(count);
		m_buy.setItemid(itemid);
		m_buy.setEncodedString(image.getEncodedString());
		m_buy.setName(image.getName());
		m_buy.setPrice(image.getPrice());
		sUser.addBuyList(m_buy);
		
		userController.update(sUser);
		
        return "redirect:/";
    }
	
	@RequestMapping(method = RequestMethod.POST, value="/cart_buy")
    public String Cart_buy(HttpSession session) {
		User sUser = userRepository.findOneByName((String)session.getAttribute("member.id"));
		sUser.purchaseBuyList();
		userController.update(sUser);
        return "redirect:/";
    }
	
	@RequestMapping(method = RequestMethod.POST, value="/cart_delete")
    public String Cart_delete(@RequestParam("productId") String itemid,
    					   HttpSession session) {
		System.out.println("cart_delete");
		User sUser = userRepository.findOneByName((String)session.getAttribute("member.id"));
		sUser.deleteBuyList(itemid);
		userController.update(sUser);
        return "redirect:/";
    }
	
	@RequestMapping(method = RequestMethod.POST, value="/item_delete")
    public String Item_delete(@RequestParam("productId") String itemid,
    					   HttpSession session) {
		List<User> userList = userRepository.findAll();
		for(int i = 0; i < userList.size(); i++) {
			userList.get(i).deleteBuyList(itemid);
			userController.update(userList.get(i));
		}
		imageController.delete(itemid);		
        return "redirect:/";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/item")
    public String Item_view(Model model, @RequestParam("category") String category) {
		List<Image> Alllist = imageRepository.findAll();
		List<Image> list = new ArrayList<Image>();
		for(int i = 0; i < Alllist.size(); i++) {
			if(Alllist.get(i).getCategory().contentEquals(category)) {
				list.add(Alllist.get(i));
			}
			else {
				continue;
			}
		}
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getName());
		}
		model.addAttribute("list", list);
        return "Item";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/item/detail/{itemId}")
	public String Detail_view(Model model, @PathVariable String itemId, HttpSession session) {
		Image image = imageController.read(itemId + ".jpg");
		model.addAttribute("item", image);
		System.out.println(session.getAttribute("member"));
		System.out.println(session.getAttribute("auth"));
		model.addAttribute("member", session.getAttribute("member"));
		return "Detail";
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value="/search")
    public String Search_view(Model model, @RequestParam("name") String name, @RequestParam(defaultValue="0")int nowPage) {
		List<Image> Alllist = imageRepository.findAll();
		List<Image> list = new ArrayList<Image>();
		for(int i = 0; i < Alllist.size(); i++) {
			if(Alllist.get(i).getName().trim().contains(name)) {
				list.add(Alllist.get(i));
			}
			else {
				continue;
			}
		}
		
		int PageCount = list.size()/5 + 1;
		
		if(nowPage >= PageCount)
			return "redirect:/";
		
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("PageCount",PageCount);
		
		List<Image> listInPage = new ArrayList<Image>();
		
		for(int i = 0; i < 5; i++) {
			if(i + 5*nowPage > list.size() - 1)
				break;
			
			listInPage.add(list.get(i + 5*nowPage));
		}
		
		model.addAttribute("list", listInPage);
        return "Item";
    }
	
	@RequestMapping(method = RequestMethod.POST, value="/upload")
    public String upload_post(@RequestParam("file") MultipartFile file, 
    						  @RequestParam("name") String name,
    						  @RequestParam("price") int price,
    						  @RequestParam("category") String category,
    						  Model model) throws IOException {
		System.out.println("File Name : " + file.getOriginalFilename());
		System.out.println("File Size : " + file.getSize());
		
		byte[] encoded = Base64.encodeBase64(file.getBytes());
		String encodedString = new String(encoded);
		
		Image image = new Image();
		image.setId(file.getOriginalFilename());
		image.setName(name);
		image.setEncodedString(encodedString);
		image.setPrice(price);
		image.setCategory(category);
		imageController.create(image);
		
		model.addAttribute("image", image);
		
		System.out.println("image save" + image.getId());
		
        return "img";
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
		
		List<Image> imagelist = imageRepository.findAll();
		model.addAttribute("imagelist",imagelist);
		
		List<User> list = userRepository.findAll();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getId().contentEquals("admin")) {
				list.remove(i);
				break;
			}
			else
				continue;
		}
		model.addAttribute("list", list);
        return "Admin";
    }
	
	@RequestMapping(method = RequestMethod.GET, value="/member")
    public String member_view(HttpSession session, Model model) {
		User sUser = userController.read((String)session.getAttribute("member.id"));
		model.addAttribute("list", sUser.buyList);
		model.addAttribute("purchaselist", sUser.realbuyList);
		int totalprice = 0;
		for(int i = 0; i < sUser.buyList.size(); i++) {
			totalprice += sUser.buyList.get(i).getPrice() * sUser.buyList.get(i).getAmount();
		}
		model.addAttribute("totalPrice", totalprice);
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
            session.setAttribute("member.id", sUser.getId());
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
