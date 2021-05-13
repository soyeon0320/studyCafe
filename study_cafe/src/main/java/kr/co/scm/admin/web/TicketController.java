package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.admin.service.AdminService;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.rent.service.TicketService;
import kr.co.scm.rent.vo.TicketFormVO;
import kr.co.scm.rent.vo.TicketVO;

@Controller
@RequestMapping("/ticket")
public class TicketController extends BaseController{

	@Autowired 
	TicketService ticketService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, TicketFormVO ticketFormVO,Model model) throws SQLException {
		List<CmmnCodeVO> statusList = codeService.getCodeListByLCode(new CmmnCodeVO("T02"));
		
		String url = "admin/ticket/list.admin";
		
		TicketVO searchTicketVO = ticketFormVO.getSearchTicketVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchTicketVO);
		
		List<TicketVO> ticketList = ticketService.getTicketPagingList(searchTicketVO);
		
		int totalCount = ticketService.getTicketPagingListCount(searchTicketVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		
		List<TicketVO> salesByTicket = adminService.getSalesByTicket();
		model.addAttribute("salesByTicket", salesByTicket);

		mnv.addObject("ticketList",ticketList);
		mnv.addObject("paginationInfo",paginationInfo);
		mnv.addObject("statusList",statusList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, TicketFormVO ticketFormVO) throws SQLException{
		String url = "admin/ticket/detail.open";
		TicketVO ticketVO = ticketService.getTicketByTicketNo(ticketFormVO.getTicketVO());
		mnv.addObject("ticket",ticketVO);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(TicketVO ticketVO, Model model, HttpSession session) throws SQLException{
		TicketVO ticket = ticketService.getTicketByTicketNo(ticketVO);
		model.addAttribute("ticket",ticket);
		return "jsonView";
	}
	
	@RequestMapping("/modify")
	public String modify(TicketVO ticketVO,Model model) throws SQLException{
		ticketService.modifyTicket(ticketVO);
		
		return "jsonView";
	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		return "admin/ticket/regist.open";
	}
	
	@RequestMapping("/regist")
	@ResponseBody
	public void regist(TicketVO ticketVO) throws SQLException{
		ticketService.registTicket(ticketVO);
	}
	

	
	
}
