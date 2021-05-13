
package kr.co.scm.board.web;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.StudygroupService;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.StudygroupFormVO;
import kr.co.scm.board.vo.StudygroupScrapVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/stb")
public class StudyBoardController extends BaseController {
	
	@Autowired
	private StudygroupService studygroupService;
	
	@RequestMapping("/list")
	public ModelAndView list(StudygroupFormVO studygroupFormVO, ModelAndView mnv) throws Exception{
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("B01"));
		
		String url = "board/studygroup/list.member";
		
		StudygroupVO searchStudygroupVO = studygroupFormVO.getSearchStudygroupVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchStudygroupVO);
		
		List<StudygroupVO> stgList = studygroupService.studygroupPagingList(searchStudygroupVO);
		mnv.addObject("stgList",stgList);
		
		int totalCount = studygroupService.searchStudygroupPagingListCount(searchStudygroupVO);
		paginationInfo.setTotalRecordCount(totalCount);
		mnv.addObject("paginationInfo",paginationInfo);
		mnv.addObject("codeList",codeList);
		mnv.setViewName(url);
		
		
		//DB 현재 마감날짜
		List<StudygroupVO> recruitTime = studygroupService.getRecruitTime();
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date();
		
		// 현재 날짜
		String nowTime = format.format(now);
		for(StudygroupVO sget : recruitTime) {
			
			Date eTime = sget.getStudygroupEnd();
			String endTime = format.format(eTime);
			
			String passTime = endTime.replaceAll("-", "");
			String nTime = nowTime.replaceAll("-", "");
			
			if(endTime.equals(nowTime)) {
				studygroupService.chRcStatus();
			}else if(Integer.parseInt(passTime) < Integer.parseInt(nTime)) {
				studygroupService.chRcStatus();
			}
		}
		
		return mnv;
	}
	
	@RequestMapping(value="/registForm")
	public String registForm(StudygroupFormVO studygroupFormVO, Model model, HttpSession session) throws SQLException {
		
		String url = "board/studygroup/regist.member";
		model.addAttribute("codeList", codeService.getCodeListByLCode(new CmmnCodeVO("B01")));
		
		studygroupFormVO.setStudygroupVO(new StudygroupVO());
		setSaveToken(session, studygroupFormVO.getStudygroupVO());
		
		return url;
	}
	
	@RequestMapping(value="/regist")
	public String regist(StudygroupFormVO studygroupFormVO, Model model, HttpSession session, BindingResult bindingResult, HttpServletRequest request) throws SQLException{
		String url = "redirect:/stb/detail";
		
		StudygroupVO studygroupVO = studygroupFormVO.getStudygroupVO();
		beanValidator.validate(studygroupVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return url;
		}
		if(isValidateSaveToken(session, studygroupVO)) {
			studygroupService.sgBoardRegist(studygroupVO);
		}
		
		url += setParameterForRedirect(request);
		url += "&studygroupVO.studygroupNo=" + studygroupVO.getStudygroupNo();	
		return url;
		
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, StudygroupFormVO studygroupFormVO) throws SQLException{
		
		String url = "board/studygroup/detail.member";
		StudygroupVO sgv = studygroupService.getBoard(studygroupFormVO.getStudygroupVO());
		
		mnv.addObject("sgv", sgv);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	@RequestMapping(value="/modifyForm")
	public ModelAndView modifyForm(ModelAndView mnv, StudygroupFormVO studygroupFormVO, HttpSession session)throws SQLException{
		
		String url = "board/studygroup/modify.member";
		studygroupFormVO.getStudygroupVO().setModified(true);
		mnv.addObject("codeList", codeService.getCodeListByLCode(new CmmnCodeVO("B01")));
		
		setSaveToken(session, studygroupFormVO.getStudygroupVO());
		StudygroupVO sgv = studygroupService.getModifyBoard(studygroupFormVO.getStudygroupVO());
		
		mnv.addObject("sgv", sgv);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify")
	public String modify(StudygroupFormVO studygroupFormVO, Model model, HttpSession session, BindingResult bindingResult, HttpServletRequest request)throws SQLException{
		String url = "redirect:/stb/detail";
		
		StudygroupVO studygroupVO = studygroupFormVO.getStudygroupVO();
		beanValidator.validate(studygroupVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return url;
		}
		if(isValidateSaveToken(session, studygroupVO)) {
			studygroupService.modifySgv(studygroupVO);
		}
		
		url += setParameterForRedirect(request);
	
		return url;
	}
	
	
	@RequestMapping(value="/remove")
	public String remove(StudygroupFormVO studygroupFormVO, Model model, HttpSession session, HttpServletRequest request) throws SQLException{
		
		String url ="redirect:/stb/list";
			
		StudygroupVO studygroupVO = studygroupFormVO.getStudygroupVO();
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser != null && studygroupVO.getMemId().equals(loginUser.getMemId())) {
			studygroupService.removeStudygroup(studygroupVO);
		}
		
		
		url += setParameterForRedirect(request);
		return url;
		
	}
	
	@RequestMapping(value="/scrap/count")
	public String scrapRemove(StudygroupScrapVO studygroupScrapVO, HttpSession session, Model model) throws SQLException {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		StudygroupVO studygroupVO = new StudygroupVO();
		
		studygroupVO.setMemId(member.getMemId());
		studygroupVO.setStudygroupNo(studygroupScrapVO.getStudygroupNo());
		
		int scrapFlag = studygroupService.getStudyGroupScrapCount(studygroupVO);
		
		model.addAttribute("scrapFlag", scrapFlag);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/scrap/regist")
	public String scrapRegist(StudygroupScrapVO studygroupScrapVO) throws SQLException {
		studygroupService.scrapRegist(studygroupScrapVO);
		return "jsonView";
	}
	
	@RequestMapping(value="/scrap/remove")
	public String scrapRemove(StudygroupScrapVO studygroupScrapVO) throws SQLException {
		studygroupService.scrapRemove(studygroupScrapVO);
		return "jsonView";
	}
}
