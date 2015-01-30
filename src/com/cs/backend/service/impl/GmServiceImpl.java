package com.cs.backend.service.impl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Component;

import com.cs.backend.db.model.Server;
import com.cs.backend.service.GmService;
import com.cs.backend.util.JsonHelper;
import com.cs.backend.util.SocketUtil;

/**
 * 
*
* @Description: TODO	gm服务实现类
* @author zhaowei 
* @Ceatetime 2014年9月18日
*
 */
@Component
public class GmServiceImpl implements GmService {
	
	private Logger logger = Logger.getLogger(Logger.class) ;
	
	@Resource
	private TaskExecutor threadPool;
	
	public Map<String, Boolean> gmCmdStart(final long roleId, List<Server> servers, final String gmcd)  throws Exception{
		final CountDownLatch latch = new CountDownLatch(servers.size());
		final ConcurrentHashMap<String, Boolean> concurrentHashMap = new ConcurrentHashMap<String, Boolean>() ;
		for(final Server server : servers) {
			threadPool.execute(new Runnable() {
				public void run() {
					try {
						SocketUtil.getHttpGmResult(server, gmcd, roleId) ;
					} catch (Exception e) {
						concurrentHashMap.put(server.getServerIp() + "_" + server.getSocketPort(), false) ;
						logger.error("server ip=" + server.getServerIp() + "port=" + server.getSocketPort() + " http request confused!!!", e);
					}finally{
						latch.countDown();
					}
				}
			});
		}
		latch.await();
		return concurrentHashMap;
	}

	@SuppressWarnings("unchecked")
	public String gmCmd(long roleId, Server server, String cmd) {
		Map<String, String> map = null ;
		try {
			String result = SocketUtil.getHttpGmResult(server, cmd, roleId) ;
			map = JsonHelper.json2Obj(result, Map.class) ;
		} catch (Exception e) {
			logger.error("server ip=" + server.getServerIp() + "port=" + server.getSocketPort() + " http request confused!!!", e);
		}
		return map.get("result").equals("0")?"success":map.get("resultDesc");
	}

}
