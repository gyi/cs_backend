package com.cs.backend.service;

import java.util.List;

import com.cs.backend.db.model.User;

/**
 * 用户服务类接口
 * 
 * @Description: TODO 用户服务类接口
 * @author zhaowei
 * @Ceatetime 2014年6月23日
 * 
 */
public interface UserService {
	
	/** 
	 * 根据用户名查找用户
	 * @param userName
	 * @return
	 * @throws Exception
	 */
	public User selectUserByName(String userName) throws Exception;
	/** 
	 * 添加用户
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int addUser(User user) throws Exception;
	/** 
	 * 修改用户
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int modifyUser(User user) throws Exception;
	/** 
	 * 创建用户
	 * @param userName
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public User createUser(Integer userId, String userName, Integer roleId, String passWord,
			Integer thePlatformId, Integer isDelete) throws Exception;
	/** 
	 * 查询所有的用户
	 * @return
	 * @throws Exception
	 */
	public List<User> selectAllUser()throws Exception ;
	/** 
	 * 根据id查找用户
	 * @param roleId
	 * @return
	 */
	public User selectByPrimaryKey(int roleId) throws Exception ;
	/** 
	 * 根据角色id查找用户
	 * @param id
	 * @return
	 */
	public List<User> selectUserByRoleId(int id) throws Exception ;
	/** 
	 * 根据条件查找用户 模糊查询
	 * @param record
	 * @return
	 */
	public List<User> selectUserByXX(User record) throws Exception ;
	/** 
	 * 根据条件查找用户 精确查询
	 * @param record
	 * @return
	 */
	public List<User> selectUserByXXPrecise(User record) throws Exception ;
	

}
