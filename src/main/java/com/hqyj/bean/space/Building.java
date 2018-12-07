package com.hqyj.bean.space;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/4
 */

import java.io.Serializable;
import java.util.List;

public class Building implements Serializable {
    private int id;
    private String name;
    private String describe;
    private BuildingType type;
    private List<Space> spaces;


    public Building() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public BuildingType getType() {
        return type;
    }

    public void setType(BuildingType type) {
        this.type = type;
    }

    public List<Space> getSpaces() {
        return spaces;
    }

    public void setSpaces(List<Space> spaces) {
        this.spaces = spaces;
    }

    @Override
    public String toString() {
        return "Building{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", describe='" + describe + '\'' +
                ", type=" + type +
                ", spaces=" + spaces +
                '}';
    }
}
