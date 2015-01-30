package com.cs.backend.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.cs.backend.db.model.Server;
import com.cs.backend.service.GameServerService;
import com.cs.backend.service.GmService;
import com.cs.backend.service.PlayerService;
import com.cs.backend.util.StringUtil;


/**
 * 
*
* @Description: TODO	gm控制
* @author zhaowei 
* @Ceatetime 2014年9月17日
*
 */
public class GmAction extends BaseAction {

	private static final long serialVersionUID = 2680409766349595918L;
	
	private Logger logger = Logger.getLogger(Logger.class) ;
	
	@Resource
	private GmService gmService ;
	
	@Resource
	private GameServerService gameServerService ;
	
	@Resource
	private PlayerService playerService ;
	
	/**
	 * 返回结果
	 */
	private String result ;
	
	/**
	 * 区服
	 */
	private String servers ;
	
	/**
	 * gm命令
	 */
	private String gmcmd ;
	
	/**
	 * 角色信息类型
	 */
	private String roleMessageType ;
	
	/**
	 * 角色信息
	 */
	private String roleMessage ;
	
	/**
	 * 返回信息
	 */
	private String message ;
	
	
	/**
	 * 全局gm页面
	 */
	public String gmGlobal() {
		return SUCCESS;
	}
	
	//gm请求
	public String gmStart() {
		result = "false" ;
		try {
			List<Server> serversList = gameServerService.getServersByServersStr(servers) ;
			 
			if(roleMessageType.equals("2")) {
				Map<String, String> roleMap = playerService.getPlayerRoleByRoleName(serversList.get(0), roleMessage) ;//查询角色信息(根据角色名)
				if(roleMap==null) {
					message = getText("gccp.player.roleIsNotExsit") ;
					return SUCCESS ;
				}else {
					roleMessage = roleMap.get("roleId") ;
				}
			}else {
				Map<String, String> roleMap = playerService.getPlayerRoleByRoleId(serversList.get(0), Long.valueOf(roleMessage)) ;//查询角色信息(根据角色id)
				if(roleMap==null) {
					message = getText("gccp.player.roleIsNotExsit") ;
					return SUCCESS ;
				}
			}
			String mapResult = gmService.gmCmd(Long.valueOf(roleMessage), serversList.get(0), gmcmd) ;
			if(!mapResult.equals("success")){
				message = mapResult ;
			}else {
				message = getText("gccp.gm.success") ;
				result = "true" ;
			}
		} catch (Exception e) {
			logger.error("gm控制类报错", e);
			this.addActionError(getText("gccp.action.error"));
		}
		return SUCCESS ;
	}
	
	/**
	 * 验证gm全局
	 */
	public void validateGmStart() {
		if(StringUtil.isAllBlank(servers, gmcmd, roleMessageType, roleMessage)) {
			this.addFieldError("insertIsNull", getText("gccp.common.fieldIsNull"));
			return ;
		}
		if(!roleMessageType.equals("1")&&!roleMessageType.equals("2")){
			this.addFieldError("roleMessageTypeIsNotCorrect", getText("gccp.common.roleTypeMessageIsNotCorrect"));
			return ;
		}
		
		if(!isCorrectServers(servers)){
			this.addFieldError("serversIsNotCorrect", getText("gccp.common.serversIsNotCorrect"));
			return ;
		}
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getServers() {
		return servers;
	}

	public void setServers(String servers) {
		this.servers = servers;
	}

	public String getGmcmd() {
		return gmcmd;
	}

	public void setGmcmd(String gmcmd) {
		this.gmcmd = gmcmd;
	}

	public String getRoleMessageType() {
		return roleMessageType;
	}

	public void setRoleMessageType(String roleMessageType) {
		this.roleMessageType = roleMessageType;
	}

	public String getRoleMessage() {
		return roleMessage;
	}

	public void setRoleMessage(String roleMessage) {
		this.roleMessage = roleMessage;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
