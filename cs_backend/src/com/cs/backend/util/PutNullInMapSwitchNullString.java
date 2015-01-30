package com.cs.backend.util;

import java.util.Map;

public class PutNullInMapSwitchNullString {

	public static Map<String, Object> toSwitch(Map<String, Object> theMap){
		for(Map.Entry<String, Object> aMap: theMap.entrySet()){
			if(aMap.getValue()==null){
				theMap.put(aMap.getKey(), "");
			}
		}
		return theMap;
	}
}
