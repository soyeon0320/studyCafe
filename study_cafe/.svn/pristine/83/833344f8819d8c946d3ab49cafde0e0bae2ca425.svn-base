package kr.co.scm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.scm.store.service.OwnerService;
import kr.co.scm.store.vo.OwnerVO;

public class StoreInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private OwnerService ownerService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean res = true;
		
		HttpSession session = request.getSession();
		
		OwnerVO loginOwner = (OwnerVO)session.getAttribute("loginOwner");
		
		if(loginOwner == null) {
//			loginOwner = new OwnerVO();
//			loginOwner.setOwnerId("sy0320");
//			loginOwner = ownerService.selectOwnerById(loginOwner);
//			session.setAttribute("loginOwner", loginOwner);
			
			response.sendRedirect(request.getContextPath()+"/store/loginForm");
			res = false;
		}
		
		return res;
		
	}
	
	
}
