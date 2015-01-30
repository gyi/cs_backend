package com.cs.backend.configmodel;

/**
 * @author zhaowei
 *	加载系统配置文件SystemConfig.properties
 */
public class MessageConfig extends GetConfigInfo{
	private static MessageConfig config ;
	private static String systemConfigFile ;
	private final static String thePackage = "com.cs.backend.configmodel.";
	
	/**
	 * 获得单例信息
	 */
	public static MessageConfig getInstance(String language) {
		if(config==null) {
			config = (MessageConfig) GetConfigInfo.getInstance(thePackage+"MessageConfig") ;
			setSystemConfigFile(language);
			config.connConfig(systemConfigFile);
		}
		return config ;
	}
	
	/**
	 * 重新加载系统文件信息
	 */
	public static void loadSystemConfig(String language) {
		config = (MessageConfig) GetConfigInfo.getInstance(thePackage+"MessageConfig") ;
		setSystemConfigFile(language);
		config.connConfig(systemConfigFile);
	}

	public static String getSystemConfigFile() {
		return systemConfigFile;
	}

	public static void setSystemConfigFile(String language) {
		MessageConfig.systemConfigFile = "message_"+language+".properties";
	}
}
