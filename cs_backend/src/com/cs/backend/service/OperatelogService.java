package com.cs.backend.service;

import com.cs.backend.db.model.Operatelog;

/**
 * @Description: TODO	操作日志抽象服务类
 * @author GYI 
 * @Ceatetime 2014年6月24日
 *
 */
public interface OperatelogService {
	/**
	 * 添加操作日志
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	public int addOperatelog(Operatelog operatelog) throws Exception ;
}