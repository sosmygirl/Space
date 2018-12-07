package com.hqyj.action.user;

import java.util.Map;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.Util.EmailUtil;
import com.hqyj.service.user.UserService;


/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/5
 */
@Controller
@RequestMapping("/user")
public class WebUserActive {
    @Autowired
    private UserService service;

    @RequestMapping("/regist")
    @ResponseBody
    public String doRegister(@RequestParam("username")String username,
                             @RequestParam("email")String email,
                             @RequestParam("password")String password
                             ) {
        /*邮箱或用户名是否存在*/
        if (service.findUserByUsernameOREmail(username, email)) {//用户名或email已存在
           return "error";
        } else {
            String sign = new SimpleHash("MD5", username, email, 1024).toString();
            String pwd = new SimpleHash("MD5", password, email, 1024).toString();
            if (service.addNewUser(username,email,pwd,0,sign)) {
                EmailUtil.sendEmail(email,"欢迎注册本站为会员，请点击或复制此链接："+
                        "http://localhost:8080/Space/user/active?email="+email+"&sign="+sign);

                return "success";

            }else   return "error1";
        }

    }

    @RequestMapping("/active")
    public String activeUser(@RequestParam("email")String email, @RequestParam("sign")String sign, Map<String, String> map){
        if (service.activeUser(email,sign)) {
            map.put("massage","账户已激活");
            map.put("active","success");
        }else  {
            map.put("massage","链接已过期，请重新注册");
            map.put("active","error");
        }
        return "web/registersuccess";
    }








}
