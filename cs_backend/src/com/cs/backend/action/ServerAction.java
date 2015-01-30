package com.cs.backend.action;

import java.sql.Connection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.cs.backend.db.model.Area;
import com.cs.backend.db.model.Server;
import com.cs.backend.service.AreaService;
import com.cs.backend.service.GameServerService;
import com.cs.backend.util.DBUtileBase;
import com.cs.backend.util.StringUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 
 * @Description: TODO 服务器控制类
 * @author GYI
 * @Ceatetime 2014年7月11日
 * 
 */
public class ServerAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private Logger logger = Logger.getLogger(Logger.class) ;
	
	@Resource
	private AreaService areaService;
	
	@Resource
	private GameServerService gameServerService;
	
	/**
	 * 返回结果
	 */
	private String result;

	/**
	 * 区服列表
	 */
	private List<Server> serversList;
	
	/**
	 * 平台列表
	 */
	private List<Area> areasList;

	/**
	 * 区服
	 */
	private Server oneServer;
	
	/**
	 * 区服id
	 */
	private int id;
	
	/**
	 * 区服名
	 */
	private String serverName;
	
	/**
	 * 平台id
	 */
	private int areaId;
	
	/**
	 * 平台名
	 */
	private String areaName;

	/**
	 * 开服时间
	 */
	private long openTime;
	
	/**
	 * 游戏库iP
	 */
	private String gamedbip;
	
	/**
	 * 游戏库端口
	 */
	private int gamedbport;
	
	/**
	 * 连接游戏端口
	 */
	private int socketPort;
	
	/**
	 * 日志库iP
	 */
	private String logdbip;
	
	/**
	 * 日志库端口
	 */
	private int logdbport;
	
	/**
	 * 数据库密码
	 */
	private String dbPassword;
	
	/**
	 * 游戏库名
	 */
	private String gamedbName;
	
	/**
	 * 当前日志库数据库名
	 */
	private String logdbName;
	
	/**
	 * 数据库用户名
	 */
	private String dbUsername;
	
	/**
	 * 服务器iP
	 */
	private String serverIp;
	
	/**
	 * 区服id
	 */
	private int serverId;
	
	/**
	 * IP
	 */
	private String dbIp;
	
	/**
	 * 数据库名字
	 */
	private String dbName;
	
	/**
	 * 数据库端口
	 */
	private int dbPort;

	/**
	 * 显示添加区服界面
	 */
	public String addServerShowPage() {

		try {
			areasList = areaService.selectAllAreas() ;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}
	
	/**
	 * 添加区服
	 */
	public String serverAdd() {
		try {
			Server server = new Server();
			server.setServerName(serverName);
			server.setAreaId(areaId);
			server.setAreaName(areaService.selectAreaById(areaId).getAreaName());
			server.setGamedbip(gamedbip);
			server.setGamedbport(gamedbport);
			server.setSocketPort(socketPort);
			server.setLogdbip(logdbip);
			server.setLogdbport(logdbport);
			server.setLogdbName(logdbName);
			server.setDbPassword(dbPassword);
			server.setGamedbName(gamedbName);
			server.setSocketPort(socketPort);
			server.setDbUsername(dbUsername);
			server.setServerIp(serverIp);
			server.setServerId(serverId);
			server.setIsDeleted(0);
			gameServerService.addServer(server);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 验证添加区服
	 */
	public void validateServerAdd() {
		try {
			if(StringUtil.isExsitBlank(serverName, gamedbip, logdbip, logdbName, dbPassword, gamedbName, dbUsername)) {
				this.addFieldError("serverMessageIsNull", getText("serverMessageIsNull"));
				return ;
			}
			
			Area area = areaService.selectAreaById(areaId) ;
			if(area==null) {
				this.addFieldError("areaIsNotExsit", getText("areaIsNotExsit"));
			}
		} catch (Exception e) {
			logger.error("area=" + areaId +  " is not exsit", e);
		}
	}
	
	/**
	 * 验证信息是否能连接数据库
	 * @return
	 */
	public String serverValidateConn() {
		DBUtileBase dbUtilBase = new DBUtileBase();
		Connection conn = null;
		result = "error";
		try {
			conn = dbUtilBase.createConnection(dbIp, dbPort, dbName, dbUsername, dbPassword);
			if(conn==null){
				return INPUT;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		finally{
			dbUtilBase.closeCONN(conn);
		}
		result = "success";
		return SUCCESS;
	}
	
	/**
	 * 按条件搜索平台列表
	 */
	public String searchServer() {
		try {
			Server server = new Server();
			server.setServerName(serverName);
			server.setAreaId(areaId);
			server.setAreaName(areaName);
			server.setGamedbip(gamedbip);
			server.setGamedbport(gamedbport);
			server.setSocketPort(socketPort);
			server.setLogdbip(logdbip);
			server.setLogdbName(logdbName);
			server.setDbPassword(dbPassword);
			server.setGamedbName(gamedbName);
			server.setSocketPort(socketPort);
			server.setDbUsername(dbUsername);
			server.setServerIp(serverIp);
			server.setServerId(serverId);
			serversList = gameServerService.selectServerByXX(server) ;
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示平台列表
	 */
	public String showServerList() {
		try {
			areasList = areaService.selectAllAreas() ;
			serversList = gameServerService.getAllServerList();
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示区服列表
	 */
	public String showServerByPrimaryKey() {
		try {
			areasList = areaService.selectAllAreas() ;
			oneServer = gameServerService.getServerById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}	
	
	/**
	 * 修改区服信息
	 */
	public String serverModify() {
		try {
			Server server = new Server();
			server.setId(id);
			server.setServerName(serverName);
			server.setAreaId(areaId);
			server.setAreaName(areaName);
			server.setGamedbip(gamedbip);
			server.setGamedbport(gamedbport);
			server.setSocketPort(socketPort);
			server.setLogdbip(logdbip);
			server.setLogdbport(logdbport);
			server.setLogdbName(logdbName);
			server.setDbPassword(dbPassword);
			server.setGamedbName(gamedbName);
			server.setSocketPort(socketPort);
			server.setDbUsername(dbUsername);
			server.setServerIp(serverIp);
			server.setServerId(serverId);
			gameServerService.modifyServer(server) ;
			showServerList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 逻辑删除区服
	 */
	public String serverByIdLogicDelete() {
		try {
			Server server = new Server();
			server.setId(id);
			server.setIsDeleted(1);
			gameServerService.modifyServer(server) ;
			//级联删除
			showServerList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public List<Area> getAreasList() {
		return areasList;
	}

	public void setAreasList(List<Area> areasList) {
		this.areasList = areasList;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Server> getServersList() {
		return serversList;
	}

	public void setServersList(List<Server> serversList) {
		this.serversList = serversList;
	}

	public Server getOneServer() {
		return oneServer;
	}

	public void setOneServer(Server oneServer) {
		this.oneServer = oneServer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public long getOpenTime() {
		return openTime;
	}

	public void setOpenTime(long openTime) {
		this.openTime = openTime;
	}

	public String getGamedbip() {
		return gamedbip;
	}

	public void setGamedbip(String gamedbip) {
		this.gamedbip = gamedbip;
	}

	public int getGamedbport() {
		return gamedbport;
	}

	public void setGamedbport(int gamedbport) {
		this.gamedbport = gamedbport;
	}

	public int getSocketPort() {
		return socketPort;
	}

	public void setSocketPort(int socketPort) {
		this.socketPort = socketPort;
	}

	public String getLogdbip() {
		return logdbip;
	}

	public void setLogdbip(String logdbip) {
		this.logdbip = logdbip;
	}

	public int getLogdbport() {
		return logdbport;
	}

	public void setLogdbport(int logdbport) {
		this.logdbport = logdbport;
	}

	public String getDbPassword() {
		return dbPassword;
	}

	public void setDbPassword(String dbPassword) {
		this.dbPassword = dbPassword;
	}

	public String getGamedbName() {
		return gamedbName;
	}

	public void setGamedbName(String gamedbName) {
		this.gamedbName = gamedbName;
	}

	public String getLogdbName() {
		return logdbName;
	}

	public void setLogdbName(String logdbName) {
		this.logdbName = logdbName;
	}

	public String getDbUsername() {
		return dbUsername;
	}

	public void setDbUsername(String dbUsername) {
		this.dbUsername = dbUsername;
	}

	public String getServerIp() {
		return serverIp;
	}

	public void setServerIp(String serverIp) {
		this.serverIp = serverIp;
	}

	public int getServerId() {
		return serverId;
	}

	public void setServerId(int serverId) {
		this.serverId = serverId;
	}

	public String getDbIp() {
		return dbIp;
	}

	public void setDbIp(String dbIp) {
		this.dbIp = dbIp;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	public int getDbPort() {
		return dbPort;
	}

	public void setDbPort(int dbPort) {
		this.dbPort = dbPort;
	}
}
