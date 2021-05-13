package kr.co.scm.board.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.NoticeService;
import kr.co.scm.board.vo.NoticeFormVO;
import kr.co.scm.board.vo.NoticeVO;
import kr.co.scm.egov.vo.CmmnCodeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController{
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * @param noticeFormVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")
	public String retrievePagingList(NoticeFormVO noticeFormVO, ModelMap model) throws Exception {

		NoticeVO searchNoticeVO = noticeFormVO.getSearchNoticeVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchNoticeVO);
		
		List<NoticeVO> list = noticeService.retrievePagingList(searchNoticeVO);
		model.addAttribute("resultList", list);

		List<NoticeVO> upList = noticeService.upNoticeList();
		model.addAttribute("upNoticeList", upList);
		
		int totCnt = noticeService.retrievePagingListCount(searchNoticeVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("B00"));
		model.addAttribute("codeList", codeList);
		
		return "board/notice/list.member";
	}
	
	@RequestMapping("/listAdminVer")
	public String retrievePagingList2(NoticeFormVO noticeFormVO, ModelMap model) throws Exception {
		
		NoticeVO searchNoticeVO = noticeFormVO.getSearchNoticeVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchNoticeVO);
		
		List<NoticeVO> list = noticeService.retrievePagingList(searchNoticeVO);
		model.addAttribute("resultList", list);
		
		List<NoticeVO> upList = noticeService.upNoticeList();
		model.addAttribute("upNoticeList", upList);
		
		int totCnt = noticeService.retrievePagingListCount(searchNoticeVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("B00"));
		model.addAttribute("codeList", codeList);
		
		return "board/notice/list.admin";
	}
	
	
	@RequestMapping("/detail")
	public String detail(NoticeFormVO noticeFormVO, ModelMap model)throws SQLException{
		
		NoticeVO notice = noticeFormVO.getNoticeVO();
		
		notice = noticeService.getNotice(notice);
		
		noticeFormVO.setNoticeVO(notice);
		
		model.addAttribute("noticeFormVO", noticeFormVO);
		
		return "board/notice/detail.member";
	}
	
	@RequestMapping("/detailAdminVer")
	public String detail2(NoticeFormVO noticeFormVO, ModelMap model)throws SQLException{
		
		NoticeVO notice = noticeFormVO.getNoticeVO();
		
		notice = noticeService.getNotice(notice);
		
		noticeFormVO.setNoticeVO(notice);
		
		model.addAttribute("noticeFormVO", noticeFormVO);
		
		return "board/notice/detail.admin";
	}
	
	
	
	@RequestMapping("/registForm")
	public String registForm(NoticeFormVO noticeFormVO) throws SQLException{
		
		noticeFormVO.setNoticeVO(new NoticeVO());
		
		return "board/notice/registForm.member";
	}
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(NoticeFormVO noticeFormVO, RedirectAttributes redirectAttributes,HttpServletRequest request) throws Exception	{
		String url = "redirect:/notice/detail";
		
		noticeService.regist(noticeFormVO.getNoticeVO());
		redirectAttributes.addFlashAttribute("message", "공지가 등록되었습니다.");
		
		url += setParameterForRedirect(request);
		url += "&noticeVO.noticeNo=" + noticeFormVO.getNoticeVO().getNoticeNo();
		
		return url;
		
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(NoticeFormVO noticeFormVO)throws SQLException{
		
		noticeFormVO.getNoticeVO().setModified(true);
		NoticeVO notice = noticeService.getNotice(noticeFormVO.getNoticeVO());
		
		noticeFormVO.setNoticeVO(notice);
		
		return "board/notice/modifyForm.member";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(NoticeFormVO noticeFormVO, Model model, HttpServletRequest request) throws Exception{
		String url = "redirect:/notice/detail";
		
		noticeFormVO.getNoticeVO().setModified(true);
		noticeService.modify(noticeFormVO.getNoticeVO());
		NoticeVO notice = noticeService.getNotice(noticeFormVO.getNoticeVO());
		
		noticeFormVO.setNoticeVO(notice);
		model.addAttribute("message", "공지가 수정되었습니다.");
		
		url += setParameterForRedirect(request);
		
		return url;
		
		
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(NoticeFormVO noticeFormVO, HttpServletRequest request) throws Exception{
		String url = "redirect:/notice/list";
		
		noticeService.remove(noticeFormVO.getNoticeVO());
		
		url += setParameterForRedirect(request);
		
		return url;
	}

}
