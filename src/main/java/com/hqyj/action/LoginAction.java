package com.hqyj.action;

import com.hqyj.shiro.MyToken;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.bean.sys.SysUser;

@Controller
public class LoginAction {
	@RequestMapping("/login")
	public String test() {
		return "sysuserlogin";
	}
	
	@RequestMapping("/dologin")
	@ResponseBody
	public String doLogin(SysUser user) {
        Subject currentUser = SecurityUtils.getSubject();	
        if (!currentUser.isAuthenticated()) {
            MyToken token = new MyToken(user.getEmail(),
            		user.getPassword());
            token.setRememberMe(true);
            try {
                currentUser.login(token);
            } catch (AuthenticationException ae) {
            	return "error";//用户名或密码错误
            }
        }
		return "ok";
		
	}	
	
}
