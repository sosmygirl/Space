package com.hqyj.dao.space;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/4
 */

import com.hqyj.bean.space.Building;
import com.hqyj.bean.space.BuildingType;
import com.hqyj.bean.space.Space;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpaceDao {
    public List<BuildingType>  findAll();

    public List<Building> findBuildings(@Param("typeid") int typeid, @Param("keyword")String keyword);

    public List<BuildingType> findAllBuildingType();
    public List<Building> findBuildingAndSpace();

    public int addNewBuilding(@Param("name")String name, @Param("describe")String describe,
                              @Param("typeid")int typeid);

    public List<String> findBuildingName();

    public List<Space> findSpaceByBuildingId(@Param("buildingid") int buildingid,@Param("keyword") String keyword);
    public List<BuildingType> findTypeAndBuilding();

    public List<BuildingType> findTypeid(String rolename);


}
