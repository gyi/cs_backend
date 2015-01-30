package com.cs.backend.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.cs.backend.db.model.Server;

/**
 * @author zhaowei
 * @date 2014-7-24
 * 
 */
@Component("dBUtil4Game")
@Scope("prototype")
public class DBUtil4Game extends DBUtileBase{

	private static Logger logger = Logger.getLogger(DBUtil4Game.class);
	
	public DBUtil4Game(){}
	
	public List<Map<String, String>> select(Server server, String sql, Object... values) {
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection conn = getConnection(server);
		if(conn != null){
			try {
				ps = conn.prepareStatement(sql);
				for (int i = 1; i <= values.length; i++) {
					ps.setObject(i, values[i-1]);
				}
				rs = ps.executeQuery();
				resultList.addAll(handle(rs));
			} catch (Exception e) {
				logger.error("游戏库查询错误：",e);
				return null;
			} finally{
				closeRS(rs);
				closePS(ps);
				closeCONN(conn);
			}
		}
		
		return resultList;
	}
	
	private Connection getConnection(Server server){
		Connection conn = createConnection(server.getGamedbip(), server.getGamedbport(), server.getGamedbName(), server.getDbUsername(), server.getDbPassword());
		return conn;
	}
}
