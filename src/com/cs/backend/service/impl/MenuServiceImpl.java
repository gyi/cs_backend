package com.cs.backend.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cs.backend.db.dao.MenuMapper;
import com.cs.backend.db.dao.ROLE_MENUMapper;
import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.ROLE_MENUKey;
import com.cs.backend.service.MenuService;
import com.cs.backend.util.UploadUtil;

/**
 * 
* @Description: TODO 菜单服务类
* @author zhaowei 
* @Ceatetime 2014年6月24日
*
 */
@Component
public class MenuServiceImpl implements MenuService {
	
	@Resource
	private MenuMapper menuMapper ;
	
	@Resource
	private ROLE_MENUMapper roleMENUMapper ;

	/**
	 * 查询所有的菜单
	 */
	public List<Menu> selectAllMenu() throws Exception {
		return menuMapper.selectAllMenu();
	}
	
	/**
	 * 根据roleid找到对应所有菜单
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMenusByRoleidMap(int roleId) throws Exception {
		List<ROLE_MENUKey> menuKeys = roleMENUMapper.selectROLE_MENUKeyByRoleid(roleId) ;
		Map<Integer, Menu> mapMenu = getMenuByMenuid() ;
		List<Map<String, Object>> menus = new ArrayList<Map<String, Object>>() ;
		for(ROLE_MENUKey menuKey : menuKeys) {
			int menudId = menuKey.getMenuId() ;
			Menu menu = mapMenu.get(menudId) ;
			if(menu!=null) {
				menus.add((Map<String, Object>) menu) ;
			}
		}
		return menus;
	}
	
	/**
	 * 根据roleid找到对应所有菜单
	 */
	public List<Menu> selectMenusByRoleid(int roleId) throws Exception {
		List<ROLE_MENUKey> menuKeys = roleMENUMapper.selectROLE_MENUKeyByRoleid(roleId) ;
		Map<Integer, Menu> mapMenu = getMenuByMenuid() ;
		List<Menu> menus = new ArrayList<Menu>() ;
		for(ROLE_MENUKey menuKey : menuKeys) {
			int menudId = menuKey.getMenuId() ;
			Menu menu = mapMenu.get(menudId) ;
			if(menu!=null) {
				menus.add( menu) ;
			}
		}
		return menus;
	}
	
