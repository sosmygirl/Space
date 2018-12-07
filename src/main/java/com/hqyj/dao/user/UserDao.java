package com.hqyj.dao.user;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/5
 */

import com.hqyj.bean.user.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    public User findUserByUsernameOREmail(@Param("username") String username, @Param("email") String email);

    public int addNewUser(@Param("username")String username, @Param("email")String email, @Param("password")String password, @Param("active")int active,@Param("sign")String sign);

    public int activeUser(@Param("email")String email, @Param("sign")String sign);

    public  User findUserByEmailAndPassword(@Param("email")String email, @Param("password")String password);

    public User findRoles(String email);
}
