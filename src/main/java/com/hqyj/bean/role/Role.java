package com.hqyj.bean.role;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/6
 */

import java.io.Serializable;


public class Role implements Serializable {
    private int id;
    private String rolename;

    public Role() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", rolename='" + rolename + '\'' +
                '}';
    }
}
