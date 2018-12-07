package com.hqyj.action.user;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.bean.user.User;
import com.hqyj.shiro.MyToken;

/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/6
 */
@Controller
@RequestMapping("/user")
public class UserLoginAction {
    @RequestMapping("/login")
    @ResponseBody
    public String doLogin(User user) {
        Subject currentUser = SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()) {
            MyToken token = new MyToken(user.getEmail(),user.getPassword());
            token.setType(1);
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
