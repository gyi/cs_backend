package com.test.db;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.cs.backend.service.GameLogDBService;
import com.cs.backend.service.GameServerService;
import com.cs.backend.util.DBUtil4Game;
import com.cs.backend.util.DBUtil4GameLog;
import com.cs.backend.util.DateUtil;
import com.cs.backend.util.ICommonGameLog;
import com.cs.backend.util.TableType;
import com.test.MyBatisConfig;


/**
 * 测试实例
 */
@SuppressWarnings("unused")
public class TestDB{
	public static void main(String[] args) {
		/** 测试游戏库表*/
//		GameServerService gameServerService = MyBatisConfig.getBean(GameServerService.class) ;
//		System.out.println(JSON.toJSONString(gameServerService.getAllServerList())) ;
//		System.out.println(JSON.toJSONString(gameServerService.getServerById(1))) ;
//		System.out.println(JSON.toJSONString(gameServerService.getServerListByPlatformId(1))) ;
//		System.out.println(JSON.toJSONString(gameServerService.getServerListByPlatformIdServerId(1, 1))) ; 
		
		/** 测试日志库表*/
//		GameLogDBService gameLogDBService = MyBatisConfig.getBean(GameLogDBService.class) ;
//		System.out.println(JSON.toJSONString(gameLogDBService.selectGameLogDBBySid(1))) ;
		
		/** 测试查询游戏库*/
//		DBUtil4Game dbUtil4Game = MyBatisConfig.getBean(DBUtil4Game.class) ;
//		GameServerService gameServerService = MyBatisConfig.getBean(GameServerService.class) ;
//		String sql = "SELECT nickName FROM role WHERE lastUpdateTime>?" ;
//		List<Map<String, String>> resultMap = dbUtil4Game.select(gameServerService.getServerById(1), sql, 10000000000L) ;
//		System.out.println(JSON.toJSONString(resultMap)) ; 
		
		/** 测试查询日志库*/
//		DBUtil4GameLog dbUtil4GameLog = MyBatisConfig.getBean(DBUtil4GameLog.class) ;
//		GameServerService gameServerService = MyBatisConfig.getBean(GameServerService.class) ;
//		final long startTime = DateUtil.convertString2long("2014-7-1", 0) ;
//		final long endTime = DateUtil.convertString2long("2014-7-29", 0) ;
//		List<Map<String, String>> mapsList = dbUtil4GameLog.select(gameServerService.getServerById(1), new ICommonGameLog(){
//
//			public String getTablename() {
//				return "activelog";
//			}
//
//			public String getSql(String tableName) {
//				return "select id, name FROM " + tableName;
//			}
//
//			public int getTableType() {
//				return TableType.DAY;
//			}
//
//			public long getStartTime() {
//				return startTime;
//			}
//
//			public long getEndTime() {
//				return endTime;
//			}
//		}) ;
//		System.out.println(JSON.toJSONString(mapsList)) ; 
	}
}
