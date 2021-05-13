package kr.co.scm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.scm.admin.service.AdminService;
import kr.co.scm.admin.vo.AdminVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private AdminService adminService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean res = true;
		
		HttpSession session = request.getSession();
		
		AdminVO loginAdmin = (AdminVO)session.getAttribute("loginAdmin");
		
		if(loginAdmin == null) {
//			loginAdmin = new AdminVO();
//			loginAdmin.setAdminId("admin1");
//			loginAdmin = adminService.selectAdminById(loginAdmin);
//			session.setAttribute("loginAdmin", loginAdmin);
			
			
			response.sendRedirect(request.getContextPath()+"/admin/loginForm");
			res = false;
		}
		
		return res;
	}
	
	
}
