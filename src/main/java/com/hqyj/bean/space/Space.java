package com.hqyj.bean.space;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/4
 */

import java.io.Serializable;

public class Space implements Serializable {
    private int id;
    private String name;
    private int vol;
    private String describe;

    public Space() {
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

    public int getVol() {
        return vol;
    }

    public void setVol(int vol) {
        this.vol = vol;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "Space{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", vol=" + vol +
                ", describe='" + describe + '\'' +
                '}';
    }
}
