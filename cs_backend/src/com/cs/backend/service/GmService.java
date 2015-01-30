package com.cs.backend.service;

import java.util.List;
import java.util.Map;

import com.cs.backend.db.model.Server;

/**
 * 
*
* @Description: TODO	gm服务接口
* @author zhaowei 
* @Ceatetime 2014年9月18日
*
 */
public interface GmService {
	/**
	 * gm命令允许(区服群)
	 */
	public Map<String, Boolean> gmCmdStart(final long roleId, List<Server> servers, final String gmcd) throws Exception  ;
	
	/**
	 * 单个区服gm
	 */
	public String gmCmd(final long roleId, Server server, final String cmd) ;
}
