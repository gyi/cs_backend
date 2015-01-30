package com.cs.backend.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.cs.backend.db.model.Role;
import com.cs.backend.db.model.User;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * 
 * @Description: TODO 角色用户控制类
 * @author GYI
 * @Ceatetime 2014年6月30日
 * 
 */
public class RoleUserAction extends ActionSupport {

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
	 * 用户id
	 */
	private Integer userId;
	
	/**
	 * 用户列表
	 */
	private List<User> usersList;
	
	/**
	 * JSON用户列表
	 */
	private String users;
	
	/**
	 * 用户角色关系列表
	 */
	private List<Object> usersToRoleList;

	@Resource
	private RoleService roleService;
	@Resource
	private UserService userService;
	
	/**
	 * 显示角色用户界面
	 */
	public String userRoleShowPage() {
		try {
			rolesList = roleService.selectAllRole();			
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 通过角色查询用户列表
	 * @return
	 */
	public String showUserListByRole() {
		try {
			usersList = userService.selectAllUser();
			User user = new User();
			user.setRoleId(roleId);
			
			
			usersToRoleList = new ArrayList<Object>(usersList.size());
			Iterator<User> itUsers = usersList.iterator();
			for(int i = 0; itUsers.hasNext(); i++){
				User itUser = itUsers.next();
				Map<String, Object> isUsersToRoleMap = new HashMap<String, Object>();
				isUsersToRoleMap.put("isAllot", pickUserToRole(user, itUser));
				
				isUsersToRoleMap.put("usersList",usersList.get(i));
				usersToRoleList.add(i, isUsersToRoleMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	private int pickUserToRole(User user, User itUser) throws Exception {
		List<User> UsersByRoleList = userService.selectUserByXXPrecise(user);
		Iterator<User> itUserRoles = UsersByRoleList.iterator();
		while(itUserRoles.hasNext()){
			User userRole = itUserRoles.next();
			if(itUser.getUserId()==userRole.getUserId()) {
				return 1;
			}
		}
		return 0;
	}
	
	/**
	 * 将用户分配给角色
	 */
	public String userRoleAdd() {
		try {
			User user = new User();
			user.setUserId(userId);
			user.setRoleId(roleId);
			userService.modifyUser(user);
			showUserListByRole();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 取消用户的角色分配
	 */
	public String userRoleDelete() {
		try {
			User user = new User();
			user.setUserId(userId);
			user.setRoleId(0);
			userService.modifyUser(user);
			showUserListByRole();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public List<User> getUsersList() {
		return usersList;
	}

	public void setUsersList(List<User> usersList) {
		this.usersList = usersList;
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public List<Object> getUsersToRoleList() {
		return usersToRoleList;
	}

	public void setUsersToRoleList(List<Object> usersToRoleList) {
		this.usersToRoleList = usersToRoleList;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}
	
	

}
