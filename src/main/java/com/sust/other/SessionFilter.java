package com.sust.other;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.web.filter.OncePerRequestFilter;

import com.sust.entity.Login;

public class SessionFilter extends OncePerRequestFilter {
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {

		// 不过滤的uri
		String[] notFilter = new String[] { "/login","/users/register.jsp","/login.jsp","/index.jsp","/error.jsp","/css","/js","/img","/fonts"};

		// 请求的uri
		String uri = request.getRequestURI();
		// 是否过滤
		boolean doFilter = true;
		for (String s : notFilter) {
			if (uri.indexOf(s) != -1) {
				// 如果uri中包含不过滤的uri，则不进行过滤
				doFilter = false;
				break;
			}
		}

		if (doFilter) {
			// 执行过滤
			// 从session中获取登录者实体
			Login obj =(Login) request.getSession().getAttribute("login");
			if (null == obj) {
				boolean isAjaxRequest = isAjaxRequest(request);
				if (isAjaxRequest) {
					response.setCharacterEncoding("UTF-8");
					response.sendError(HttpStatus.UNAUTHORIZED.value(), "您已经太长时间没有操作,请重新登录");
					System.out.println(request.getContextPath());
					response.sendRedirect(request.getContextPath()+"/index.jsp");
					return;
				}
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			} else {
				// 如果session中存在登录者实体，则继续
				filterChain.doFilter(request, response);
			}
		} else {
			// 如果不执行过滤，则继续
			filterChain.doFilter(request, response);
		}
	}

	/**
	 * 判断是否为Ajax请求 <功能详细描述>
	 * 
	 * @param request
	 * @return 是true, 否false
	 * @see [类、类#方法、类#成员]
	 */
	public static boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("X-Requested-With");
		if (header != null && "XMLHttpRequest".equals(header))
			return true;
		else
			return false;
	}
}