package com.cs.backend.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

public class ParamUtil {
	private static Logger logger = Logger.getLogger(ParamUtil.class) ;
	public static int getInt(HttpServletRequest request, String paraname) {
		return getInt(request, paraname, 0);
	}

	public static int getInt(HttpServletRequest request, String paraname, int defaultvalue) {
		String value = request.getParameter(paraname);
		if (StringUtils.isBlank(value)) {
			return defaultvalue;
		}
		try {
			return Integer.parseInt(value);
		} catch (Exception e) {
			logger.error(e, e);
		}
		return defaultvalue;
	}

	public static long getLong(HttpServletRequest request, String paraname) {
		return getLong(request, paraname, 0L);
	}

	public static boolean contains(String keyword, String... values) {
		boolean pass = false;
		for (String value : values) {
			if (!StringUtils.isBlank(value) && value.contains(keyword)) {
				pass = true;
				break;
			}
		}
		return pass;
	}

	public static long getLong(HttpServletRequest request, String paraname, long defaultvalue) {
		String value = request.getParameter(paraname);
		if (StringUtils.isBlank(value) || !StringUtils.isNumeric(value)) // TODO
																			// isNumeric
																			// 对
																			// long型是否有效
			return defaultvalue;
		return Long.valueOf(value);
	}

	public static String getString(HttpServletRequest request, String paraname) {
		return getString(request, paraname, "");
	}

	public static String getString(HttpServletRequest request, String paraname, String defaultvalue) {
		String value = request.getParameter(paraname);
		if (StringUtils.isBlank(value)) {
			value = defaultvalue;
		}
		return value;
	}

