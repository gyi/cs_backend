package com.cs.backend.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.ROLE_MENUMapper;
import com.cs.backend.db.dao.RoleMapper;
import com.cs.backend.db.model.Role;
import com.cs.backend.service.RoleService;

/**
 *
*
* @Description: TODO 角色服务类
* @author zhaowei 
* @Ceatetime 2014年6月24日
*
 */

@Component
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleMapper roleMapper ;
	@Resource
	private ROLE_MENUMapper roleMENUMapper ;
	
	/**
	 * 根据角色id找到角色
	 */
	public Role selectByPrimaryKey(Integer id) throws Exception {
		Role role = roleMapper.selectByPrimaryKey(id) ;
		return role;
	}

	public List<Role> selectAllRole() throws Exception {
		return roleMapper.selectAllRole();
	}

	public int addRole(Role role) throws Exception {
		int state = roleMapper.insert(role) ;
		return state;
	}
	
	public Role createRole(Integer roleId, String roleName, String direction, Long createTime, Integer isDelete) throws Exception {
		Role role = new Role() ;
		role.setId(roleId);
		role.setRoleName(roleName);
		role.setDescrible(direction);
		role.setCreateTime(createTime);
		role.setIsDeleted(isDelete);
		return role;
	}

	public int modifyRole(Role role) throws Exception {
		int state = roleMapper.updateByPrimaryKeySelective(role) ;
		return state;
	}

	public List<Role> selectRoleByXX(Role record) throws Exception {
		return roleMapper.selectRoleByXX(record);
	}

	public List<Role> selectRoleByXXPrecise(Role record) throws Exception {
		return roleMapper.selectRoleByXXPrecise(record);
	}

	public Role selectRoleByName(String roleName) throws Exception {
		return roleMapper.selectRoleByName(roleName);
	}

}
