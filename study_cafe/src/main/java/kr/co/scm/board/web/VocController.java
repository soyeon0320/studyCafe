package kr.co.scm.board.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.VocService;
import kr.co.scm.board.vo.VocFormVO;
import kr.co.scm.board.vo.VocVO;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/voc")
public class VocController extends BaseController{
	
	@Autowired
	private VocService vocService;

	@RequestMapping("/list")
	public ModelAndView list(VocFormVO vocFormVO,ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "board/voc/list.member";
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		VocVO searchVocVO = vocFormVO.getSearchVocVO();
		searchVocVO.setMemId(loginUser.getMemId());
		searchVocVO.setPageUnit(5);
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchVocVO);
		
		List<VocVO> vocList = vocService.getVocList(searchVocVO); 
		
		int totalCnt = vocService.getVocListTotalCnt(searchVocVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		
		mnv.addObject("vocList",vocList);
		mnv.addObject("paginationInfo",paginationInfo);

		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/registView")
	public String registForm(VocFormVO vocFormVO, Model model,HttpSession session) throws SQLException{
		String url ="board/voc/regist.member";
		model.addAttribute("kindList", codeService.getCodeListByLCode(new CmmnCodeVO("B02")));
		model.addAttribute("serviceList", codeService.getCodeListByLCode(new CmmnCodeVO("B03")));

		vocFormVO.setVocVO(new VocVO());
		setSaveToken(session, vocFormVO.getVocVO());
		
		return url;
	}

	@RequestMapping(value="/regist")
	public String regist(VocFormVO vocFormVO, Model model,HttpSession session,BindingResult bindingResult, HttpServletRequest request) throws SQLException{
		String url ="redirect:/voc/detail";
		
		VocVO vocVO = vocFormVO.getVocVO();
		beanValidator.validate(vocVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return url;
		}
		if(isValidateSaveToken(session, vocVO)) {
			vocService.regist(vocVO);
		}
		
		url += setParameterForRedirect(request);
		url += "&vocVO.vocNo=" + vocVO.getVocNo();

		return url;

	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, VocFormVO vocFormVO) throws SQLException {
		String url = "board/voc/detail.member";
		VocVO vocVO = vocService.getVoc(vocFormVO.getVocVO());
		mnv.addObject("vocVO",vocVO);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