	/**
	 * 获得所有menu的key-value形式
	 */
	private Map<Integer, Menu> getMenuByMenuid() {
		Map<Integer, Menu> mapMenu = new HashMap<Integer, Menu>() ;
		try {
			List<Menu> menus = selectAllMenu() ;
			for(Menu menu : menus) {
				mapMenu.put(menu.getId(), menu) ;
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return mapMenu;
	}
	
	/**
	 * 根据菜单id查询对应菜单信息
	 */
	public Menu selectMenuByMenuid(int menuId) throws Exception {
		return menuMapper.selectByPrimaryKey(menuId);
	}
	
	/**
	 * 查询文件夹
	 */
	public List<Menu> selectDirMenu() throws Exception {
		return menuMapper.selectDirMenu();
	}
	
	/**
	 * 添加目录
	 */
	public int addMenu(Menu menu) throws Exception {
		int state = menuMapper.insert(menu) ;
		return state;
	}

	public Menu createMenu(Integer menuId, String menuName, String url, String describle, Integer direction, Integer isDelete) throws Exception {
		Menu menu = new Menu() ;
		menu.setId(menuId);
		menu.setMenuName(menuName);
		menu.setDescrible(describle);
		menu.setMenuUrl(url);
		menu.setType(direction);
		menu.setIsDeleted(isDelete);
		return menu;
	}

	public List<Menu> queryByPage() {
		return menuMapper.queryByPage();
	}

	public int modifyMenu(Menu menu) {
		int state = menuMapper.updateByPrimaryKeySelective(menu) ;
		return state;
	}

	public List<Menu> selectMenuByType(int type) {
		return menuMapper.selectMenuByType(type);
	}

	public List<ROLE_MENUKey> selectROLE_MENUKeyByMenuid(int menuId) {
		return roleMENUMapper.selectROLE_MENUKeyByMenuid(menuId);
	}

	public int deleteByPrimaryKey(ROLE_MENUKey roleMENUKey) {
		int state = roleMENUMapper.deleteByPrimaryKey(roleMENUKey);
		return state;
	}

	public int addRoleMenu(ROLE_MENUKey roleMENUKey) {
		int state = roleMENUMapper.insertSelective(roleMENUKey) ;
		return state;
	}

	public List<Menu> selectMenuByXX(Menu record) {
		return menuMapper.selectMenuByXX(record);
	}

	public List<Menu> selectMenuByXXPrecise(Menu record) {
		return menuMapper.selectMenuByXXPrecise(record);
	}

	public Menu selectMenuByName(String menuName) {
		return menuMapper.selectMenuByName(menuName);
	}

	public List<Menu> selectMenusByRoleIdAndMenuId(int roleId, int menuId, boolean isContainMenuId) throws Exception {
		List<Menu> resultMenus = selectMenusByRoleid(roleId) ;
		List<Menu> listMenu = new ArrayList<Menu>() ;
		Menu menu = selectMenuByMenuid(menuId) ;
		if(menu==null){
			throw new RuntimeException("menuId=" + menuId + "不存在") ;
		}
		if(isContainMenuId){
			listMenu.add(menu) ;
		}
		getMenus(resultMenus, listMenu, menuId);
		return listMenu;
	}
	
	private void getMenus(List<Menu> resultMenus, List<Menu> listMenu, int menuId) {
		for(Menu menu : resultMenus){
			if(menu.getType()==menuId) {
				listMenu.add(menu) ;
				getMenus(resultMenus, listMenu, menu.getId());
			}
		}
	}

	public List<Menu> selectMenusByRoleIdAndMenuIdWithoutGrandChild(int roleId, int menuId) throws Exception {
		List<Menu> resultMenus = selectMenusByRoleid(roleId) ;
		List<Menu> listMenu = new ArrayList<Menu>() ;
		for(Menu menu : resultMenus){
			if(menu.getType() == menuId) {
				listMenu.add(menu) ;
			}
		}
		return listMenu;
	}
	
	public List<Map<String, String>> readDefaultIcon() {
		List<Map<String, String>>icons = new ArrayList<Map<String, String>>();
		String filepath = UploadUtil.getPath()
				+ "static\\ztree\\css\\zTreeStyle\\img\\diy\\";
		File file = new File(filepath);
		if (file.isDirectory()) {
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++) {
				File readfile = new File(filepath + "\\" + filelist[i]);
				if (!readfile.isDirectory()) {
					Map<String, String> iconMap = new HashMap<String, String>();
					iconMap.put("name", readfile.getName());
					iconMap.put("url","../static/ztree/css/zTreeStyle/img/diy/" + filelist[i]);
					icons.add(iconMap);
				}
			}
		}
		return icons;
	}
	
	/**
	 * 目录与父目录关联
	 */
	public List<Map<String, Object>> menuRelatedFather(List<Menu> menusList) {
		List<Map<String, Object>> menusListCDir = new ArrayList<Map<String, Object>>();
		int i = 0;
		try {
			for (Menu menu : menusList) {
				Map<String, Object> menuMap = new HashMap<String, Object>();
				menuMap.put("menu", menu);
				if (menu.getType() != null&&menu.getType() != 0) {
					menuMap.put("fathermenu",
							selectMenuByMenuid(menu.getType())
									.getMenuName());
				}

				menusListCDir.add(i, menuMap);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menusListCDir;
	}
	
	/**
	 * 根据父菜单id级联查找子菜单并将子菜单的父亲设为空
	 * 
	 * @return
	 */
	public void cascadeMenuForType(int type) {
		List<Menu> menuList = selectMenuByType(type);
		Iterator<Menu> it = menuList.iterator();
		while (it.hasNext()) {
			Menu menu = it.next();
			menu.setType(0);
			modifyMenu(menu);
			cascadeRoleMenuForMenu(menu.getId());
			cascadeMenuForType(menu.getId());
		}
		return;
	}

	/**
	 * 根据菜单id级联查找分配到的角色并将角色所分配的菜单设为空
	 * 
	 * @return
	 */
	public void cascadeRoleMenuForMenu(int menuId) {
		roleMENUMapper.deleteByMenuId(menuId);
	}

}
