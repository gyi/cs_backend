package com.cs.backend.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.PlatformMapper;
import com.cs.backend.db.model.Platform;
import com.cs.backend.service.PlatformService;

/**
 *
*
* @Description: TODO 平台服务类
* @author GYI 
* @Ceatetime 2014年6月24日
*
 */

@Component
public class PlatformServiceImpl implements PlatformService {
	
	@Resource
	private PlatformMapper platformMapper ;
	
	/**
	 * 根据角色id找到角色
	 */
	public Platform selectByPrimaryKey(Integer id) throws Exception {
		Platform platform = platformMapper.selectByPrimaryKey(id) ;
		return platform;
	}

	
	public List<Platform> selectAllPlatform() throws Exception {
		return platformMapper.selectAllPlatform();
	}

	public Platform createPlatform(Integer platformId, String platformName, String platformRight, Integer exchangeRate, String describle, Integer realRate, Integer isDelete){
		Platform platform = new Platform();
		platform.setPlatformId(platformId);
		platform.setPlatformName(platformName);
		platform.setPlatformRight(platformRight);
		platform.setExchangeRate(exchangeRate);
		platform.setDescrible(describle);
		platform.setRealRate(realRate);
		platform.setIsDeleted(isDelete);
		return platform;
	}
	
	public int addPlatform(Platform platform) throws Exception {
		int state = platformMapper.insert(platform) ;
		return state;
	}

	public int modifyPlatform(Platform platform) throws Exception {
		int state = platformMapper.updateByPrimaryKeySelective(platform) ;
		return state;
	}
	
	public List<Platform> selectPlatformByXX(Platform record) throws Exception {
		return platformMapper.selectPlatformByXX(record);
	}


	public List<Platform> selectPlatformByXXPrecise(Platform record) throws Exception{
		return platformMapper.selectPlatformByXXPrecise(record);
	}


	public Platform selectPlatformByName(String platformName) throws Exception {
		return platformMapper.selectPlatformByName(platformName);
	}
	
	/**
	 * 看看哪些权限分配给了该平台
	 * @param rightArray
	 * @param platform
	 * @return
	 */
	public int pickRight(Platform platform, String right) {
		if(right!=null&&!right.equals("")){
			Pattern p = Pattern.compile("\\d+");
			Matcher m = p.matcher(right);
			while (m.find()) {
				String rights = m.group() ;
				if(platform.getPlatformId()==Integer.valueOf(rights)||platform.getPlatformId().equals(Integer.valueOf(rights))){
					return 1;
				}
			}
		}
		return 0;
	}
	
	/**
	 * 平台信息与权限相关联
	 */
	public List<Map<String, Object>> platformRelateRight(List<Platform> platformsList) {
		List<Map<String, Object>> platformsListCRight = new ArrayList<Map<String, Object>>();
		try {
			
			for (Platform platform : platformsList) {
				Map<String, Object> platformMap = new HashMap<String, Object>();
				List<Platform> platformRightList = new ArrayList<Platform>();
				if(platform.getPlatformRight()!=null&&!platform.getPlatformRight().equals("")){
					Pattern p = Pattern.compile("\\d+");
					Matcher m = p.matcher(platform.getPlatformRight());
					while (m.find()) {
						String rights = m.group() ;
						platformRightList.add(selectByPrimaryKey(Integer.valueOf(rights)));
					}
					
				}
				
				platformMap.put("platform", platform);
				platformMap.put("platfromRightList", platformRightList);
				platformsListCRight.add(platformMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return platformsListCRight;
	}
	
	public String toDescRight(String right){
		
		String describe = "";
		try {
			if(right!=null&&!right.equals("")){
				Pattern p = Pattern.compile("\\d+");
				Matcher m = p.matcher(right);
				while (m.find()) {
					String rights = m.group() ;
					describe += "["+selectByPrimaryKey(Integer.valueOf(rights)).getDescrible()+"]";
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return describe;
	}
	
	/**
	 * 将自身也添加到权限序列中
	 * @param platform
	 */
	public void platformAddSelfToRight(Platform platform, String platformRight) {
		try {
			Platform platform2 = new Platform();
			platform2.setPlatformId(selectPlatformByXX(platform).get(0).getPlatformId());
			platform2.setPlatformRight(platformRight+"["+(selectPlatformByXX(platform).get(0).getPlatformId())+"]");
			modifyPlatform(platform2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
