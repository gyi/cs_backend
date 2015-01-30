package com.cs.backend.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.OperatelogMapper;
import com.cs.backend.db.model.Operatelog;
import com.cs.backend.service.OperatelogService;

/**
 * 
* @Description: TODO 操作日志服务类
* @author GYI 
* @Ceatetime 2014年6月24日
*
 */
@Component
public class OperatelogServiceImpl implements OperatelogService {
	
	@Resource
	private OperatelogMapper operatelogMapper ;
	
	/**
	 * 添加操作日志
	 */
	public int addOperatelog(Operatelog operatelog) throws Exception {
		int state = operatelogMapper.insert(operatelog) ;
		return state;
	}

}
