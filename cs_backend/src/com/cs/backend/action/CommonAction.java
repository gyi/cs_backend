package com.cs.backend.action;

import org.apache.log4j.Logger;

/**
 * 
*
* @Description: TODO	通用控制类
* @author zhaowei 
* @Ceatetime 2014年9月17日
*
 */
public class CommonAction extends BaseAction {

	private static final long serialVersionUID = 4303139107620939992L;
	
	private Logger logger = Logger.getLogger(Logger.class) ;
	
	/**
	 * 返回结果
	 */
	public String result ;
	
	/**
	 * 服务器菜单
	 */
	public String serversMenu ;
	
	public String getServerMenu(){
		try {
			serversMenu = getAllServers() ;
		} catch (Exception e) {
			logger.error("server menu is error", e);
		}
		return SUCCESS ;
	}
	
	public String getServerOneMenu() {
		try {
			serversMenu = getAllServers() ;
		} catch (Exception e) {
			logger.error("server menu is error", e);
		}
		return SUCCESS ;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setServersMenu(String serversMenu) {
		this.serversMenu = serversMenu;
	}
	
	public String getServersMenu() {
		return serversMenu ;
	}
}
