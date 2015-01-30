package com.cs.backend.util;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ObjectConvertUtil {
	/**
	 * 将数据库对象转换成vo对象
	 */
	public static Map<String, String> convert2Map(Object obj) throws Exception {
		Map<String, String> resultMap = new HashMap<String, String>() ;
		Method[] methods = obj.getClass().getMethods() ;
		for(Method method : methods) {
			String methodName = method.getName() ;
			if(methodName.startsWith("set")) {
				String field = methodName.replaceFirst("set", "") ;
				String fieldName = String.valueOf(field.charAt(0)).toLowerCase()  + field.substring(1, field.length());
				Method mtd = obj.getClass().getMethod("get" + field) ;
				//获得值
				Object value = mtd.invoke(obj) ;
				resultMap.put(fieldName, String.valueOf(value)) ;
			}
		}
		System.out.println(resultMap);
		return null;
	}
	
	/**
	 * 将数据库对象转换成vo对象list
	 */
	public static List<Map<String, String>> convert2ListMap(List<Object> objects) throws Exception {
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>() ;
		for(Object obj : objects) {
			Map<String, String> map = convert2Map(obj) ;
			mapList.add(map) ;
		}
		return mapList;
	}
}
