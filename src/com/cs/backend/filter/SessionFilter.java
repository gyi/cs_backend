package com.cs.backend.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author zhaowei
 * @date 2013-12-26
 * 
 */
public class SessionFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		//判断ajax请求时session超时
		if("XMLHttpRequest".equals(req.getHeader("X-Requested-With"))){
			if(null == req.getSession().getAttribute("USERNAME")){
				HttpServletResponse rep = (HttpServletResponse)response;
				rep.setStatus(911);//表示session timeout  
				return;
			}
		}
		request.setAttribute("LANGUAGE", request.getLocale().toString());
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
	}

}
