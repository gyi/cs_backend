package com.cs.backend.action;

import java.util.List;

import com.cs.backend.db.model.Platform;
import com.cs.backend.db.model.Role;
import com.cs.backend.db.model.User;
import com.cs.backend.service.PlatformService;
import com.cs.backend.service.RoleService;
import com.cs.backend.service.UserService;
import com.cs.backend.util.CodeUtil;
import com.cs.backend.util.ValidateUtil;

/**
 * 
 * 
 * @Description: TODO 用户控制类
 * @author GYI
 * @Ceatetime 2014年6月30日
 * 
 */
public class UserAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;

	/**
	 * 用户列表
	 */
	private List<User> usersList;

	/**
	 * 角色列表
	 */
	private List<Role> rolesList;

	/**
	 * 平台列表
	 */
	private List<Platform> platformsList;

	/**
	 * 一个用户
	 */
	private User oneUser;

	// 为了配合updateByPrimaryKeySelective而加的null
	/**
	 * 用户id
	 */
	private Integer userId;

	/**
	 * 用户名
	 */
	private String userName;

	/**
	 * 密码
	 */
	private String passWord;

	/**
	 * 旧密码
	 */
	private String oldPassWord;
	
	/**
	 * 重复密码
	 */
	private String confrimPwd;

	/**
	 * 平台
	 */
	private Integer thePlatformId;

	/**
	 * 角色
	 */
	private int roleId;
	
	private String result;

	/**
	 * 添加用户界面
	 */
	public String addUserShowPage() {
		try {
			rolesList = roleService.selectAllRole();
			platformsList = platformService.selectAllPlatform();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	private void init(){
		userId = null;
		userName = null;
		passWord = null;
		oldPassWord = null;
		confrimPwd = null;
		thePlatformId = 0;
		roleId = 0;
	}

	/**
	 * 添加用户
	 */
	public String userAdd() {
		try {
			User user = userService.createUser(null, userName.trim(), roleId, CodeUtil.Md5(passWord.trim()), thePlatformId, 0);
			if(userService.addUser(user)==1){
				result=getText("gccp.validate.success");
			}
			init();
			addUserShowPage();
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
	 * 添加用户验证
	 */
	public void validateUserAdd() {
		ValidateUtil validateUtil = readyForValidate();
		try {
			validateUtil.setMinLenAndMaxLen(0, 38);
			validateUtil.enter(userName, "userName", new String[]{"validateIsEmpty","validateNumAndLetter","validateLenghtIsInSide"});
			if(validateUtil.isNoproblem()){
				if (userService.selectUserByName(userName) != null) {
					this.addFieldError("userName", getText("gccp.validate.repetition"));
				}
			}
			
			if (roleService.selectByPrimaryKey(roleId)==null) {
				this.addFieldError("roleId", getText("gccp.validate.notlegal"));
			}
			
			if (platformService.selectByPrimaryKey(thePlatformId)==null) {
				this.addFieldError("platformId", getText("gccp.validate.notlegal"));
			}

			validateUtil.setMinLenAndMaxLen(6, 16);
			validateUtil.enter(passWord, "passWord", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			
			addUserShowPage();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return;
	}

	/**
	 * 按条件搜索用户列表
	 */
	public String searchUser() {
		try {
			User user = userService.createUser(null, userName.trim(), roleId==0? null: roleId, null, thePlatformId==0? null: thePlatformId, 0);
			usersList = userService.selectUserByXX(user);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 显示用户列表
	 */
	public String showUserList() {
		try {
			usersList = userService.selectAllUser();
			rolesList = roleService.selectAllRole();
			platformsList = platformService.selectAllPlatform();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 显示修改用户界面
	 */
	public String showUserByPrimaryKey() {
		try {
			oneUser = userService.selectByPrimaryKey(userId);
			rolesList = roleService.selectAllRole();
			platformsList = platformService.selectAllPlatform();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 修改用户信息
	 */
	public String userModify() {
		try {
			User user = userService.createUser(userId, userName.trim(), roleId, null, thePlatformId, 0);
			userService.modifyUser(user);
			showUserList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	/**
	 * 修改用户信息前验证
	 */
	public void validateUserModify() {
		ValidateUtil validateUtil = readyForValidate();
		try {
			validateUtil.setMinLenAndMaxLen(0, 38);
			validateUtil.enter(userName, "userName", new String[]{"validateIsEmpty","validateNumAndLetter","validateLenghtIsInSide"});
			if(validateUtil.isNoproblem()){
				if (userService.selectUserByName(userName) != null&&userService.selectUserByName(userName).getUserId()!=userId) {
					this.addFieldError("userName", getText("gccp.validate.repetition"));
				}
			}
			
			if (roleService.selectByPrimaryKey(roleId)==null) {
				this.addFieldError("roleId", getText("gccp.validate.notlegal"));
			} 
			
			if (platformService.selectByPrimaryKey(thePlatformId)==null) {
				this.addFieldError("platformId", getText("gccp.validate.notlegal"));
			} 
			showUserByPrimaryKey();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return;
	}
	
	/**
	 * 显示修改用户密码界面
	 * @return
	 */
	public String modifyPasswordShowPage(){
		try {
			oneUser = userService.selectByPrimaryKey(userId);
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	public String passwordModify(){
		try {
			User user = userService.createUser(userId, null, null, CodeUtil.Md5(passWord.trim()), null, 0);
			userService.modifyUser(user);
			showUserList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 修改用户信息前验证
	 */
	public void validatePasswordModify() {
		ValidateUtil validateUtil = readyForValidate();
		try {
			validateUtil.setMinLenAndMaxLen(6, 16);
			validateUtil.enter(passWord, "passWord", new String[]{"validateIsEmpty","validateLenghtIsInSide"});
			
			if(!confrimPwd.equals(passWord)){
				this.addFieldError("oldPassWord",
						getText("gccp.validate.checkuserpassnotequal"));
			}
			if (!userService.selectByPrimaryKey(userId).getPassWord()
					.equals(CodeUtil.Md5(oldPassWord))) {
				this.addFieldError("oldPassWord",
						getText("gccp.validate.checkuserpass"));
			}
			modifyPasswordShowPage();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

	/**
	 * 逻辑删除用户
	 */
	public String userByIdLogicDelete() {
		try {
			User user = userService.createUser(userId, null, null, null, null, 1);
			userService.modifyUser(user);
			showUserList();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public PlatformService getPlatformService() {
		return platformService;
	}

	public void setPlatformService(PlatformService platformService) {
		this.platformService = platformService;
	}

	public List<Role> getRolesList() {
		return rolesList;
	}

	public void setRolesList(List<Role> RolesList) {
		this.rolesList = RolesList;
	}

	public int getUserId() {
		return userId;
	}

	public User getOneUser() {
		return oneUser;
	}

	public void setOneUser(User oneUser) {
		this.oneUser = oneUser;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public List<User> getUsersList() {
		return usersList;
	}

	public void setUsersList(List<User> usersList) {
		this.usersList = usersList;
	}

	public List<Platform> getPlatformsList() {
		return platformsList;
	}

	public void setPlatformsList(List<Platform> platformsList) {
		this.platformsList = platformsList;
	}

	public Integer getThePlatformId() {
		return thePlatformId;
	}

	public void setThePlatformId(Integer thePlatformId) {
		this.thePlatformId = thePlatformId;
	}

	public String getOldPassWord() {
		return oldPassWord;
	}

	public void setOldPassWord(String oldPassWord) {
		this.oldPassWord = oldPassWord;
	}

	public String getConfrimPwd() {
		return confrimPwd;
	}

	public void setConfrimPwd(String confrimPwd) {
		this.confrimPwd = confrimPwd;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
