package com.hqyj.bean.space;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/4
 */

import java.io.Serializable;
import java.util.List;


public class BuildingType implements Serializable {
    private int id;
    private String typename;
    private List<Building> buildings;


    public BuildingType() {
    }

    public List<Building> getBuildings() {
        return buildings;
    }

    public void setBuildings(List<Building> buildings) {
        this.buildings = buildings;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    @Override
    public String toString() {
        return "BuildingType{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                ", buildings=" + buildings +
                '}';
    }
}
