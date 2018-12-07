package com.hqyj.action;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainAction {
	/*public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";*/


	@RequestMapping("/admin")
	public String toMain() {
		return "admin";
	}

	@RequestMapping("/index")
	public String toIndex(){
		return "index";
	}


	@RequestMapping("/logout")
	public String logout(){
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "index";
	}


}
