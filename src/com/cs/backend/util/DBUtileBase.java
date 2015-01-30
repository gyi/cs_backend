package com.cs.backend.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;


/**
 * @author zhaowei
 * @date 2014-7-24
 * 
 */
public class DBUtileBase {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static Logger logger = Logger.getLogger(DBUtileBase.class);
	
	public DBUtileBase(){
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			logger.error("加载数据库驱动错误：", e);
		}
	}
	
	/**
	 * 
	 * @param dbip
	 * @param dbport
	 * @param dbname
	 * @param dbusername
	 * @param dbpassword
	 * @return
	 * TODO 创建连接
	 */
	public Connection createConnection(String dbip, int dbport, String dbname, String dbusername, String dbpassword) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(buildUrl(dbip, dbport, dbname), dbusername, dbpassword);
		} catch (SQLException e) {
			logger.error(buildUrl(dbip, dbport, dbname) + ",创建数据库连接错误：", e);
		}
		return conn;
	}

	/**
	 * 
	 * @param dbip
	 * @param dbport
	 * @param dbname
	 * @return TODO
	 */
	protected String buildUrl(String dbip, int dbport, String dbname) {
		return "jdbc:mysql://" + dbip + ":" + dbport + "/" + dbname + "?characterEncoding=utf8&connectTimeout=8000";// 8秒连接超时
	}
	
	protected void closeRS(ResultSet rs){
		try {
			if(rs != null){
				rs.close();
			}
		} catch (Exception e) {
			logger.error("关闭rs错误：",e);
		}
	}
	
	protected void closePS(PreparedStatement ps){
		try {
			if(ps != null){
				ps.close();
			}
		} catch (Exception e) {
			logger.error("关闭ps错误：",e);
		}
	}
	
	public void closeCONN(Connection conn){
		try {
			if(conn != null){
				conn.close();
			}
		} catch (Exception e) {
			logger.error("关闭conn错误：",e);
		}
	}
	
	protected Set<String> getDBTableName(Connection conn){
		Set<String> dbtablenames = new HashSet<String>();
		ResultSet rs = null;
		try {
			rs = conn.getMetaData().getTables(null, null, null, null);
			while(rs.next()){
				dbtablenames.add(rs.getString("TABLE_NAME"));
			}
		} catch (Exception e) {
			logger.error("取得数据库中所有表名错误：",e);
		} finally{
			closeRS(rs);
		}
		return dbtablenames;
	}
	
	/**
	 * 
	 * @param rs
	 * @return
	 * TODO数据转换，将rs转为List<Map<String, String>>
	 */
	protected List<Map<String, String>> handle(ResultSet rs){
		List<Map<String, String>> result = new ArrayList<Map<String,String>>();
		List<String> columnList = new ArrayList<String>();
		try {
			int columnCount = rs.getMetaData().getColumnCount();
			for (int i = 1; i <= columnCount; i++) {
				columnList.add(rs.getMetaData().getColumnName(i));
			}
			while (rs.next()) {
				Map<String, String> map = new HashMap<String, String>();
				for (String columnname : columnList) {
					String value = rs.getString(columnname);
					map.put(columnname, value);
				}
				result.add(map);
			}
		} catch (SQLException e) {
			logger.error("数据转换错误：",e);
		}
		return result;
	}
	
}
