package com.cs.backend.db.dao;

import java.util.List;

import com.cs.backend.db.model.Role;

public interface RoleMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table cs_role
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table cs_role
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	int insert(Role record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table cs_role
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	int insertSelective(Role record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table cs_role
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	Role selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table cs_role
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	int updateByPrimaryKeySelective(Role record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table cs_role
	 * @mbggenerated  Tue Jun 24 12:10:24 CST 2014
	 */
	int updateByPrimaryKey(Role record);
	
	//查询所有用户
	List<Role> selectAllRole();

	/**
	 * 按条件所有角色 模糊查询
	 * @param record
	 * @return
	 */
	List<Role> selectRoleByXX(Role record);

	/**
	 * 按条件所有角色
	 * @param record
	 * @return
	 */
	List<Role> selectRoleByXXPrecise(Role record);

	/**
	 * 按角色名查找角色
	 * @param record
	 * @return
	 */
	Role selectRoleByName(String roleName);
}