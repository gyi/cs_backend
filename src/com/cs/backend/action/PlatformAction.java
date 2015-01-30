package com.cs.backend.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.cs.backend.db.model.Platform;
import com.cs.backend.service.PlatformService;
import com.cs.backend.util.ValidateUtil;

/**
 * 
 * 
 * @Description: TODO 平台控制类
 * @author GYI
 * @Ceatetime 2014年7月11日
 * 
 */
public class PlatformAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private List<Map<String, Object>> platformsListCRight;

	/**
	 * 平台列表
	 */
	private List<Platform> platformsList;
	
	/**
	 * 一个平台
	 */
	private Platform onePlatform;
	
	/**
	 * 用户id
	 */
	private Integer platformId ;

	/**
	 * 平台名
	 */
	private String platformName;
	
	/**
	 * 平台名
	 */
	private String describle;

	/**
	 * 权限
	 */
	private String platformRight;
	
	/**
	 * 权限
	 */
	private String right;

	/**
	 * 汇率
	 */
	private Integer exchangeRate;
	
	/**
	 * 当地汇率
	 */
	private Integer realRate;
	
	/**
	 * 描述平台
	 */
	private String describleOfRight;
	
	private String result;

	@Resource
	private PlatformService platformService;

	/**
	 * 显示添加平台界面
	 */
	public String addPlatformShowPage() {
	
		return SUCCESS;
	}
	
	private void init(){
		platformId =null ;
		platformName = null;
		describle = null;
		platformRight = "" ;
		right = null ;
		exchangeRate = null;
	}
	
	/**
	 * 添加平台
	 */
	public String platformAdd() {
		try {
			
			Platform platform = platformService.createPlatform(null, platformName, platformRight, exchangeRate, describle, realRate, 0);
			platformService.addPlatform(platform);
			platformService.platformAddSelfToRight(platform, platformRight);
			init();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	public ValidateUtil readyForValidate() {
		result=getText("gccp.validate.fail");
		return super.readyForValidate();
	}
	
	/**
	 * 平台信息验证
	 */
	private void validatePlatform() {
		ValidateUtil validateUtil = readyForValidate();
		try {
			validateUtil.setMinLenAndMaxLen(0, 38);
			validateUtil.enter(platformName, "platformName", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			if(validateUtil.isNoproblem()){
				if (platformService.selectPlatformByName(platformName) != null&&!platformService.selectPlatformByName(platformName).getPlatformId().equals(platformId)) {
					this.addFieldError("platformName", getText("gccp.validate.repetition"));
				}
			}
			
			validateUtil.enter(platformRight, "platformRight", new String[]{"validateBracketsAndNum"});
			
			validateUtil.setMinLenAndMaxLen(0, 100000);
			validateUtil.enter(exchangeRate, "exchangeRate", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			
			validateUtil.enter(realRate, "realRate", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			
			validateUtil.enter(describle, "describle", new String[]{"validateLenghtIsInSide"});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}
	
	/**
	 * 添加平台验证
	 */
	public void validatePlatformAdd() {
		validatePlatform();
	}

	/**
	 * 点击分配权限，可以被分配的权限
	 */
	public String showPlatformRightList() {
		try {
			platformsListCRight = new ArrayList<Map<String, Object>>();
			platformsList = platformService.selectAllPlatform();
			for (Platform platform: platformsList){
				Map<String, Object> platformMap = new HashMap<String, Object>();
				platformMap.put("isRight", platformService.pickRight(platform, right));
				platformMap.put("platfrom", platform);
				platformsListCRight.add(platformMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 按条件搜索平台列表
	 */
	public String searchPlatform() {
		try {
			Platform platform = platformService.createPlatform(null, platformName, null, exchangeRate, describle, realRate, 0);
			platformsList = platformService.selectPlatformByXX(platform) ;
			platformsListCRight = platformService.platformRelateRight(platformsList);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示平台列表
	 */
	public String showPlatformList() {
		try {
			platformsList = platformService.selectAllPlatform();
			platformsListCRight = platformService.platformRelateRight(platformsList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示修改平台界面
	 */
	public String showPlatformByPrimaryKey() {
		try {
			onePlatform = platformService.selectByPrimaryKey(platformId);
			describleOfRight = platformService.toDescRight(onePlatform.getPlatformRight());
			//menusList = menuService.selectAllMenu();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改平台信息
	 */
	public String platformModify() {
		try {
			Platform platform = platformService.createPlatform(platformId, platformName, platformRight, exchangeRate, describle, realRate, 0);
			platformService.modifyPlatform(platform) ;
			showPlatformList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改平台验证
	 */
	public void validatePlatformModify() {
		validatePlatform();
		showPlatformByPrimaryKey();
		
	}
	
	/**
	 * 逻辑删除平台
	 */
	public String platformByIdLogicDelete() {
		try {
			Platform platform = platformService.createPlatform(platformId, null, null, null, null, null, 1);
			platformService.modifyPlatform(platform) ;
			//级联删除
			showPlatformList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public List<Platform> getPlatformsList() {
		return platformsList;
	}

	public void setPlatformsList(List<Platform> platformsList) {
		this.platformsList = platformsList;
	}

	public Platform getOnePlatform() {
		return onePlatform;
	}

	public void setOnePlatform(Platform onePlatform) {
		this.onePlatform = onePlatform;
	}

	public Integer getPlatformId() {
		return platformId;
	}

	public void setPlatformId(Integer platformId) {
		this.platformId = platformId;
	}

	public String getPlatformName() {
		return platformName;
	}

	public void setPlatformName(String platformName) {
		this.platformName = platformName;
	}

	public String getPlatformRight() {
		return platformRight;
	}

	public void setPlatformRight(String platformRight) {
		this.platformRight = platformRight;
	}

	public Integer getExchangeRate() {
		return exchangeRate;
	}

	public void setExchangeRate(Integer exchangeRate) {
		this.exchangeRate = exchangeRate;
	}

	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	public List<Map<String, Object>> getPlatformsListCRight() {
		return platformsListCRight;
	}

	public void setPlatformsListCRight(List<Map<String, Object>> platformsListCRight) {
		this.platformsListCRight = platformsListCRight;
	}

	public String getRight() {
		return right;
	}

	public void setRight(String right) {
		this.right = right;
	}

	public Integer getRealRate() {
		return realRate;
	}

	public void setRealRate(Integer realRate) {
		this.realRate = realRate;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getDescribleOfRight() {
		return describleOfRight;
	}

	public void setDescribleOfRight(String describleOfRight) {
		this.describleOfRight = describleOfRight;
	}
	
}
