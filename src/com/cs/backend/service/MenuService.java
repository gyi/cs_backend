package com.cs.backend.service;

import java.util.List;
import java.util.Map;

import com.cs.backend.db.model.Menu;

/**
 * @Description: TODO	菜单抽象服务类
 * @author zhaowei 
 * @Ceatetime 2014年6月24日
 *
 */
public interface MenuService {
	/**
	 * 查询所有的菜单
	 * @return
	 * @throws Exception
	 */
	public List<Menu> selectAllMenu()throws Exception ;
	/**
	 * 根据roleId找到对应所有菜单
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectMenusByRoleidMap(int roleId) throws Exception ; 
	/**
	 * 根据roleId找到对应所有菜单
	 * @param roleId
	 * @return
	 * @throws Exception
	 */
	public List<Menu> selectMenusByRoleid(int roleId) throws Exception ; 
	/**
	 * 根据菜单id找到菜单
	 * @param menuId
	 * @return
	 * @throws Exception
	 */
	public Menu selectMenuByMenuid(int menuId) throws Exception ;
	/**
	 * 查询文件夹目录
	 * @return
	 * @throws Exception
	 */
	public List<Menu> selectDirMenu() throws Exception ;
	/**
	 * 添加目录
	 * @param menu
	 * @return
	 * @throws Exception
	 */
	public int addMenu(Menu menu) throws Exception ;
	/**
	 * 创建目录
	 * @param desc
	 * @param menuName
	 * @param inputUrl
	 * @param direction
	 * @return
	 * @throws Exception
	 */
	public Menu createMenu(Integer menuId, String menuName, String url, String describle, Integer direction, Integer isDelete) throws Exception ;
	/**
	 * 分页
	 * @return
	 */
	public List<Menu> queryByPage();
	/**
	 * 修改目录信息
	 * @param menu
	 * @return
	 */
	public int modifyMenu(Menu menu);
	/**
	 * 根据父级菜单Id找到对应所有菜单
	 * @param type
	 * @return
	 */
	public List<Menu> selectMenuByType(int type);
	/**
	 * 根据条件查找菜单 模糊查询
	 * @param record
	 * @return
	 */
	public List<Menu> selectMenuByXX(Menu record);
	/**
	 * 根据条件查找菜单 精确查询
	 * @param record
	 * @return
	 */
	public List<Menu> selectMenuByXXPrecise(Menu record);
	/**
	 * 根据目录名查找目录
	 * @param record
	 * @return
	 */
	public Menu selectMenuByName(String menuName) throws Exception;
	
	/**
	 * 根据角色id和菜单id找到指定角色指定菜单id下拥有的菜单项(isContainMenuId是否包含)
	 * @throws Exception 
	 */
	public List<Menu> selectMenusByRoleIdAndMenuId(int roleId, int menuId, boolean isContainMenuId) throws Exception ;
	
	/**
	 * 查询当前菜单的第一节子菜单,不包含孙菜单
	 */
	public List<Menu> selectMenusByRoleIdAndMenuIdWithoutGrandChild(int roleId, int menuId)throws Exception  ;
	
	/**
	 * 读取默认的图标
	 * @return
	 */
	public List<Map<String, String>> readDefaultIcon();
	
	/**
	 * 目录与父目录关联
	 */
	public List<Map<String, Object>> menuRelatedFather(List<Menu> menusList);
	
	/**
	 * 根据父菜单id级联查找子菜单并将子菜单的父亲设为空
	 * 
	 * @return
	 */
	public void cascadeMenuForType(int type);
	
	/**
	 * 根据菜单id级联查找分配到的角色并将角色所分配的菜单设为空
	 * 
	 * @return
	 */
	public void cascadeRoleMenuForMenu(int menuId);
}
