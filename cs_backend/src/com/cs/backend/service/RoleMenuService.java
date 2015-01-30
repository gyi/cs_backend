package com.cs.backend.service;

import java.util.List;

import com.cs.backend.db.model.ROLE_MENUKey;

/**
 * 
*
* @Description: TODO	菜单抽象服务类
* @author zhaowei 
* @Ceatetime 2014年6月24日
*
 */
public interface RoleMenuService {
    /**
     * 根据菜单查找菜单角色关系
     * @param menuId
     * @return
     */
	public List<ROLE_MENUKey> selectROLE_MENUKeyByMenuid(int menuId);
	/**
	 * 根据角色查找菜单角色关系
	 * @param roleId
	 * @return
	 */
	public List<ROLE_MENUKey> selectROLE_MENUKeyByRoleid(int roleId);
	/**
	 * 通过条件精确查询菜单角色分配
	 * @param role_MENUKey
	 * @return
	 */
    public List<ROLE_MENUKey> selectROLE_MENUByXXPrecise(ROLE_MENUKey role_MENUKey);
	/**
	 * 删除角色菜单关系
	 * @param roleMENUKey
	 * @return
	 */
	public int deleteByPrimaryKey(ROLE_MENUKey roleMENUKey);
	/**
	 * 添加角色菜单关系
	 * @param roleMENUKey
	 * @return
	 */
	public int addRoleMenu(ROLE_MENUKey roleMENUKey);
	/**
	 * 通过角色Id删除菜单角色分配
	 * @param roleId
	 * @return
	 */
    int deleteByRoleId(int roleId);
    /**
     * 通过菜单Id删除菜单角色分配
     * @param menuId
     * @return
     */
    int deleteByMenuId(int menuId);
    
    /**
	 * 将菜单分配给角色
	 */
	public void menuRoleAdd(int menuId, int roleId)  throws Exception;
	
	/**
	 * 取消菜单与角色的关系
	 * @param menuId
	 * @param roleId
	 */
	public void menuRoleDelete(int menuId, int roleId) throws Exception;

}
