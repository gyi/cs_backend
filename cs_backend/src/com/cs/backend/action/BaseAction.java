package com.cs.backend.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.cs.backend.db.model.Area;
import com.cs.backend.db.model.Platform;
import com.cs.backend.db.model.Server;
import com.cs.backend.service.AreaService;
import com.cs.backend.service.GameServerService;
import com.cs.backend.service.MenuService;
import com.cs.backend.service.PlatformService;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;
import com.cs.backend.util.ValidateUtil;
import com.cs.global.server.data.ServerMenu;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
*
* @Description: TODO	基础控制接口
* @author zhaowei 
* @Ceatetime 2014年9月10日
*
 */
public class BaseAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	@Resource
	protected UserService userService ;
	@Resource
	protected MenuService menuService ;
	@Resource
	protected RoleService roleService ;
	@Resource
	protected GameServerService gameServerService ;
	@Resource
	protected AreaService areaService ;
	@Resource
	protected PlatformService platformService ;
	
	public BaseAction() {
	}
	/**
	 * 查询所有平台
	 */
	public List<Platform> getAllPlatforms() throws Exception {
		return platformService.selectAllPlatform() ;
	}
	
	/**
	 * 查询所有服务器
	 */
	public String getAllServers() throws Exception {
		List<Server> servers = gameServerService.getAllServerList() ;
		List<Area> areas = areaService.selectAllAreas() ;
		List<ServerMenu> menusServer = new ArrayList<ServerMenu>() ;
		menusServer.add(createServerMenu("0", getText("gccp.common.all"), "-1")) ;
		for(Server server : servers) {
			ServerMenu serverMenu = createServerMenu(String.valueOf(server.getId()), server.getServerName(), String.valueOf(server.getAreaName())) ;
			menusServer.add(serverMenu) ;
		}
		
		for(Area area : areas) {
			ServerMenu serverMenu = createServerMenu(String.valueOf(area.getAreaName()), area.getDescrible(), "0") ;
			menusServer.add(serverMenu) ;
		}
		return JSON.toJSONString(menusServer) ;
	}
	
	public ValidateUtil readyForValidate() {
		ValidateUtil validateUtil = new ValidateUtil();
		validateUtil.setAthis(this);
		validateUtil.setLanguage(String.valueOf(ServletActionContext.getRequest().getAttribute("LANGUAGE")));
		return validateUtil;
	}
	
	private ServerMenu createServerMenu(String id, String name, String pId) {
		ServerMenu serverMenu = new ServerMenu() ;
		serverMenu.setId(id);
		serverMenu.setName(name);
		serverMenu.setPid(pId);
		return serverMenu ;
	}
	
	public boolean isCorrectServers(String servers) {
		if(servers.matches("[\\d+,]+")) {
			return true ;
		}
		return false;
	}
}
