package com.cs.backend.action;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cs.backend.configmodel.SystemConfig;
import com.cs.backend.db.model.Menu;
import com.cs.backend.db.model.User;
import com.cs.backend.service.MenuService;
import com.cs.backend.service.UserService;
import com.cs.backend.util.CodeUtil;

/**
 * 
* @Description: TODO	登陆控制类
* @author zhaowei 
* @Ceatetime 2014年6月23日
*
 */
public class LoginAction extends BaseAction {
	private Logger logger = Logger.getLogger(LoginAction.class) ;
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Integer userId = null;
	/**
	 * 用户名
	 */
	private String username = null;
	/**
	 * 密码
	 */
	private String password = null;
	/**
	 * 返回菜单
	 */
	private String menus = null;
	
	/**
	 * 菜单id
	 */
	private int menuId ;
	
	/**
	 * 结果
	 */
	private String result ;
	
	/**
	 * 页面状态  1:表示普通页面， 2表示桌面页面
	 */
	private String state ;
	
	/**
	 * 页面名
	 */
	private String page ;
	
	/**
	 * 次级文件
	 */
	private List<Menu> menuTile ;
	
	private Map<Integer, List<Menu>> resultMap ;
	
	@Resource
	private MenuService menuService ;
	@Resource
	private UserService userService ;
	
	/**
	 * 登陆
	 */
	public String login() {
		
		Subject subject = SecurityUtils.getSubject() ;
		
		String returnstr = SUCCESS ;
		try {
			UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, new String(CodeUtil.Md5(password))) ;
			usernamePasswordToken.setRememberMe(true) ;
			subject.login(usernamePasswordToken) ;
			
		} catch (Exception e) {
			e.printStackTrace() ;
			this.addFieldError("errorInfo", getText("gccp.validate.checkuserpass"));
			returnstr = INPUT ;
		}
		return returnstr;
	}
	
	/**
	 * 登陆成功
	 */
	public String loginSuccess() {
		try {
			Subject subject = SecurityUtils.getSubject() ;
			User user = (User) subject.getPrincipal() ;
			userId = user.getUserId();
			username = user.getUserName();
			//角色id
			int roleId = user.getRoleId() ;
			List<Menu> resultMenus = menuService.selectMenusByRoleid(roleId) ;
			menus = JSON.toJSONString(resultMenus, SerializerFeature.WriteMapNullValue) ;
			//将次级菜单加入到文件头
			menuTile = new ArrayList<Menu>() ;
			String maxMenuId = (String) SystemConfig.getInstance().getSystemConfigProperties().get("backend.maxmenuId") ;
			for(Menu menu : resultMenus) {
				if(menu.getType()==Integer.valueOf(maxMenuId)) {
					menuTile.add(menu) ;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	public String findMenuModule() {
		try {
			Subject subject = SecurityUtils.getSubject() ;
			User user = (User) subject.getPrincipal() ;
			//角色id
			int roleId = user.getRoleId() ;
			List<Menu> menusResult = menuService.selectMenusByRoleIdAndMenuId(roleId, menuId, true) ;
			menus = JSON.toJSONString(menusResult, SerializerFeature.WriteMapNullValue) ;
		} catch (Exception e) {
			logger.error(e, e) ;
			return INPUT ;
		}
		return SUCCESS;
	}
	
	/**
	 * 切换到桌面
	 */
	public String desktopPage() {
		try {
			result = "false" ;
			Subject subject = SecurityUtils.getSubject() ;
			User user = (User) subject.getPrincipal() ;
			userId = user.getUserId();
			username = user.getUserName();
			//角色id
			int roleId = user.getRoleId() ;
			List<Menu> resultMenus = menuService.selectMenusByRoleid(roleId) ;
			menus = JSON.toJSONString(resultMenus, SerializerFeature.WriteMapNullValue) ;
			//将次级菜单加入到文件头
			menuTile = new ArrayList<Menu>() ;
			String maxMenuId = (String) SystemConfig.getInstance().getSystemConfigProperties().get("backend.maxmenuId") ;
			for(Menu menu : resultMenus) {
				if(menu.getType()==Integer.valueOf(maxMenuId)) {
					menuTile.add(menu) ;
				}
			}
			if(state.trim().equals("1")) {
				page = "main" ;
				user.setModel("1");
			}else {
				page = "desktop" ;
				resultMap = new TreeMap<Integer, List<Menu>>(new Comparator<Integer>() {
					public int compare(Integer o1, Integer o2) {
						return o1 - o2;
					}
				}) ;
				for(Menu menu : resultMenus) {
					for(Menu menuT : menuTile) {
						if(menu.getType() == menuT.getId()) {
							if(resultMap.containsKey(menuT.getId())){
								resultMap.get(menuT.getId()).add(menu) ;
							}else {
								List<Menu> menus = new ArrayList<Menu>() ;
								menus.add(menu) ;
								resultMap.put(menuT.getId(), menus) ;
							}
						}
					}
				}
				user.setModel("2");
			}
			userService.modifyUser(user) ;
			result = "true" ;
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "false" ;
		}
		return SUCCESS;
	}
	
	/**
	 * 登陆验证
	 */
	public void validateLogin() {
		if(StringUtils.isEmpty(username)) {
			this.addFieldError("username", getText("gccp.validate.userorpassnull"));
		}
		
		if(StringUtils.isEmpty(password)) {
			this.addFieldError("password", getText("gccp.validate.userorpassnull"));
		}
		
		return ;
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	public String loginOut() {
		Subject subject = SecurityUtils.getSubject() ;
		try{
			subject.logout();
		} catch (Exception e) {
			e.printStackTrace();
			return INPUT;
		}
		return SUCCESS;
	}
	
	/**
	 * 错误处理
	 */
	public String error() {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("LANGUAGE", request.getLocale().toString());
		return SUCCESS;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMenus() {
		return menus;
	}

	public void setMenus(String menus) {
		this.menus = menus;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public List<Menu> getMenuTile() {
		return menuTile;
	}

	public void setMenuTile(List<Menu> menuTile) {
		this.menuTile = menuTile;
	}

	public int getMenuId() {
		return menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Map<Integer, List<Menu>> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<Integer, List<Menu>> resultMap) {
		this.resultMap = resultMap;
	}
	
}
