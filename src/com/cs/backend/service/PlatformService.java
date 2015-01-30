package com.cs.backend.service;

import java.util.List;
import java.util.Map;

import com.cs.backend.db.model.Platform;

/**
 * 
*
* @Description: TODO	平台服务抽象类
* @author GYI
* @Ceatetime 2014年7月11日
*
 */
public interface PlatformService {
	/**
	 * 按id查询指定平台
	 * @param platformId
	 * @return
	 * @throws Exception
	 */
	public Platform selectByPrimaryKey(Integer platformId) throws Exception ;
	
	/**
	 * 查询所有的平台
	 * @return
	 * @throws Exception
	 */
	public List<Platform> selectAllPlatform()throws Exception ;
	
	/**
	 * 创建平台
	 * @param platformId
	 * @param platformName
	 * @param exchangeRate
	 * @param describle
	 * @param realRate
	 * @param isDelete
	 * @return
	 */
	public Platform createPlatform(Integer platformId, String platformName, String platformRight, Integer exchangeRate, String describle, Integer realRate, Integer isDelete);
	
	/**
	 * 添加平台
	 * @param platform
	 * @return
	 */
	public int addPlatform(Platform platform) throws Exception;
	
	/**
	 * 修改平台信息
	 * @param platform
	 * @return
	 */
	public int modifyPlatform(Platform platform) throws Exception;
	
	/**
	 * 按条件模糊查找平台
	 * @param record
	 * @return
	 */
	public List<Platform> selectPlatformByXX(Platform record) throws Exception;
	
	/**
	 * 按条件精确查找平台
	 * @param record
	 * @return
	 */
	public List<Platform> selectPlatformByXXPrecise(Platform record) throws Exception;

	/**
	 * 按照平台名查找平台
	 * @param platformName
	 * @return
	 */
	public Platform selectPlatformByName(String platformName) throws Exception;
	
	/**
	 * 看看那些权限分配给了该平台
	 * @param rightArray
	 * @param platform
	 * @return
	 */
	public int pickRight(Platform platform, String right);
	
	/**
	 * 平台信息与权限相关联
	 */
	public List<Map<String, Object>> platformRelateRight(List<Platform> platformsList);
	
	/**
	 * 对权限进行描述
	 * @param right
	 * @return
	 */
	public String toDescRight(String right);

	/**
	 * 将自身也添加到权限序列中
	 * @param platform
	 */
	public void platformAddSelfToRight(Platform platform, String platformRight);
	
}
