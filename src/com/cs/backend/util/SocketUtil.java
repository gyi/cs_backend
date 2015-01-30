package com.cs.backend.util;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.cs.backend.db.model.Server;
import com.cs.global.server.data.Gmcmd;

/**
 * 
*
* @Description: TODO	SOCKET连接
* @author zhaowei 
* @Ceatetime 2014年8月20日
*
 */
public class SocketUtil {
	
	private static Logger logger = Logger.getLogger(SocketUtil.class);
	
	public static String getHttpGmResult(Server server, String msg, long roleId) throws Exception {
		String url = "http://" + server.getServerIp() + ":" + server.getSocketPort() + "/gm.action?cmd=" ;
		Gmcmd gmcmd = new Gmcmd() ;
		gmcmd.setRoleId(roleId); 
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("orderType", msg.split(" ")[0]) ;
		map.put("orderContent", msg.split(" ")[1]) ;
		gmcmd.setMap(map);
		String urlres = URLEncoder.encode(JsonHelper.obj2Json(gmcmd), "utf-8") ;
		url += urlres ;
		logger.info("执行gm命令:" + url);
		String result = Http.submit(url) ;
		logger.info("返回:" + URLDecoder.decode(result, "utf-8"));
		return  result;
	}

}
