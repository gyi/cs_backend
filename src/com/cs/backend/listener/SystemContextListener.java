package com.cs.backend.listener;

import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.cs.backend.configmodel.SystemConfig;

public class SystemContextListener implements ServletContextListener {
	private Logger logger = Logger.getLogger(SystemContextListener.class) ;
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		//系统信息初始化
		try {
			Properties systemProperty = SystemConfig.getInstance().getSystemConfigProperties() ;
			//加载工程名
			String systemName = systemProperty.getProperty("backend.systemName") ;
			arg0.getServletContext().setAttribute("systemName", systemName) ;
		} catch (Exception e) {
			logger.error(e, e) ;
		}
	}
}
