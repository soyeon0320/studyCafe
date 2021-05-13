package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.scm.admin.service.NotitalkService;
import kr.co.scm.admin.vo.AdminVO;
import kr.co.scm.admin.vo.NotitalkVO;
import kr.co.scm.base.web.BaseController;

@Controller
@RequestMapping("/admin/talk")
public class TalkController extends BaseController{
	
	@Autowired
	NotitalkService notitalkService;
	
	@RequestMapping()
	public String main(ModelMap model, HttpSession session) throws SQLException{
		
		List<NotitalkVO> notitalkList = notitalkService.getNotitalkList();
		model.addAttribute("notitalkList", notitalkList);
		model.addAttribute("serverIp", getServerIp());
		
		
		return "admin/talk/talk2.admin";
	}
	
	@RequestMapping("/regist")
	public String regist(NotitalkVO notitalk, ModelMap model, HttpSession session) throws SQLException {
		
		AdminVO admin = (AdminVO)session.getAttribute("loginAdmin");
		
		notitalk.setAdminId(admin.getAdminId());
		
		notitalkService.insertNotitalk(notitalk);
		List<NotitalkVO> list = notitalkService.getNotitalkList();
		notitalk = list.get(0);
		
		model.addAttribute("notitalk", notitalk);
		
		return "jsonView";
	}
	
	@RequestMapping("/msg")
	public String sendMessage(HttpServletRequest request, ModelMap model) throws SQLException {
		
		NotitalkVO notitalk = new NotitalkVO();
		notitalk.setNotitalkNo(Integer.parseInt(request.getParameter("no")));
		notitalk = notitalkService.getNotitalkByNo(notitalk);
		
		model.addAttribute("notitalk", notitalk);
		
		return "admin/talk/talk_mobile.open";
	}
	
	

}
