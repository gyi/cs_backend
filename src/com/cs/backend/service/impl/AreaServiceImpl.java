package com.cs.backend.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.AreaMapper;
import com.cs.backend.db.model.Area;
import com.cs.backend.service.AreaService;

/**
 * 
*
* @Description: TODO	区服务实现
* @author zhaowei 
* @Ceatetime 2014年9月17日
*
 */
@Component
public class AreaServiceImpl implements AreaService {
	
	@Resource
	private AreaMapper areaMapper ;
	
	public Area selectAreaById(int areaId)  throws Exception {
		return areaMapper.selectByPrimaryKey(areaId);
	}

	public List<Area> selectAllAreas()  throws Exception {
		//查询所有未删除的区
		return areaMapper.selectAllAreasWithoutDeleted();
	}

}
