package kr.co.scm.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.scm.user.service.MemberService;
import kr.co.scm.user.vo.MemberVO;

public class Userinterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private MemberService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = true;
		
		HttpSession session = request.getSession();
		
		//session.setAttribute("redirectUrl",request.getRequestURI().replace(request.getContextPath(),"")+setParameterForRedirect(request));
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
//			loginUser = new MemberVO();
//			loginUser.setMemId("test");
//			loginUser=service.getMember(loginUser);
//			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath()+"/user/loginForm");
			result = false;
		}
		
		return result;
	}

	public String setParameterForRedirect(HttpServletRequest request) {
		
		StringBuffer sb = new StringBuffer("?");
		
		Enumeration<?> e = request.getParameterNames();
		
		while (e.hasMoreElements()){
			String name = (String) e.nextElement();
			String value = request.getParameter(name);
			sb.append(name);
			sb.append("=");
			sb.append(value);
			sb.append("&");
		}
		sb.setLength(sb.length()-1);
		
		
		return sb.toString();
	}
	
}
