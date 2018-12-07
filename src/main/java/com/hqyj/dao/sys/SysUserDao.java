package com.hqyj.dao.sys;

import com.hqyj.bean.sys.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserDao {

	public SysUser findSysUser(SysUser loginuser);

	public int addSysUser(SysUser user);

	public int updatePwd(@Param("password") String password, @Param("email")String email);
	public List<SysUser> findAll(@Param("username") String username);

}
