package com.cs.backend.service;

import java.util.List;

import com.cs.backend.db.model.Server;

/**
 * @Description: TODO	游戏服务器接口
 * @author zhaowei
 * @date 2014-7-25
 * 
 */
public interface GameServerService {
	/**
	 * 	根据区服唯一id找到指定区服
	 */
	public Server getServerById(int sid) throws Exception;
	
	/**
	 * 根据平台id，区服id找到指定区服
	 */
	public Server getServerListByAreaIdServerId(int areaId, int serverId) throws Exception;
	
	/**
	 * 根据平台id找到指定平台的所有区服
	 */
	public List<Server> getServerListByAreaId(int areaId) throws Exception ;
	
	/**
	 * 查询所有的区服
	 */
	public List<Server> getAllServerList() throws Exception ;
	
	/**
	 * 添加平台
	 * @return
	 */
	public int addServer(Server server) throws Exception;

	/**
	 * 按条件模糊查询
	 * @param server
	 * @return
	 */
	public List<Server> selectServerByXX(Server server);

	/**
	 * 修改区服
	 * @param server
	 * @return 
	 */
	public int modifyServer(Server server) throws Exception;
	
	/**
	 * 根据字符串找到区服
	* @param @param servers
	* @param @return
	* @param @throws Exception 
	* @return List<Server>    返回类型 
	* @throws
	 */
	public List<Server> getServersByServersStr(String servers) throws Exception ;
}
