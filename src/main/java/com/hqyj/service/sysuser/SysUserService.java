package com.hqyj.service.sysuser;

import com.github.pagehelper.PageHelper;
import com.hqyj.bean.sys.SysUser;
import com.hqyj.dao.sys.SysUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/3
 */
@Service
public class SysUserService {

    @Autowired
    private SysUserDao dao;

    public SysUser findSysUser(SysUser loginuser) {
        return dao.findSysUser(loginuser);
    }

    public boolean addSysUser(SysUser u) {
        boolean flag = false;
        int m = dao.addSysUser(u);
        if (m>0){
            flag=true;
            return flag;
        }else
            return flag;
    }

    public boolean updatePwd(String password, String email) {
        boolean flag = false;
        if (dao.updatePwd(password,email)>0){
            flag = true;
            return flag;
        }else return  flag;
    }

    public List<SysUser> findByPage(String username,int currentpage,int pagesize){
        PageHelper.startPage(currentpage, pagesize);
        return dao.findAll(username);
    }

}
