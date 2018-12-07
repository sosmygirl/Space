package com.hqyj.service.space;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hqyj.bean.space.Building;
import com.hqyj.bean.space.BuildingType;
import com.hqyj.bean.space.Space;
import com.hqyj.dao.space.SpaceDao;

/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/4
 */
@Service
public class SpaceService {
    @Autowired
    private SpaceDao dao;
    public List<BuildingType> findAll(){
        return dao.findAll();
    }

    public List<Building> findBuildings(int currentpage, int pagesize, int typeid,String keyword) {
        PageHelper.startPage(currentpage, pagesize);
        return dao.findBuildings(typeid,keyword);
    }

    public List<BuildingType> findAllBuildingType() {
        return dao.findAllBuildingType();
    }

    public boolean addNewBuilding(String name, String describe, int typeid) {

      return dao.addNewBuilding(name,describe,typeid)>0;
    }
    public List<String> findBuildingName(){
        return dao.findBuildingName();
    }

    public List<Space> findSpaceByBuildingId(int currentpage, int pagesize, int  buildingid, String keyword) {
        PageHelper.startPage(currentpage, pagesize);
        return dao.findSpaceByBuildingId(buildingid, keyword);
    }


}
