package com.cs.backend.service;

import java.util.List;

import com.cs.backend.db.model.Area;

/**
 * 
*
* @Description: TODO	区服务接口
* @author zhaowei 
* @Ceatetime 2014年9月17日
*
 */
public interface AreaService {
	/**
	 * 根据区id找到对应区服
	 */
	public Area selectAreaById(int areaId) throws Exception ;
	
	/**
	 *查询所有区（不包含逻辑删除的） 
	 */
	public List<Area> selectAllAreas() throws Exception ;
}
