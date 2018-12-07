package com.hqyj.action.space;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.hqyj.bean.space.Building;
import com.hqyj.bean.space.BuildingType;
import com.hqyj.bean.space.Space;
import com.hqyj.service.space.SpaceService;

/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/4
 */
@Controller
@RequestMapping("/space")
public class SpaceAction {
    @Autowired
    private SpaceService service;



    @RequestMapping("/alltype")
    @ResponseBody
    public List<BuildingType> findAllType(){

        return service.findAll();
    }

    @RequestMapping("/findbuildingtypebypage")
    public String toSpace(@RequestParam("currentpage") int currentpage ,
                          @RequestParam("pagesize") int pagesize,
                          @RequestParam("typeid") int typeid,
                          @RequestParam(value = "keyword" ,required = false) String keyword,
                          Map map){
        List<Building> buildings = service.findBuildings(currentpage, pagesize, typeid,keyword);
        PageInfo page = new PageInfo(buildings);
        map.put("buildings",buildings);
        map.put("page", page);
        map.put("typeid", typeid);
        map.put("keyword",keyword);
        return "space/buildinglist";
    }

    @RequestMapping("/addspace")
    public ModelAndView toaddSpace(){
        List<BuildingType> list = service.findAllBuildingType();
        ModelAndView mv = new ModelAndView("space/addspace");
        mv.addObject("buildingType", list);
        return mv;
    }

    @RequestMapping("/doaddbuilding")
    @ResponseBody
    public String doAddBuilding(@RequestParam("name")String name,
                                @RequestParam("describe")String describe,
                                @RequestParam("typeid")int typeid){
        if (name==null||name==""||describe==null||describe==""){
            return "error";
        }else{
            List<String>  list = service.findBuildingName();
            if (!list.contains(name)) {
                if (service.addNewBuilding(name,describe,typeid)){
                    return "ok";
                }else return "error";
            }else return "error1";
        }
    }

    /*查看教学楼的教室信息*/
    @RequestMapping("/buildingspace")
    public String buildingspace(@RequestParam("currentpage") int currentpage,@RequestParam("pagesize")int pagesize,
                                @RequestParam("buildingid")int buildingid,
                                @RequestParam(value = "keyword",required = false)String keyword,Map<String,Object> map){
        List<Space> spaces = service.findSpaceByBuildingId(currentpage, pagesize, buildingid,keyword);
        PageInfo page = new PageInfo(spaces);
        map.put("spaces",spaces);
        map.put("page", page);
        map.put("buildingid", buildingid);
        map.put("keyword", keyword);
        return "space/spacelist";
    }






}
