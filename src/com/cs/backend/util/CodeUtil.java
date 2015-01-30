package com.cs.backend.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

public class CodeUtil {
	public static Logger logger = Logger.getLogger(CodeUtil.class);

	private static char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	public static String decodeBase64(String b64string) throws Exception {
		return new String(Base64.decodeBase64(b64string.getBytes()), "utf-8");
	}

	public static String encodeBase64(String stringsrc) {
		try {
			Base64 base64encode = new Base64();
			return new String(base64encode.encode(stringsrc.getBytes("utf-8")));
		} catch (UnsupportedEncodingException e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	public static void isOK(String auth, String md5key, String sign) throws Exception {
		System.out.println("auth:" + auth);
		System.out.println("authDecode:" + decodeBase64(auth));
		System.out.println("md5key:" + md5key);
	}

	public static String Md5(String s) {
		try {
			byte[] strTemp = s.getBytes();
			MessageDigest mdTemp = MessageDigest.getInstance("MD5");
			mdTemp.update(strTemp);
			byte[] md = mdTemp.digest();
			int j = md.length;
			char[] str = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[(k++)] = hexDigits[(byte0 >>> 4 & 0xF)];
				str[(k++)] = hexDigits[(byte0 & 0xF)];
			}
			return new String(str);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	public static String createUrlParam(Object[] param) {
		StringBuilder sb = new StringBuilder();
		boolean isfirst = true;
		try {
			if ((param != null) && (param.length > 1))
				for (int i = 0; i < param.length; i += 2)
					if (param[(i + 1)] != null) {
						if (!isfirst) {
							sb.append('&');
						}
						sb.append(param[i]);
						sb.append('=');
						String value = param[(i + 1)].toString();
						value = URLEncoder.encode(value, "utf-8");
						sb.append(value);
						isfirst = false;
					}
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
		}
		return sb.toString();
	}
}