package com.cs.backend.task;

import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.cs.backend.configmodel.SystemConfig;

@Component
public class SystemConfigTask extends TimerTask {
	
	private Logger logger = Logger.getLogger(SystemConfigTask.class) ;
	
	@Override
	public void run() {
		logger.info("更新系统配置") ;
		//重新加载系统配置
		SystemConfig.loadSystemConfig() ;
	}

}
