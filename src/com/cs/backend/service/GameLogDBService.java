package com.cs.backend.service;

import java.util.List;

import com.cs.backend.db.model.GameLogDB;

/**
 * 
*
* @Description: TODO	日志数据库服务类
* @author zhaowei 
* @Ceatetime 2014年7月24日
*
 */
public interface GameLogDBService {
	/**
	 * 通过区服id找到日志库
	 */
	public List<GameLogDB> selectGameLogDBBySid(int sid) ;
}
