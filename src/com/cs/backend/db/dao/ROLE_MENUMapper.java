package com.cs.backend.db.dao;

import java.util.List;

import com.cs.backend.db.model.ROLE_MENUKey;

public interface ROLE_MENUMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_rolemenu
     *
     * @mbggenerated Tue Jun 24 13:36:57 CST 2014
     */
    int deleteByPrimaryKey(ROLE_MENUKey key);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_rolemenu
     *
     * @mbggenerated Tue Jun 24 13:36:57 CST 2014
     */
    int insert(ROLE_MENUKey record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table cs_rolemenu
     *
     * @mbggenerated Tue Jun 24 13:36:57 CST 2014
     */
    int insertSelective(ROLE_MENUKey record);
    
    /**
     * 通过菜单Id删除菜单角色分配
     *
     * @mbggenerated Tue Jun 24 13:36:57 CST 2014
     */
    int deleteByMenuId(int menuId);
    
    /**
     * 通过角色Id删除菜单角色分配
     *
     * @mbggenerated Tue Jun 24 13:36:57 CST 2014
     */
    int deleteByRoleId(int roleId);

    /**
     * 根据菜单查找菜单角色关系
     *
     * @mbggenerated Tue Jun 24 13:36:57 CST 2014
     */
	List<ROLE_MENUKey> selectROLE_MENUKeyByMenuid(int menuId);
	
	/**
     * 通过角色Id查找该角色所分配的菜单
     * @param roledId
     * @return
     */
    List<ROLE_MENUKey> selectROLE_MENUKeyByRoleid(int roledId) ;
    
    /**
     * 通过角色Id查找该角色所分配的菜单
     * @param roledId
     * @return
     */
    List<ROLE_MENUKey> selectROLE_MENUByXXPrecise(ROLE_MENUKey role_MENUKey) ;
    
}