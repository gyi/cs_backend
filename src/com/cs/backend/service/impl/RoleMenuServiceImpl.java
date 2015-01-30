package com.cs.backend.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.MenuMapper;
import com.cs.backend.db.dao.ROLE_MENUMapper;
import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.ROLE_MENUKey;
import com.cs.backend.service.RoleMenuService;

/**
 * 
* @Description: TODO 菜单服务类
* @author zhaowei 
* @Ceatetime 2014年6月24日
*
 */
@Component
public class RoleMenuServiceImpl implements RoleMenuService {
	
	@Resource
	private MenuMapper menuMapper ;
	
	@Resource
	private ROLE_MENUMapper roleMENUMapper ;

	public List<ROLE_MENUKey> selectROLE_MENUKeyByMenuid(int menuId) {
		return roleMENUMapper.selectROLE_MENUKeyByMenuid(menuId);
	}

	public int deleteByPrimaryKey(ROLE_MENUKey roleMENUKey) {
		int state = roleMENUMapper.deleteByPrimaryKey(roleMENUKey);
		return state;
	}

	public int addRoleMenu(ROLE_MENUKey roleMENUKey) {
		int state = roleMENUMapper.insert(roleMENUKey) ;
		return state;
	}
	
	/**
     * 通过菜单Id删除菜单角色分配
     *
     */
	public int deleteByMenuId(int menuId){
		int state = roleMENUMapper.deleteByMenuId(menuId);
		return state;
	}
	
	public int deleteByRoleId(int roleId) {
		int state = roleMENUMapper.deleteByRoleId(roleId);
		return state;
	}

	public List<ROLE_MENUKey> selectROLE_MENUKeyByRoleid(int roleId) {
		return roleMENUMapper.selectROLE_MENUKeyByRoleid(roleId);
	}

	public List<ROLE_MENUKey> selectROLE_MENUByXXPrecise(
			ROLE_MENUKey role_MENUKey) {
		return roleMENUMapper.selectROLE_MENUByXXPrecise(role_MENUKey);
	}
	
	/**
	 * 将菜单分配给角色
	 */
	public void menuRoleAdd(int menuId, int roleId) throws Exception {
		ROLE_MENUKey roleMENUKey = new ROLE_MENUKey();
		roleMENUKey.setMenuId(menuId);
		roleMENUKey.setRoleId(roleId);
		if(selectROLE_MENUByXXPrecise(roleMENUKey).size()!=0){
			return ;
		}
		addRoleMenu(roleMENUKey);
		Menu MenuChild = menuMapper.selectByPrimaryKey(menuId);
		while(MenuChild.getType()==MenuChild.getId()){
			return ;
		}
		menuRoleAdd(MenuChild.getType(), roleId);
		return ;
		
	}
	
	/**
	 * 取消菜单与角色的关系
	 * @param menuId
	 * @param roleId
	 * @throws Exception
	 */
	public void menuRoleDelete(int menuId, int roleId) throws Exception {
		ROLE_MENUKey roleMENUKey = new ROLE_MENUKey();
		roleMENUKey.setMenuId(menuId);
		roleMENUKey.setRoleId(roleId);
		if(selectROLE_MENUByXXPrecise(roleMENUKey).size()==0){
			return ;
		}
		deleteByPrimaryKey(roleMENUKey);
		List<Menu> menuChild = menuMapper.selectMenuByType(menuId);
		for(Menu menu: menuChild){
			menuRoleDelete(menu.getId(), roleId);
		}
		return ;
		
	}

}
