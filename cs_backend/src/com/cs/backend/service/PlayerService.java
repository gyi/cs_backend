package com.cs.backend.service;

import java.util.Map;

import com.cs.backend.db.model.Server;

/**
 * 
*
* @Description: TODO	玩家接口
* @author zhaowei 
* @Ceatetime 2014年9月18日
*
 */
public interface PlayerService {
	/**
	 * 根据玩家角色名找到角色信息
	 */
	public Map<String, String> getPlayerRoleByRoleName(Server server, String roleName) ;
	
	/**
	 * 根据角色id找到角色信息
	 */
	public Map<String, String> getPlayerRoleByRoleId(Server server, long roleId) ;
}
