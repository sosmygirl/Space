package com.hqyj.action.sysuser;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/3
 */

import com.github.pagehelper.PageInfo;
import com.hqyj.bean.sys.SysUser;
import com.hqyj.service.sysuser.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sys")
public class SysUserAction {

    @Autowired
    private SysUserService service;
    /* admin/toAddAdmin */
    // 添加管理员

    @RequestMapping("/addadmin")
    public String toAddAdmin() {
        return "sys/add";

    }

    @RequestMapping("/pwdreset")
    public String torPwdReset() {
        return "sys/pwdreset";

    }
//分页第一版
    @RequestMapping("/userlist")
    public String pagelist(@RequestParam(value = "currentpage",required = false) String currentpage,
                           @RequestParam(value = "pagesize",required = false) String pagesize,
                           @RequestParam(value = "keyword",required = false) String keyword,
                            Map<String, Object> map) {
       String cp="1";
        String ps="5";
       if (currentpage==null||currentpage==""){
           currentpage=cp;
       }
       if (pagesize==null||pagesize==""){
           pagesize=ps;
       }
      List<SysUser> list=service.findByPage(keyword,Integer.parseInt(currentpage),Integer.parseInt(pagesize));
        PageInfo page = new PageInfo(list);
        map.put("list",list);
        map.put("page", page);
        map.put("keyword",keyword);
        return "sys/userlist";

    }


    /*ajax 判断用户是否存在*/

   /* @RequestMapping(value = "/valu")
    @ResponseBody
    public String validatorUserName(@RequestParam(value = "username") String username) {

        if (username == null || username == "") {
            return "error";
        }else{
            SysUser user = new SysUser();
            user.setUsername(username);
            SysUser u = service.findSysUser(user);
            if (u!=null){
                return "exist";
            }else {
                return "ok";
            }
        }

    }

    @RequestMapping(value = "/vale")
    @ResponseBody
    public String validatoremail(@RequestParam(value = "email") String email) {
        if (email == null || email == "") {
            return "error";
        }
        SysUser user = new SysUser();
        user.setEmail(email);
        SysUser u = service.findSysUser(user);
        if (u!=null){
            return "exist";
        }else {
            return "ok";
        }
    }
*/

    //添加管理员

    @RequestMapping("/addsysuser")
    @ResponseBody
    public String doRegisterSys(SysUser user) {
        String pwd = new SimpleHash("MD5",user.getPassword(),user.getEmail(),1024).toString();
        SysUser u = new SysUser();
        u.setEmail(user.getEmail());
        u.setPassword(pwd);
        u.setUsername(user.getUsername());
        if (service.findSysUser(u)!=null){
            return "error";
        }else {
           if (service.addSysUser(u)){
               return "ok";
           }else return "error1";

        }



    }

    //修改密码

    @RequestMapping("/updatePwd")
    @ResponseBody
    public String doUpdatepwd(@RequestParam("oldPwd") String oldPwd,
                              @RequestParam("password") String password,
                              @RequestParam("newPwd") String newPwd){

        if(oldPwd==null||oldPwd==""||password==null||password==""||newPwd==null||newPwd==""){
            return "error";
        }

        if (password.equals(newPwd)){
            Subject currentUser = SecurityUtils.getSubject();
            String username=currentUser.getPrincipal().toString();
            SysUser user = new SysUser();
            user.setEmail(username);
            SysUser sysUser  = service.findSysUser(user);
            String pwd = new SimpleHash("MD5",oldPwd,sysUser.getEmail(),1024).toString();
            if (sysUser.getPassword().equals(pwd)){
                boolean flag= service.updatePwd(new SimpleHash("MD5",password,sysUser.getEmail(),1024).toString(),sysUser.getEmail());
                if (flag){
                    return "ok";
                }else return "error";

            }else {
                return "error2";
            }
        }else {
            return "error1";
        }

    }
}
