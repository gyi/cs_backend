package com.cs.backend.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.UserMapper;
import com.cs.backend.db.model.User;
import com.cs.backend.service.UserService;

/**
 * 
*
* @Description: TODO 用户服务类
* @author zhaowei 
* @Ceatetime 2014年6月23日
*
 */
@Component
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper ; 
	
	/**
	 * 根据用户名找到用户信息
	 */
	public User selectUserByName(String userName) throws Exception {
		return userMapper.selectUserByName(userName);
	}

	public int addUser(User user) throws Exception {
		int state = userMapper.insert(user) ;
		return state;
	}

	public User createUser(Integer userId, String userName, Integer roleId, String passWord,
			Integer thePlatformId, Integer isDelete) throws Exception {
		User user = new User();
		user.setUserId(userId);
		user.setUserName(userName);
		user.setRoleId(roleId);
		user.setPassWord(passWord);
		user.setPlatformId(thePlatformId);
		user.setIsDeleted(isDelete);
		user.setModel("1");//默认状态为普通页面
		return user;
	}

	public List<User> selectAllUser() throws Exception {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser();
	}

	public User selectByPrimaryKey(int roleId) throws Exception {
		return userMapper.selectByPrimaryKey(roleId);
	}

	public int modifyUser(User user) throws Exception {
		int state = userMapper.updateByPrimaryKeySelective(user) ;
		return state;
	}

	public List<User> selectUserByRoleId(int roleId) throws Exception {
		return userMapper.selectUserByRoleId(roleId);
	}

	public List<User> selectUserByXX(User record) throws Exception {
		return userMapper.selectUserByXX(record);
	}

	public List<User> selectUserByXXPrecise(User record) throws Exception {
		return userMapper.selectUserByXXPrecise(record);
	}

}
