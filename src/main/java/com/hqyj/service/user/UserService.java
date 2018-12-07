package com.hqyj.service.user;

import com.hqyj.bean.user.User;
import com.hqyj.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/5
 */
@Service
public class UserService {
    @Autowired
    private UserDao dao;
    public boolean findUserByUsernameOREmail(String username,String email) {
        return  dao.findUserByUsernameOREmail(username,email)!=null;

    }

    public boolean addNewUser(String username, String email, String password, int active, String sign) {

        return dao.addNewUser(username, email, password, active, sign) > 0;
    }

    public boolean activeUser(String email, String sign) {
        return  dao.activeUser(email, sign) == 1;
    }

    public User findRoles(String email){
      return   dao.findRoles(email);
    }
}
