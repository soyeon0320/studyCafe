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
import kr.co.scm.board.service.InfoService;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.InfoFormVO;
import kr.co.scm.board.vo.InfoScrapVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.common.service.AttachService;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/info")
public class InfoBoardController extends BaseController{

	@Autowired
	private InfoService infoService;
	@Autowired
	private AttachService attachService;

	@RequestMapping("/list")
	public ModelAndView retrievePagingList(InfoFormVO infoFormVO, ModelAndView mnv) throws Exception {
		String url = "board/info/list.member";
		InfoVO searchInfoVO = infoFormVO.getSearchInfoVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchInfoVO);
		
		List<InfoVO> infoList = infoService.retrievePagingList(searchInfoVO);
		mnv.addObject("infoList",infoList);
		mnv.addObject("codeList", codeService.getCodeListByLCode(new CmmnCodeVO("B01")));
		
		int totCnt = infoService.retrievePagingListCount(searchInfoVO);
		paginationInfo.setTotalRecordCount(totCnt);
		mnv.addObject("paginationInfo",paginationInfo);

		mnv.setViewName(url);
		
		return mnv;

	}


	@RequestMapping(value="/registForm")
	public String registForm(InfoFormVO infoFormVO, Model model , HttpSession session) throws SQLException {
		String url = "board/info/registForm.member";
		
		InfoVO infoVO = new InfoVO();
		infoFormVO.setInfoVO(infoVO);
		setSaveToken(session, infoVO);
		
		return url;
	}

	@RequestMapping(value="/regist")
	public String regist(InfoFormVO infoFormVO, Model model,HttpSession session,BindingResult bindingResult, HttpServletRequest request) throws Exception {
		String url = "redirect:/info/detail"; //등록 완료 후 form을 들고 detail로 가야하기 때문에 redirect 디텔로
		
		InfoVO infoVO = infoFormVO.getInfoVO();
		beanValidator.validate(infoVO, bindingResult);
		
		if (bindingResult.hasErrors()) {
			return url;
		}
		
		if (isValidateSaveToken(session, infoVO)) {
			infoVO.setAttachList(saveFile(infoFormVO.getMultipartFiles()));
			infoService.registInfo(infoVO);
		}
		url += setParameterForRedirect(request);
		url += "&infoVO.infoNo=" + infoVO.getInfoNo();
		return url;
	}

	@RequestMapping("/detail")
	public ModelAndView detail(InfoFormVO infoFormVO, ModelAndView mnv) throws SQLException{
		String url = "board/info/detail.member";
		InfoVO info = infoService.getInfoBoard(infoFormVO.getInfoVO());
		mnv.addObject("info",info);
		mnv.setViewName(url);

		return mnv;


	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(InfoFormVO infoFormVO, ModelAndView mnv,HttpSession session) throws SQLException {
		String url = "board/info/modifyForm.member";
		infoFormVO.getInfoVO().setModified(true);
		InfoVO info = infoService.getInfoBoard(infoFormVO.getInfoVO());
		setSaveToken(session, info);
		infoFormVO.setInfoVO(info);
		mnv.addObject("infoVO", info);
		mnv.setViewName(url);
		return mnv;
	}


	@RequestMapping(value="/modify")
	public String modify(InfoFormVO infoFormVO, Model model,HttpSession session,BindingResult bindingResult, HttpServletRequest request) throws Exception{
		String url = "redirect:/info/detail";
		
		InfoVO infoVO = infoFormVO.getInfoVO();
		beanValidator.validate(infoVO, bindingResult);
		
		if (bindingResult.hasErrors()) {
			return url;
		}
		if (isValidateSaveToken(session, infoVO)) {
			infoVO.setModified(true);
			if (infoFormVO.getAddFromModifyFiles() != null && infoFormVO.getAddFromModifyFiles().length > 0) {
				InfoVO infoUtilVO = infoService.getInfoBoard(infoVO);
				int attachNo = attachService.insertAttach(infoUtilVO.getAttachNo(), saveFile(infoFormVO.getAddFromModifyFiles()));
				infoVO.setAttachNo(attachNo);
			}
			
			if(infoFormVO.getDeleteAttachCount() != null && infoFormVO.getDeleteAttachCount().length > 0) {
				InfoVO infoUtilVO = infoService.getInfoBoard(infoVO);
				infoUtilVO.setAttachList(infoFormVO.getDeleteAttachList(infoFormVO.getDeleteAttachCount(), infoUtilVO.getAttachNo()));
				attachService.deleteFiles(attachService.getFile(infoUtilVO));
			}
			infoService.modifyInfo(infoVO);
		}
		url += setParameterForRedirect(request);
		return url;
	}
	
	@RequestMapping("/remove")
	public String remove(InfoFormVO infoFormVO,HttpSession session, HttpServletRequest request) throws SQLException {
		String url="redirect:/info/list";
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		InfoVO infoVO = infoService.getInfoBoard(infoFormVO.getInfoVO());
		
		if(loginUser != null && infoVO.getMemId().equals(loginUser.getMemId())) {
			if(infoVO.getAttachList() != null && infoVO.getAttachList().size() > 0) {
				attachService.deleteFiles(infoVO.getAttachList());
			}
			infoService.remove(infoFormVO.getInfoVO());
		}
		url += setParameterForRedirect(request);

		return url;
	}
	
	@RequestMapping(value="/scrap/count")
	public String scrapRemove(InfoScrapVO infoScrapVO, HttpSession session, Model model) throws SQLException {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		InfoVO infoVO = new InfoVO();
		
		infoVO.setMemId(member.getMemId());
		infoVO.setInfoNo(infoScrapVO.getInfoNo());
		
		int scrapFlag = infoService.getInfoScrapCount(infoScrapVO);
		
		model.addAttribute("scrapFlag", scrapFlag);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/scrap/regist")
	public String scrapRegist(InfoScrapVO infoScrapVO) throws SQLException {
		infoService.scrapRegist(infoScrapVO);
		return "jsonView";
	}
	
	@RequestMapping(value="/scrap/remove")
	public String scrapRemove(InfoScrapVO infoScrapVO) throws SQLException {
		infoService.scrapRemove(infoScrapVO);
		return "jsonView";
	}
}
