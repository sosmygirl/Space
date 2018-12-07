package com.hqyj.service.web;

import com.hqyj.bean.space.Building;
import com.hqyj.bean.space.BuildingType;
import com.hqyj.dao.space.SpaceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/5
 */
@Service
public class SpaceWebService {
    @Autowired
    private SpaceDao dao;
    public List<BuildingType> findTypeAndBuilding(){
        return dao.findTypeAndBuilding();
    }
    public List<Building> findBuildingAndSpace(){
        return dao.findBuildingAndSpace();
    }
    public List<BuildingType> findTypeid(String rolename){
        return dao.findTypeid(rolename);
    }
}
