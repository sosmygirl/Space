package com.hqyj.action.web;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/5
 */

import com.hqyj.bean.role.Role;
import com.hqyj.bean.space.Building;
import com.hqyj.bean.space.BuildingType;
import com.hqyj.bean.user.User;
import com.hqyj.service.user.UserService;
import com.hqyj.service.web.SpaceWebService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/web")
public class  WebSpaceAction {
    @Autowired
    private SpaceWebService service;
    @Autowired
    private UserService userService;

    @RequestMapping("/spacelist")
    public String spacelist(Map<String, List<Building>> map){
        List<Building> buildings= service.findBuildingAndSpace();
        map.put("buildings", buildings);
        return "web/spacelist";
    }

    @RequestMapping("/findBuildingTypes")
    @ResponseBody
    public List<BuildingType> findBuildingTypes(){
        return service.findTypeAndBuilding();
    }


    @RequestMapping("/validate")
    @ResponseBody
    public String validate(@RequestParam("typeid") int typeid){
        Subject currentUser = SecurityUtils.getSubject();
        String username = (String) currentUser.getPrincipal();
        User webuser = userService.findRoles(username);
        String rolename="";
        for (Role r :webuser.getRoles() ) {
            rolename = r.getRolename();
        }
        //
        List<BuildingType> types = service.findTypeid(rolename);
        Set<Integer> set = new HashSet<>();
        for (BuildingType type : types) {
            set.add(type.getId());
        }
        if (set.contains(typeid)) {
            return "success";
        } else {
            return "error";
        }

    }
}
