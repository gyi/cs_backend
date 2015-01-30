package com.cs.backend.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.Role;
import com.cs.backend.db.model.User;
import com.cs.backend.service.MenuService;
import com.cs.backend.service.RoleMenuService;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;
import com.cs.backend.util.DateUtil;
import com.cs.backend.util.ValidateUtil;

/**
 * 
 * @Description: TODO 角色控制类
 * @author GYI
 * @Ceatetime 2014年6月30日
 * 
 */
public class RoleAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	List<Map<String, Object>> rolesListAddTime;
	
	/**
	 * 角色列表
	 */
	private List<Role> rolesList;
	
	/**
	 * 一个角色
	 */
	private Role oneRole;
	
	/**
	 * 角色id
	 */
	private Integer roleId ;
	
	/**
	 * 菜单列表
	 */
	private List<Menu> menusList;

	/**
	 * 角色名
	 */
	private String roleName;

	/**
	 * 描述
	 */
	private String describle ;

	/**
	 * 创建时间
	 */
	private Long createTime;
	
	private String result;

	@Resource
	private RoleService roleService;
	@Resource
	private MenuService menuService;
	@Resource
	private UserService userService;
	@Resource
	private RoleMenuService roleMENUService;

	/**
	 * 显示添加角色界面
	 */
	public String addRoleShowPage() {
		return SUCCESS;
	}
	
	private void init(){
		roleId =null ;
		roleName = null;
		describle = null ;
		createTime = null;
	}

	/**
	 * 添加角色
	 */
	public String roleAdd() {
		try {
			createTime = DateUtil.convertString2long(DateUtil.getNowTime("yyyy-MM-dd"), 0) ;
			Role role = roleService.createRole(null, roleName, describle, createTime, 0);
			if(roleService.addRole(role)==1){
				result = getText("gccp.validate.success");
			}
			init();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public ValidateUtil readyForValidate() {
		result=getText("gccp.validate.fail");
		return super.readyForValidate();
	}
	
	/**
	 * 角色验证
	 */
	public void validateRole() {
		ValidateUtil validateUtil = readyForValidate();
		try {
			validateUtil.setMinLenAndMaxLen(0, 38);
			validateUtil.enter(roleName, "roleName", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			if(validateUtil.isNoproblem()){
				if (roleService.selectRoleByName(roleName) != null&&roleService.selectRoleByName(roleName).getId()!=roleId) {
					this.addFieldError("roleName", getText("gccp.validate.repetition"));
				}
			}
			
			validateUtil.setMinLenAndMaxLen(0, 140);
			validateUtil.enter(describle, "describle", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}
	
	/**
	 * 添加角色验证
	 */
	public void validateRoleAdd() {
		validateRole();
	}
	
	/**
	 * 按条件搜索角色列表
	 */
	public String searchRole() {
		try {
			Role role = roleService.createRole(null, roleName, describle, null, 0);
			rolesList = roleService.selectRoleByXX(role) ;
			roleRelatedTime();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 显示角色列表
	 */
	public String showRoleList() {
		try {
			rolesList = roleService.selectAllRole();
			roleRelatedTime();
			
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 将角色信息与时间相对应
	 */
	private void roleRelatedTime() {
		rolesListAddTime = new ArrayList<Map<String,Object>>(); 
		
		for(Role role: rolesList){
			Map<String, Object> rolesMap = new HashMap<String, Object>(); 
			String dataString = DateUtil.convertLong2StringHor(role.getCreateTime());
			rolesMap.put("createTime", dataString) ;
			rolesMap.put("role", role);
			rolesListAddTime.add(rolesMap);
		}
	}
	
	/**
	 * 显示修改角色界面
	 */
	public String showRoleByPrimaryKey() {
		try {
			oneRole = roleService.selectByPrimaryKey(roleId);
			//menusList = menuService.selectAllMenu();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改角色信息
	 */
	public String roleModify() {
		try {
			Role role = roleService.createRole(roleId, roleName, describle, DateUtil.convertString2long(DateUtil.getNowTime("yyyy-MM-dd"), 0), 0);
			roleService.modifyRole(role) ;
			showRoleList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改角色验证
	 */
	public void validateRoleModify() {
		validateRole();
		showRoleByPrimaryKey();
	}
	
	/**
	 * 逻辑删除角色
	 */
	public String roleByIdLogicDelete() {
		try {
			Role role = roleService.createRole(roleId, null, null, null, 1);
			roleService.modifyRole(role) ;
			cascadeRoleToUser();
			roleMENUService.deleteByRoleId(roleId);
			showRoleList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 根据父菜单id级联查找子菜单并将子菜单的父亲设为空
	 * @return
	 * @throws Exception 
	 */
	private void cascadeRoleToUser() throws Exception {
		
		List<User> userList = userService.selectUserByRoleId(roleId);
		Iterator<User> it = userList.iterator();
		try {
			while(it.hasNext()){
			   User user = it.next();
			   user.setRoleId(0);
			   userService.modifyUser(user) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public List<Menu> getMenusList() {
		return menusList;
	}

	public void setMenusList(List<Menu> menusList) {
		this.menusList = menusList;
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

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
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

	public List<Map<String, Object>> getRolesListAddTime() {
		return rolesListAddTime;
	}

	public void setRolesListAddTime(List<Map<String, Object>> rolesListAddTime) {
		this.rolesListAddTime = rolesListAddTime;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}

}
