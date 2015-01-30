package com.cs.backend.configmodel;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * @author zhaowei
 *	加载系统配置文件SystemConfig.properties
 */
public class GetConfigInfo {
	private Logger logger = Logger.getLogger(GetConfigInfo.class) ;
	private Properties configProperties ;
	/**
     * 登记薄,用来存放所有登记的实例
     */
    private static Map<String, GetConfigInfo> m_registry = new HashMap<String, GetConfigInfo>();
    
  //在类加载的时候添加一个实例到登记薄
    static {
    	GetConfigInfo x = new GetConfigInfo();
        m_registry.put(x.getClass().getName(), x);
    }
	
	/**
	 * 初始化加载文件信息
	 */
	protected GetConfigInfo() {
		
	}
	
	public void connConfig(String ConfigFileName){
		try {
			configProperties = new Properties() ;
			InputStream inStream = GetConfigInfo.class.getClassLoader().getResourceAsStream(ConfigFileName) ;
			configProperties.load(inStream) ;
		} catch (IOException e) {
			logger.error(e, e) ;
		}
	}
	
	 /**
     * 静态工厂方法,返回指定登记对象的唯一实例;
     * 对于已登记的直接取出返回,对于还未登记的,先登记,然后取出返回
     * @param name
     * @return RegSingleton
     */
    public static GetConfigInfo getInstance(String name) {
        if (name == null) {
            name = "GetConfigInfo";
        }
        if (m_registry.get(name) == null) {
            try {
                m_registry.put(name, (GetConfigInfo) Class.forName(name).newInstance());
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return m_registry.get(name);
    }
	
	/**
	 * 获得系统信息
	 */
	public Properties getSystemConfigProperties() {
		return configProperties ;
	}
	
	/**
	 * 重新加载系统文件信息
	 */
	public static void loadSystemConfig(String name) {
		if (name == null) {
            name = "GetConfigInfo";
        }
        try {
            m_registry.put(name, (GetConfigInfo) Class.forName(name).newInstance());
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
	}
	
	
}
