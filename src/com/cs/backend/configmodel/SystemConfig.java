package com.cs.backend.configmodel;

/**
 * @author zhaowei
 *	加载系统配置文件SystemConfig.properties
 */
public class SystemConfig extends GetConfigInfo{
	private static SystemConfig config ;
	private final static String systemConfigFile = "SystemConfig.properties" ;
	private final static String thePackage = "com.cs.backend.configmodel.";
	
	/**
	 * 获得单例信息
	 */
	public static SystemConfig getInstance() {
		if(config==null) {
			config = (SystemConfig) GetConfigInfo.getInstance(thePackage+"SystemConfig") ;
			config.connConfig(systemConfigFile);
		}
		return config ;
	}
	
	/**
	 * 重新加载系统文件信息
	 */
	public static void loadSystemConfig() {
		config = (SystemConfig) GetConfigInfo.getInstance(thePackage+"SystemConfig") ;
		config.connConfig(systemConfigFile);
	}
	
	@SuppressWarnings("unused")
	public static void main(String[] args) {
		MessageConfig messageConfig = MessageConfig.getInstance("en_US");
		SystemConfig systemConfig = SystemConfig.getInstance();
		SystemConfig systemConfig2 = SystemConfig.getInstance();
	}
}
