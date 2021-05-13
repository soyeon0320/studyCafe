package kr.co.scm.exception.web;

import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.co.scm.admin.vo.AdminVO;
import kr.co.scm.exception.service.ErrorLogService;
import kr.co.scm.exception.vo.ErrorLogVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.user.vo.MemberVO;

@ControllerAdvice
public class ExceptionController {
	
	@Autowired
	private ErrorLogService errorLogService;
	
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e,HttpServletRequest request,HttpSession session,Model model) {
    	
    	errorLogService.insertErrorLog(toLogVO(e, request,session));
    	e.printStackTrace();
    	return "redirect:/common/errorPage";
    }
    
    public ErrorLogVO toLogVO(Exception e, HttpServletRequest request, HttpSession session) {
    	ErrorLogVO errorLogVO = new  ErrorLogVO();
    	StringBuffer sb = new StringBuffer();

    	errorLogVO.setErrorRegDate(new Date());
    	
    	MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
    	OwnerVO ownerVO = (OwnerVO) session.getAttribute("loginOwner");
    	AdminVO adminVO = (AdminVO) session.getAttribute("loginAdmin");

    	if(memberVO != null) {
    		errorLogVO.setLoginActor("회원");
    		errorLogVO.setLoginId(memberVO.getMemId());
    	}else if(ownerVO != null) {
    		errorLogVO.setLoginActor("가맹주");
    		errorLogVO.setLoginId(ownerVO.getOwnerId());
    	}else if(adminVO != null) {
    		errorLogVO.setLoginActor("본사");
    		errorLogVO.setLoginId(adminVO.getAdminId());
    	}
    	
    	errorLogVO.setRequestURI(request.getRequestURI());
    	errorLogVO.setRequestIP(request.getRemoteAddr());
    	
    	
		Enumeration<?> enummer = request.getParameterNames();
		
		while (enummer.hasMoreElements()){
			String name = (String) enummer.nextElement();
			String[] values = request.getParameterValues(name);
			sb.append(name);
			sb.append("=");
			
			for (String value : values) {
				sb.append(value);
			}
			sb.append("&");
		}
		sb.setLength(sb.length()-1);
		errorLogVO.setParams(sb.toString());
		
		errorLogVO.setCause(e.toString());
		errorLogVO.setMessage(e.getMessage());

		/*e.getCause();
    	e.getLocalizedMessage();
    	e.getMessage();
    	e.getStackTrace();
    	e.fillInStackTrace();
    	e.toString();
    	*/
    	
    	
    	return errorLogVO;
    }
    
    
}
