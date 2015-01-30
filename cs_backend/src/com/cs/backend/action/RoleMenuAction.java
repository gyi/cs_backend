package com.cs.backend.action;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.Role;
import com.cs.backend.service.MenuService;
import com.cs.backend.service.RoleMenuService;
import com.cs.backend.service.RoleService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 
 * @Description: TODO 角色目录控制类
 * @author GYI
 * @Ceatetime 2014年6月30日
 * 
 */
public class RoleMenuAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * 角色列表
	 */
	private List<Role> rolesList ;
	
	/**
	 * 一个角色
	 */
	private Role oneRole ;
	
	/**
	 * 角色id
	 */
	private Integer roleId;
	
	/**
	 * 菜单id
	 */
	private Integer menuId;
	
	/**
	 * JSON菜单列表
	 */
	private String menusString;
	
	/**
	 * JSON菜单列表
	 */
	private String menusByRoleString;

	@Resource
	private RoleService roleService;
	@Resource
	private MenuService menuService;
	@Resource
	private RoleMenuService roleMenuService;
	
	/**
	 * 显示角色菜单界面
	 */
	public String menuRoleShowPage() {
		try {
			rolesList = roleService.selectAllRole();
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 根据角色查询所分配的菜单
	 */
	@SuppressWarnings({ "unchecked" })
	public String showMenuListByRole() {
		if(roleId==0){
			return SUCCESS;
		}
		try {
			//所有目录
			List<Menu> menusList = menuService.selectAllMenu();
			//与用户有关系的目录
			List<Menu> menusByRoleList = menuService.selectMenusByRoleid(roleId) ;
			
			//变为普通的集合
			List<Map<String, Object>> menusListMap =  (List<Map<String, Object>>) JSON.parse(JSON.toJSONString(menusList, SerializerFeature.WriteMapNullValue));
			List<Map<String, Object>> menusByRoleListMap =  (List<Map<String, Object>>) JSON.parse(JSON.toJSONString(menusByRoleList, SerializerFeature.WriteMapNullValue));
			
			Iterator<Menu> itMenus = menusList.iterator();
			for(int i = 0; itMenus.hasNext(); i++){
				Menu menu = itMenus.next();
				menusListMap.get(i).put("isAllot", false);
				if(i < menusByRoleListMap.size()){
					menusByRoleListMap.get(i).put("isAllot", true);
				}
				Iterator<Menu> itMenusByRoleList = menusByRoleList.iterator();
				while(itMenusByRoleList.hasNext()){
					Menu menusByRoleMap = itMenusByRoleList.next();
					if(menu.getId()==menusByRoleMap.getId()) {
						menusListMap.get(i).put("isAllot", true);
					}
				}
			}
			menusString = JSON.toJSONString(menusListMap, SerializerFeature.WriteMapNullValue);
			menusByRoleString = JSON.toJSONString(menusByRoleListMap, SerializerFeature.WriteMapNullValue);

		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 将菜单分配给角色
	 */
	public String menuRoleAdd() {
		try {
			roleMenuService.menuRoleAdd(menuId, roleId);
			showMenuListByRole();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 取消菜单与角色的关系
	 */
	public String menuRoleDelete() {
		try {
			roleMenuService.menuRoleDelete(menuId, roleId);
			showMenuListByRole();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	public Role getOneRole() {
		return oneRole;
	}

	public void setOneRole(Role oneRole) {
		this.oneRole = oneRole;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<Role> getRolesList() {
		return rolesList;
	}

	public void setRolesList(List<Role> rolesList) {
		this.rolesList = rolesList;
	}

	public String getMenusString() {
		return menusString;
	}

	public void setMenusString(String menusString) {
		this.menusString = menusString;
	}

	public String getMenusByRoleString() {
		return menusByRoleString;
	}

	public void setMenusByRoleString(String menusByRoleString) {
		this.menusByRoleString = menusByRoleString;
	}

}
