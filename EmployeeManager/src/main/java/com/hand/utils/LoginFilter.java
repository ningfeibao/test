package com.hand.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {
	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();

		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		// System.out.println(path);
		// 从session里取员工工号信息
		//User user = (User) session.getAttribute("user");
		// 登陆页面无需过滤
		if (path.indexOf("/login.jsp") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		if (path.indexOf("/captchaImg") > -1) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		if (path.indexOf("/show") > -1) {
			// 判断如果没有取到员工信息,就跳转到登陆页面
			if (session == null || session.getAttribute("user") == null) {
				// 跳转到登陆页面
				servletResponse.sendRedirect("index");
			} else {
				// 已经登陆,继续此次请求
				chain.doFilter(request, response);
			}

		} else {
			// 已经登陆,继续此次请求
			chain.doFilter(request, response);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
