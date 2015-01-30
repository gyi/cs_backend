package com.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyBatisConfig {
	
	private static ApplicationContext context ;
	static {
		context = 
    	    	new ClassPathXmlApplicationContext(new String[] {"spring-system.xml",
    	              "spring-dao.xml"});
	}
	
	public static <T> T getBean(Class<T> claz) {
		return context.getBean(claz) ;
	}
}
