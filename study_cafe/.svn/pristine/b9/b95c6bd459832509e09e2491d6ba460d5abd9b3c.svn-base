package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.scm.admin.service.AdminService;
import kr.co.scm.admin.vo.AdminSalesVO;
import kr.co.scm.admin.vo.AdminVO;
import kr.co.scm.rent.vo.TicketVO;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/main")
	public String main(Model model) throws SQLException{
		String url = "admin/main.admin";
		
		adminService.setAdminMainAttributes(model);
		
		return url;
	}
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() {
		String url = "admin/account/loginForm.open";
		return url;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(AdminVO adminVO, HttpSession session, RedirectAttributes redirectAttributes) throws SQLException {
		String url = "redirect:/admin/main";
		String message = "";
		AdminVO admin = adminService.selectAdminById(adminVO);
		
		if(admin != null && admin.getAdminId() != null) {
			if(admin.getAdminPass().equals(adminVO.getAdminPass())) {
				session.setAttribute("loginAdmin", admin);
			}else {
				message = "아이디 혹은 패스워드가 일치하지 않습니다.";
				url = "redirect:/admin/loginForm";
			}
		}else {
			message = "존재하지 않는 계정입니다.";
			url = "redirect:/admin/loginForm";
		}
		
		redirectAttributes.addFlashAttribute("message", message);
		return url;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/admin/loginForm";
		session.invalidate();
		return url;
	}
	
	@RequestMapping("/sales")
	public String sales(Model model) throws SQLException {
		
		List<TicketVO> salesByTicket = adminService.getSalesByTicket();
		model.addAttribute("salesByTicket", salesByTicket);
		
		List<AdminSalesVO> dailySales = adminService.dailySales();
		model.addAttribute("dailySales", dailySales);
		
		List<AdminSalesVO> monthlySales = adminService.monthlySales();
		model.addAttribute("monthlySales", monthlySales);
		
		List<AdminSalesVO> dailyCnt = adminService.dailyCntByType();
		model.addAttribute("dailyCnt", dailyCnt);
		
		adminService.setAdminMainAttributes(model);
		
		return "admin/sales/sales_chart.admin";
	}
	
}
