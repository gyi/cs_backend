package com.cs.backend.security;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.struts2.ServletActionContext;

import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.Role;
import com.cs.backend.db.model.User;
import com.cs.backend.service.MenuService;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;

/**
 * 
* @Description: TODO 用户认证授权类
* @author zhaowei 
* @Ceatetime 2014年6月23日
*
 */
public class MyRealm extends AuthorizingRealm {
	
	@Resource
	private UserService userService ;
	
	@Resource
	private RoleService roleService ;
	
	@Resource
	private MenuService menuService ;
	/** 
     * 授权信息 
     */  
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		User user = (User) principals.getPrimaryPrincipal() ;
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo() ;
		
		Role role = null ;
		List<Menu> menus = null ;
		try {
			role = roleService.selectByPrimaryKey(user.getRoleId()) ;
			menus = menuService.selectMenusByRoleid(user.getRoleId()) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
		info.addRole(role.getRoleName());
		for(Menu menu : menus) {
			info.addStringPermission(String.valueOf(menu.getId()));
		}
		
		return info; 
	}

	/** 
     * 认证信息 
     */ 
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token ;
		String username = (String) usernamePasswordToken.getPrincipal() ;
		String password = String.valueOf(usernamePasswordToken.getPassword()) ;
		User user = null;
		try {
			user = userService.selectUserByName(username);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(user!=null&&user.getPassWord().equals(password)) {
			ServletActionContext.getRequest().getSession().setAttribute("USERNAME", username);
			return new SimpleAuthenticationInfo(user, user.getPassWord(),getName()) ;
		}else {
			throw new AuthenticationException ("用户认证错误") ;
		}
	}
}
