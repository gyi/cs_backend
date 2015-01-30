package com.cs.backend.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.ServerMapper;
import com.cs.backend.db.model.Server;
import com.cs.backend.service.GameServerService;

/**
 * @author zhaowei
 * @date 2014-7-25
 * 
 */
@Component
public class GameServerServiceImpl implements GameServerService {

	@Resource
	private ServerMapper serverMapper ;
	
	public Server getServerById(int sid) {
		return serverMapper.selectByPrimaryKey(sid);
	}

	public Server getServerListByAreaIdServerId(int areaId, int serverId) {
		Server server = new Server() ;
		server.setAreaId(areaId);
		server.setServerId(serverId);
		return serverMapper.getServerListByAreaIdServerId(server);
	}

	public List<Server> getServerListByAreaId(int areaId) {
		return serverMapper.getServerListByAreaId(areaId);
	}

	public List<Server> getAllServerList() {
		return serverMapper.getAllServerList();
	}

	public int addServer(Server server) {
		int state = serverMapper.insert(server) ;
		return state;
	}

	public List<Server> selectServerByXX(Server server) {
		return serverMapper.selectServerByXX(server);
	}

	public int modifyServer(Server server) {
		int state = serverMapper.updateByPrimaryKeySelective(server) ;
		return state;
	}

	public List<Server> getServersByServersStr(String servers) throws Exception {
		String sids[] = servers.split(",") ;
		List<Server> serversList = new ArrayList<Server>() ;
		for(String sid : sids) {
			Server server = serverMapper.selectByPrimaryKey(Integer.valueOf(sid)) ;
			if(server==null) {
				throw new RuntimeException("server id=" + sid + " is not exsit") ;
			}
			serversList.add(server) ;
		}
		return serversList;
	}

}
