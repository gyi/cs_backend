package com.cs.backend.util;

/**
 * @author yuan-hai
 * @date 2013-12-16
 * 
 */
public interface ICommonGameLog {

	public String getTablename();
	
	public String getSql(String tableName);
	
	public int getTableType();
	
	public long getStartTime();
	
	public long getEndTime();
}
