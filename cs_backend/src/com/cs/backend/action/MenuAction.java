package com.cs.backend.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cs.backend.db.model.Menu;
import com.cs.backend.service.MenuService;
import com.cs.backend.service.RoleMenuService;
import com.cs.backend.util.PutNullInMapSwitchNullString;
import com.cs.backend.util.ValidateUtil;

/**
 * 
 * 
 * @Description: TODO 菜单控制类
 * @author zhaowei
 * @Ceatetime 2014年6月25日
 * 
 */
public class MenuAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private List<Map<String, Object>> menusListCDir;

	/**
	 * 图标
	 */
	private List<Map<String, String>> icons;

	/**
	 * 文件夹
	 */
	private List<Menu> dirMenusList;

	/**
	 * 菜单列表
	 */
	private List<Menu> menusList ;

	/**
	 * 一个菜单
	 */
	private Map<String, Object> oneMenu;

	/**
	 * 菜单id
	 */
	private int Id;

	/**
	 * 目录名
	 */
	private String menuName ;

	/**
	 * 上级目录
	 */
	private Integer direction;

	/**
	 * 路径
	 */
	private String url;

	/**
	 * 描述
	 */
	private String describle;

	/**
	 * 图标地址
	 */
	private String fileFileName ;

	private String result ;

	@Resource
	private MenuService menuService;
	@Resource
	private RoleMenuService roleMenuService;

	/**
	 * 添加目录界面
	 */
	public String addMenu() {
		try {
			dirMenusList = menuService.selectDirMenu();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String modifyMenuIconShowPage() {
		oneMenu = new HashMap<String, Object>();
		try {
			icons = menuService.readDefaultIcon();
			oneMenu.put("icon", "../static/ztree/css/zTreeStyle/img/diy/2.png");
			if(Id==0){
				return SUCCESS;
			}
			Menu menu = menuService.selectMenuByMenuid(Id);
			if (menu != null) {
				oneMenu = (Map<String, Object>) JSON.parse(JSON
						.toJSONString(menu, SerializerFeature.WriteMapNullValue));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String menuIconAdd() {
		result = "fail";
		if (StringUtils.isEmpty(fileFileName)) {
			return SUCCESS;
		}
		try {
			Menu menu = menuService.selectMenuByName(menuName);
			menu.setIcon(fileFileName);
			if(menuService.modifyMenu(menu)==1){
				result = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 添加目录
	 */
	public String menuAdd() {
		try {
			Menu menu = menuService.createMenu(null, menuName, url, describle, direction, 0);
			if (menuService.addMenu(menu) == 1) {
				result = getText("gccp.validate.success");
				menuIconAdd();
				
				roleMenuService.menuRoleAdd(
						menuService.selectMenuByName(menuName).getId(), 1);
			}
			addMenu();
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
	 * 目录验证
	 */
	private void validateMenu() {
		ValidateUtil validateUtil = readyForValidate();
		try {
			
			validateUtil.setMinLenAndMaxLen(0, 38);
			validateUtil.enter(menuName, "menuName", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			if(validateUtil.isNoproblem()){
				if (menuService.selectMenuByName(menuName) != null && menuService.selectMenuByName(menuName).getId() != Id) {
					this.addFieldError("menuName", getText("gccp.validate.repetition"));
				}
			}

			if (menuService.selectMenuByMenuid(direction) == null) {
				this.addFieldError("direction", getText("gccp.validate.notlegal"));
			}

			validateUtil.setMinLenAndMaxLen(0, 38);
			validateUtil.enter(url, "url", new String[]{"validateLenghtIsInSide"});
			
			validateUtil.setMinLenAndMaxLen(0, 140);
			validateUtil.enter(describle, "describle", new String[]{"validateLenghtIsInSide"});

		} catch (Exception e) {
			e.printStackTrace();
		}

		return;
	}

	/**
	 * 添加目录验证
	 */
	public void validateMenuAdd() {
		validateMenu();
		addMenu();
	}

	/**
	 * 按条件搜索菜单列表
	 */
	public String searchMenu() {
		try {
			Menu menu = menuService.createMenu(null, menuName, url, describle, direction, 0);
			menusList = menuService.selectMenuByXX(menu);
			menusListCDir = menuService.menuRelatedFather(menusList);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 显示目录列表
	 */
	public String showMenuList() {
		try {
			menusList = menuService.selectAllMenu();
			dirMenusList = menuService.selectDirMenu();
			menusListCDir = menuService.menuRelatedFather(menusList);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 显示修改目录界面
	 */
	@SuppressWarnings("unchecked")
	public String showMenuByPrimaryKey() {
		try {
			Menu menu = menuService.selectMenuByMenuid(Id);
			oneMenu = JSON.parseObject(JSON.toJSONString(menu, SerializerFeature.WriteMapNullValue), Map.class);
			oneMenu = PutNullInMapSwitchNullString.toSwitch(oneMenu);
			if (!StringUtils.isEmpty(menu.getIcon())) {
				String[] menus = menu.getIcon().split("/");
				oneMenu.put("fileFileName", menus[menus.length - 1]);
			} else {
				oneMenu.put("icon",
						"../static/ztree/css/zTreeStyle/img/diy/2.png");
				oneMenu.put("fileFileName", "");
			}

			dirMenusList = menuService.selectDirMenu();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 修改用户信息
	 */
	public String menuModify() {
		try {
			Menu menu = menuService.createMenu(Id, menuName, url, describle, direction, 0);
			if (menuService.modifyMenu(menu) == 1) {
				//menuIconAdd();
			}
			showMenuList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 修改目录验证
	 */
	public void validateMenuModify() {
		validateMenu();
		showMenuByPrimaryKey();
	}

	/**
	 * 逻辑删除菜单
	 */
	public String menuByIdLogicDelete() {
		try {
			Menu menu = menuService.createMenu(Id, null, null, null, null, 1);
			menuService.modifyMenu(menu);
			menuService.cascadeMenuForType(Id);
			showMenuList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public List<Menu> getDirMenusList() {
		return dirMenusList;
	}

	public void setDirMenusList(List<Menu> dirMenusList) {
		this.dirMenusList = dirMenusList;
	}

	public List<Menu> getMenusList() {
		return menusList;
	}

	public void setMenusList(List<Menu> menusList) {
		this.menusList = menusList;
	}

	public Map<String, Object> getOneMenu() {
		return oneMenu;
	}

	public void setOneMenu(Map<String, Object> oneMenu) {
		this.oneMenu = oneMenu;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Integer getDirection() {
		return direction;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	public List<Map<String, Object>> getMenusListCDir() {
		return menusListCDir;
	}

	public void setMenusListCDir(List<Map<String, Object>> menusListCDir) {
		this.menusListCDir = menusListCDir;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setDirection(Integer direction) {
		this.direction = direction;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<Map<String, String>> getIcons() {
		return icons;
	}

	public void setIcons(List<Map<String, String>> icons) {
		this.icons = icons;
	}

}
