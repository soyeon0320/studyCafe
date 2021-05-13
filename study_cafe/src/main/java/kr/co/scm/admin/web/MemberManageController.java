package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.admin.service.AdminService;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.vo.MemberFormVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/admin/member")
public class MemberManageController extends BaseController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/list")
	public ModelAndView memberListForm(Model model, ModelAndView mav, MemberFormVO memberFormVO) throws Exception {
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("B04"));
		
		String url = "admin/member/list.admin";
		
		MemberVO searchMemberVO = memberFormVO.getSearchMemberVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchMemberVO);
		
		List<MemberVO> memberList = adminService.getMemberList(searchMemberVO);
		
		int totalCount = adminService.getMemberListCount(searchMemberVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		adminService.getMemberStatic(model);
		
		mav.addObject("memberList", memberList);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("codeList", codeList);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/detail")
	public String memberDetail(Model model, MemberVO memberVO) throws Exception {
		MemberVO member = adminService.detail(memberVO);
		
		model.addAttribute("member", member);
		
		return "jsonView";
	}
}
