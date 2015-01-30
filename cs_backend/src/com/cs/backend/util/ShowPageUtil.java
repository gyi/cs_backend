package com.cs.backend.util;


public class ShowPageUtil {
	private static int pageNow = 1; // 初始化为1,默认从第一页开始显示
	private static int pageSize = 5; // 每页显示5条记录

	public static int getPageNow() {
		return pageNow;
	}

	public static void setPageNow(int thePageNow) {
		pageNow = thePageNow;
	}

	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int thePageSize) {
		pageSize = thePageSize;
	}
}
