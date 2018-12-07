package com.hqyj.shiro;

import com.hqyj.bean.role.Role;
import com.hqyj.bean.user.User;
import com.hqyj.dao.user.UserDao;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.hqyj.bean.sys.SysUser;
import com.hqyj.dao.sys.SysUserDao;

import java.util.HashSet;
import java.util.Set;

public class MyRealm extends AuthorizingRealm {
	
	@Autowired
	private SysUserDao sysUserDao;
	@Autowired
	private UserDao userDao;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Set<String> roles = new HashSet<>();
		 String email = (String) principals.getPrimaryPrincipal();
		 User user = userDao.findRoles(email);
		for (Role role : user.getRoles()) {
			roles.add(role.getRolename());
		}
		AuthorizationInfo info = new SimpleAuthorizationInfo(roles);
		return info;

	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken arg0) throws AuthenticationException{
		
		MyToken token =(MyToken) arg0;
		if (token.getType()==1) {
			String password = new SimpleHash("MD5",token.getPassword(),token.getPrincipal(),1024).toString();
			User user  = userDao.findUserByEmailAndPassword(token.getUsername(),password);
			if (user == null) {
				throw new AuthenticationException();
			}else {
				if (user.getActive()==1) {
					return new SimpleAuthenticationInfo(token.getPrincipal(),token.getPassword(), getName());
				}else {
					throw new AuthenticationException();
				}
			}
			}else{
				SysUser loginuser = new SysUser();
				loginuser.setEmail(token.getUsername());
				String password = new SimpleHash("MD5",new String(token.getPassword()),token.getUsername(),1024).toString();
				loginuser.setPassword(password);
				SysUser sysUser= sysUserDao.findSysUser(loginuser);
				if(sysUser==null) {
					throw new AuthenticationException();
				}
				/*
				 * SimpleAuthenticationInfo(用户名，密码，realName一般调用父类的getName方法）
				 */

				return new SimpleAuthenticationInfo(token.getPrincipal(),token.getPassword(), getName());
			}

	}

}
