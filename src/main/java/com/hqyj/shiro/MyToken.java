package com.hqyj.shiro;
/*
 * @Copyright (c) 1809JEE
 * @author lx
 * @Date 2018/12/6
 */

import org.apache.shiro.authc.UsernamePasswordToken;

public class MyToken extends UsernamePasswordToken {

    private int type;//0代表后端，1代表前端用户

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public MyToken() {
    }

    public MyToken(String username, String password) {
        super(username, password);
    }

	public MyToken(String username, char[] password) {
		super(username, password);
		
	}
    
    
}