	/**
	 * 产生一个cookie
	 * 
	 * @param request
	 * @param name
	 * @param value
	 * @param expiry
	 *            secend
	 * @return
	 */
	public static Cookie createCookie(HttpServletRequest request, String name, String value, int expiry) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(expiry);
		cookie.setPath("/DCJBackend");
		return cookie;
	}

	public static String getDateString(HttpServletRequest request, String paraname) {
		String value = request.getParameter(paraname);
		if (StringUtils.isBlank(value)) {
			value = DateUtil.convertLong2String(System.currentTimeMillis());
		}
		return value;
	}

	public static Object getSessionParam(HttpServletRequest request, String paraname) {
		return request.getSession().getAttribute(paraname);
	}

	public static String getSessionStringParam(HttpServletRequest request, String paraname) {
		Object obj = request.getSession().getAttribute(paraname);
		if (obj != null)
			return obj.toString();
		else
			return null;
	}

	public static int getMapInt(Map<String, String> map, String paraname) {
		return getMapInt(map, paraname, 0);
	}

	public static int getMapInt(Map<String, String> map, String paraname, int defaultvalue) {
		int value = -1;
		String v = "-1";
		if (map.containsKey(paraname)) {
			v = (String) map.get(paraname);
			if (!StringUtils.isBlank(v) && (StringUtils.isNumeric(v) || (v.length() > 1 && v.startsWith("-") && StringUtils.isNumeric(v.substring(1)))))
				value = Integer.parseInt(v);
			else
				value = defaultvalue;
		} else {
			value = defaultvalue;
		}
		return value;
	}

	public static int getIntMapInt(Map<String, Integer> map, String paraname) {
		return getIntMapInt(map, paraname, 0);
	}

	public static int getIntMapInt(Map<String, Integer> map, String paraname, int defaultvalue) {
		int value = defaultvalue;
		if (map.containsKey(paraname)) {
			value = map.get(paraname);
		}
		return value;
	}

	public static long getMapLong(Map<String, String> map, String paraname) {
		return getMapLong(map, paraname, 0L);
	}

	public static long getMapLong(Map<String, String> map, String paraname, long defaultvalue) {
		long value = defaultvalue;
		if (map.containsKey(paraname)) {
			String v = map.get(paraname);
			value = StringUtils.isBlank(v) ? defaultvalue : Long.valueOf(v);
		}
		return value;
	}

	public static String getMapString(Map<String, String> map, String paraname) {
		return getMapString(map, paraname, "");
	}

	public static String getMapString(Map<String, String> map, String paraname, String defaultvalue) {
		String value = defaultvalue;
		if (map.containsKey(paraname)) {
			value = (String) map.get(paraname);
			value = StringUtils.isBlank(value) ? defaultvalue : value;
		}
		return value;
	}

	public static void mapIntIncrement(Map<String, Integer> map, String key, int crement) {
		if (map.containsKey(key)) {
			int curvalue = map.get(key);
			map.put(key, curvalue + crement);
		} else {
			map.put(key, crement);
		}
	}

	public static void mapIntIncrement(Map<Integer, Integer> map, int key, int crement) {
		if (map.containsKey(key)) {
			int curvalue = map.get(key);
			map.put(key, curvalue + crement);
		} else {
			map.put(key, crement);
		}
	}

	public static String getMapIntStringValue(Map<Integer, String> map, int paraname) {
		return getMapIntStringValue(map, paraname, "");
	}

	public static String getMapIntStringValue(Map<Integer, String> map, int paraname, String defaultvalue) {
		String value = defaultvalue;
		if (map.containsKey(Integer.valueOf(paraname))) {
			value = (String) map.get(Integer.valueOf(paraname));
		} else {
			value = "未知" + paraname;
		}
		return value;
	}

	public static List<Long> getListinListList(List<Long> alist, List<Long> blist) {
		List<Long> inlist = new ArrayList<Long>();
		if (alist.size() <= 0 || blist.size() <= 0)
			return inlist;
		for (Long l : alist) {
			if (blist.contains(l)) {
				inlist.add(l);
			}
		}
		return inlist;
	}

	public static int getListinListCount(List<Long> alist, List<Long> blist) {
		if ((alist.size() <= 0) || (blist.size() <= 0))
			return 0;
		int count = 0;
		for (Long a : alist) {
			if (blist.contains(a))
				count++;
		}
		return count;
	}

	public static List<String> getStringSetinListList(Set<String> aset, List<String> blist) {
		List<String> inlist = new ArrayList<String>();
		for (String a : aset) {
			if (blist.contains(a)) {
				inlist.add(a);
			}
		}
		return inlist;
	}

	public static List<Long> getSetinListList(Set<Long> aset, List<Long> blist) {
		List<Long> inlist = new ArrayList<Long>();
		for (Long a : aset) {
			if (blist.contains(a)) {
				inlist.add(a);
			}
		}
		return inlist;
	}

	public static int getListinSetCount(List<Long> alist, Set<Long> bset) {
		if ((alist.size() <= 0) || (bset.size() <= 0))
			return 0;
		int count = 0;
		for (Long a : alist) {
			if (bset.contains(a))
				count++;
		}
		return count;
	}

	public static int getSetinSetCount(Set<Long> aset, Set<Long> bset) {
		if ((aset.size() <= 0) || (bset.size() <= 0))
			return 0;
		int count = 0;
		for (Long a : aset) {
			if (bset.contains(a))
				count++;
		}
		return count;
	}

	public static int getStringSetinSetCount(Set<String> aset, Set<String> bset) {
		if ((aset.size() <= 0) || (bset.size() <= 0))
			return 0;
		int count = 0;
		for (String a : aset) {
			if (bset.contains(a))
				count++;
		}
		return count;
	}

	public static Set<Long> getSetinSetSet(Set<Long> aset, Set<Long> bset) {
		Set<Long> newSet = new HashSet<Long>();
		for (Iterator<Long> localIterator = aset.iterator(); localIterator.hasNext();) {
			long akey = ((Long) localIterator.next()).longValue();
			if (bset.contains(Long.valueOf(akey))) {
				newSet.add(Long.valueOf(akey));
			}
		}
		return newSet;
	}

	public static Set<String> getStringSetinSetSet(Set<String> aset, Set<String> bset) {
		Set<String> newSet = new HashSet<String>();
		for (String akey : aset) {
			if (bset.contains(akey)) {
				newSet.add(akey);
			}
		}
		return newSet;
	}

	public static double getDoubleRate(int a, int b) {
		return b == 0 ? 0 : (double) a / (double) b;
	}

	public static double getDoubleRate(double a, double b) {
		return b == 0 ? 0 : a / b;
	}

	public static boolean isBlank(String... values) {
		boolean result = false;
		for (String s : values) {
			if (StringUtils.isBlank(s)) {
				result = true;
				break;
			}
		}
		return result;
	}
}