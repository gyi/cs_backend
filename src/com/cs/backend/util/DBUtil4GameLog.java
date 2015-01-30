package com.cs.backend.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.cs.backend.db.model.GameLogDB;
import com.cs.backend.db.model.Server;
import com.cs.backend.service.GameLogDBService;

/**
 * @author zhaowei
 * @date 2014-7-24
 * 
 */
@Component("dBUtil4GameLog")
@Scope("prototype")
public class DBUtil4GameLog extends DBUtileBase{

	private static Logger logger = Logger.getLogger(DBUtil4GameLog.class);
	
	private static final SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
	
	private static final SimpleDateFormat yyyyMM = new SimpleDateFormat("yyyyMM");
	
	private static final SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd");

	@Resource
	private GameLogDBService gameLogDBService;

	public DBUtil4GameLog() {}
	
	public List<Map<String, String>> select(Server server,ICommonGameLog commonGameLog,Object ... values){
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		Set<String> tables = getTables(commonGameLog.getTablename(), commonGameLog.getStartTime(), commonGameLog.getEndTime(), commonGameLog.getTableType());
		List<Connection> connList = getConnections(server);
		PreparedStatement ps = null;
		ResultSet rs = null;
		for (Connection connection : connList) {
			Set<String> DBTableName = getDBTableName(connection);
			for (String tableName : tables) {
				if(!DBTableName.contains(tableName)){
					logger.info("仓库中没有表"+tableName);
					continue;
				}
				String sql = commonGameLog.getSql(tableName);
				try {
					ps = connection.prepareStatement(sql);
					for (int i = 1; i <= values.length; i++) {
						ps.setObject(i, values[i-1]);
					}
					rs = ps.executeQuery();
					resultList.addAll(handle(rs));
				} catch (Exception e) {
					logger.error(server.getServerName()+",日志查询错误：",e);
				} finally{
					closeRS(rs);
					closePS(ps);
				}
			}
			closeCONN(connection);
		}
		return resultList;
	}
	public List<Map<String, String>> select(Server server,ICommonGameLog commonGameLog,List< Object> paramlist){
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		Set<String> tables = getTables(commonGameLog.getTablename(), commonGameLog.getStartTime(), commonGameLog.getEndTime(), commonGameLog.getTableType());
		List<Connection> connList = getConnections(server);
		PreparedStatement ps = null;
		ResultSet rs = null;
		for (Connection connection : connList) {
			Set<String> DBTableName = getDBTableName(connection);
			for (String tableName : tables) {
				if(!DBTableName.contains(tableName)){
					logger.info("仓库中没有表"+tableName);
					continue;
				}
				String sql = commonGameLog.getSql(tableName);
				try {
					ps = connection.prepareStatement(sql);
					for (int index = 1; index <= paramlist.size(); index++) {
						 Object object = paramlist.get(index-1);
						 ps.setObject(index, object);
					}
					rs = ps.executeQuery();
					resultList.addAll(handle(rs));
				} catch (Exception e) {
					logger.error(server.getServerName()+",日志查询错误：",e);
				} finally{
					closeRS(rs);
					closePS(ps);
				}
			}
			closeCONN(connection);
		}
		return resultList;
	}

	/**
	 * 
	 * @param server
	 * @param sql
	 * @param values
	 * @return
	 * TODO 对单服数据查询
	 */
	public List<Map<String, String>> select(Server server, String sql, Object... values) {
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		List<Connection> connList = getConnections(server);
		PreparedStatement ps = null;
		ResultSet rs = null;
		for (Connection connection : connList) {
			try {
				ps = connection.prepareStatement(sql);
				for (int i = 1; i <= values.length; i++) {
					ps.setObject(i, values[i-1]);
				}
				rs = ps.executeQuery();
				resultList.addAll(handle(rs));
			} catch (Exception e) {
				logger.error(server.getServerName()+",日志查询错误：",e);
			} finally{
				closeRS(rs);
				closePS(ps);
				closeCONN(connection);
			}
		}
		return resultList;
	}
	
	

	/**
	 * 
	 * @param server
	 * @return
	 * TODO根据区服取得数据仓库，并创建数据仓库连接
	 */
	public List<Connection> getConnections(Server server) {
		List<Connection> connList = new ArrayList<Connection>();
		try {
			List<GameLogDB> gameLogDBs = gameLogDBService.selectGameLogDBBySid(server.getId()) ;
			for (GameLogDB gameLogDB : gameLogDBs) {
				Connection conn = createConnection(gameLogDB.getDbip(), gameLogDB.getDbport(),
						gameLogDB.getDbName(), gameLogDB.getDbUsername(), gameLogDB.getDbPassword());
				if(conn != null){
					connList.add(conn);
				}
			}
		} catch (Exception e) {
			logger.error("根据区服取得日志数据库连接错误：",e);
		}
		return connList;
	}

	/**
	 * 
	 * @param baseTableName
	 * @param startTime
	 * @param endTime
	 * @param tableType
	 * @return
	 * TODO
	 */
	private Set<String> getTables(String baseTableName,long startTime,long endTime,int tableType){
		Set<String> tables = new HashSet<String>();
		if(TableType.SINGLE == tableType){
			tables.add(baseTableName);
		}else if(TableType.YEAR == tableType){
			long next = startTime;
			for (long i = startTime; i <= endTime; i = next) {
				String tableName = baseTableName + yyyy.format(new Date(i));
				tables.add(tableName);
				next = DateUtil.getNextPeriodTime(i, tableType);
			}
		}else if(TableType.MONTH == tableType){
			long next = startTime;
			for (long i = startTime; i <= endTime; i = next) {
				String tableName = baseTableName + yyyyMM.format(new Date(i));
				tables.add(tableName);
				next = DateUtil.getNextPeriodTime(i, tableType);
			}
		}else if(TableType.DAY == tableType){
			long next = startTime;
			for (long i = startTime; i <= endTime; i = next) {
				String tableName = baseTableName + yyyyMMdd.format(new Date(i));
				tables.add(tableName);
				next = DateUtil.getNextPeriodTime(i, tableType);
			}
		}
		return tables;
	}
	

}
