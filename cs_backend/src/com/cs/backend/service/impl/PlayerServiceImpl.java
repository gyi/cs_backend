package com.cs.backend.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.model.Server;
import com.cs.backend.service.PlayerService;
import com.cs.backend.util.DBUtil4Game;

/**
 * 
*
* @Description: TODO	玩家实现类
* @author zhaowei 
* @Ceatetime 2014年9月18日
*
 */
@Component
public class PlayerServiceImpl implements PlayerService{
	
	@Resource
	private DBUtil4Game dbUtil4Game ;

	public Map<String, String> getPlayerRoleByRoleName(Server server, String roleName) {
		String sql = "SELECT * FROM role WHERE nickName=?" ;
		List<Map<String, String>> mapsList = dbUtil4Game.select(server, sql, roleName) ;
		
		return mapsList==null||mapsList.size()==0?null:mapsList.get(0);
	}

	public Map<String, String> getPlayerRoleByRoleId(Server server, long roleId) {
		String sql = "SELECT * FROM role WHERE roleId=?" ;
		List<Map<String, String>> mapsList = dbUtil4Game.select(server, sql, roleId) ;
		return mapsList==null||mapsList.size()==0?null:mapsList.get(0);
	}

}
