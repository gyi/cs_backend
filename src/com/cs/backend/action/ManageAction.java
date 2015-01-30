package com.cs.backend.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.cs.backend.configmodel.SystemConfig;
import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.User;
import com.cs.backend.service.MenuService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 桌面管理
 */
public class ManageAction extends ActionSupport {

	private static final long serialVersionUID = -1814074965004885835L;
	
	@Resource 
	private MenuService menuService ;
	
	/**
	 * 次级菜单id
	 */
	private int id ;
	
	/**
	 * 结果
	 */
	private String result ;
	
	/**
	 * 子目录
	 */
	private List<Menu> menus ;
	
	/**
	 * 桌面action跳转
	 */
	public String manage() {
		result = "false" ;
		try {
			//当前菜单
			Menu menu = menuService.selectMenuByMenuid(id) ;
			//父菜单
			Menu menuFather = menuService.selectMenuByMenuid(menu.getType()) ;
			String maxMenuId = (String) SystemConfig.getInstance().getSystemConfigProperties().get("backend.maxmenuId") ;
			if(menuFather.getType()==Integer.valueOf(maxMenuId)) {
				Subject subject = SecurityUtils.getSubject() ;
				User user = (User) subject.getPrincipal() ;
				menus = menuService.selectMenusByRoleIdAndMenuIdWithoutGrandChild(user.getRoleId(), id) ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS ;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
}
