package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.admin.service.MailService;
import kr.co.scm.admin.vo.MailSendHisVO;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.store.vo.OwnerVO;

@Controller
@RequestMapping("/mail")
public class MailController extends BaseController{

	@Autowired
	private MailService mailService;
	
	
	
	@RequestMapping("/sendForm")
	public String sendForm() throws SQLException {
		String url = "admin/mail/sendMail.admin";
		return url;
	}
	
	@RequestMapping("/search")
	public String addrList(Model model, SearchCriteria cri) throws SQLException{
		List<OwnerVO> addrList = mailService.getMailAddrList(cri);
		model.addAttribute("result", addrList);
		return "jsonView";
	}
	
	@RequestMapping("/sendMail")
	public String sendMail(MailSendHisVO mailSendHisVO, RedirectAttributes rttr) throws SQLException {
		String url = "redirect:/mail/list";

		mailService.send(mailSendHisVO);
			mailService.registSendMail(mailSendHisVO);
			rttr.addFlashAttribute("message","메일발송 성공");
		
		return url;
	}
	
	@RequestMapping("/list")
	public ModelAndView list(MailSendHisVO mailSendHisVO, ModelAndView mnv) throws SQLException {
		String url = "admin/mail/list.admin";
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, mailSendHisVO);
		
		List<MailSendHisVO> mailList = mailService.getMailList(mailSendHisVO);
		
		int totalCnt = mailService.getMailListCnt(mailSendHisVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		
		mnv.addObject("mailList",mailList);
		mnv.addObject("paginationInfo",paginationInfo);
		
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/detail")
	public String detail(MailSendHisVO mailSendHisVO, Model model) throws SQLException {
		List<OwnerVO> addrList = mailService.getMailAddrListByMailNo(mailSendHisVO);
		MailSendHisVO mail = mailService.getMailByMailNo(mailSendHisVO);
		
		model.addAttribute("addrList",addrList);

		model.addAttribute("mail",mail);
		return "jsonView";
	}
	
	
	
}
