package com.cs.backend.service;

import java.util.List;

import com.cs.backend.db.model.Role;

/**
 * 
*
* @Description: TODO	角色服务抽象类
* @author zhaowei 
* @Ceatetime 2014年6月24日
*
 */
public interface RoleService {
	/**
	 * 按id查询角色
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Role selectByPrimaryKey(Integer id) throws Exception ;
	/**
	 * 查询所有的角色
	 * @return
	 * @throws Exception
	 */
	public List<Role> selectAllRole()throws Exception ;
	/**
	 * 新建角色
	 * @param roleName
	 * @param direction
	 * @param createTime
	 * @return
	 */
	public Role createRole(Integer roleId, String roleName, String direction, Long createTime, Integer isDelete) throws Exception ;
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public int addRole(Role role) throws Exception ;
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	public int modifyRole(Role role) throws Exception ;
	/**
	 * 按条件查找角色 模糊查询
	 * @param record
	 * @return
	 */
	public List<Role> selectRoleByXX(Role record) throws Exception ;
	/**
	 * 按条件查找角色 精确查询
	 * @param record
	 * @return
	 */
	public List<Role> selectRoleByXXPrecise(Role record) throws Exception ;
	/**
	 * 按角色名
	 * @param record
	 * @return
	 */
	public Role selectRoleByName(String roleName) throws Exception ;
}
