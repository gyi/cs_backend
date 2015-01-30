package com.cs.global.server.data;

/**
 * 
*
* @Description: TODO 区服vo对象
* @author zhaowei 
* @Ceatetime 2014年9月17日
*
 */
public class ServerMenu {
	/**
	 * 服务器菜单id
	 */
	private String id ;
	/**
	 * 区服名
	 */
	private String name ;
	/**
	 * 父级id
	 */
	private String pid ;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
}
