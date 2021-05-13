package kr.co.scm.store.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.store.service.UseMemberService;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.vo.MemberFormVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/useMember")
public class UseMemberController extends BaseController{

	@Autowired
	private UseMemberService useMemberService;
	
	@RequestMapping("/list")
	public ModelAndView list(MemberFormVO memberFormVO, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "store/member/list.store";
		
		MemberVO searchMemberVO = memberFormVO.getSearchMemberVO();
				
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchMemberVO);
		
		String storeCode = ((StoreVO)session.getAttribute("loginStore")).getStoreCode();
		
		searchMemberVO.setStoreCode(storeCode);
		List<MemberVO> memberList = useMemberService.getUserMemberList(searchMemberVO);
		
		int totalCnt =  useMemberService.getUserMemberListCnt(searchMemberVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		
		mnv.addObject("memberList",memberList);
		mnv.addObject("paginationInfo", paginationInfo);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/detail")
	public String detail(Model model, MemberVO memberVO, HttpSession session) throws SQLException{
		
		String storeCode = ((StoreVO)session.getAttribute("loginStore")).getStoreCode();
		memberVO.setStoreCode(storeCode);
		
		MemberVO member = useMemberService.getUseMemberByMS(memberVO);
		
		
		model.addAttribute("member",member);
		
		return "jsonView";
	}
	
	@RequestMapping("/modifyView")
	public String modifyView(Model model,MemberVO memberVO,HttpSession session) throws SQLException{

		String storeCode = ((StoreVO)session.getAttribute("loginStore")).getStoreCode();
		memberVO.setStoreCode(storeCode);
		memberVO = useMemberService.getUseMemberByMS(memberVO);
		
		
		model.addAttribute("member", memberVO);
		setSaveToken(session, memberVO);
		
		return "jsonView";
		
	}
	
	@RequestMapping("/modify")
	public String modify(MemberFormVO memberFormVO, Model model, HttpSession session) throws SQLException{
		MemberVO memberVO = memberFormVO.getMemberVO();
		if (isValidateSaveToken(session, memberVO)) {
			useMemberService.modifyMemMemo(memberFormVO.getMemberVO());
		}
		return "forward:/useMember/list";
	}
	
	@RequestMapping("/seatHisList")
	public String seatHisList(Model model, MemberVO memberVO) throws SQLException{
		memberVO.setPageUnit(5);
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, memberVO);
		
		List<RentSeatVO> seatHisList = useMemberService.getSeatHisList(memberVO);
		
		int totalCnt = useMemberService.getSeatHisListCnt(memberVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		
		model.addAttribute("seatHisList",seatHisList);
		model.addAttribute("paginationInfo",paginationInfo);
		
		return "jsonView";
	}
	
	
}
