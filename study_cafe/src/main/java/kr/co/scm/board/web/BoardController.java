 package kr.co.scm.board.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.BoardService;
import kr.co.scm.board.vo.BoardFormVO;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.ScrapManageVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Controller
@RequestMapping("/board")
public class BoardController extends BaseController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav, BoardFormVO boardFormVO, HttpSession session) throws Exception{
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("B01"));
		
		String url = "board/free/list.member";
		
		BoardVO searchBoardVO = boardFormVO.getSearchBoardVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchBoardVO);

		List<BoardVO> boardList = boardService.getBoardList(searchBoardVO);	
		
		int totalCount = boardService.getBoardListCount(searchBoardVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		mav.addObject("boardList", boardList);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("codeList", codeList);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/registView")
	public String registForm(BoardFormVO boardFormVO, HttpSession session) {
		String url = "board/free/regist.member";
		
		boardFormVO.setBoardVO(new BoardVO());
		setSaveToken(session, boardFormVO.getBoardVO());
		
		return url;
	}
	
	@RequestMapping(value="/regist")
	public String regist(BoardFormVO boardFormVO, HttpSession session,HttpServletRequest request) throws Exception {
		String url = "redirect:/board/detail";
		
		BoardVO boardVO = boardFormVO.getBoardVO();
		
		if(isValidateSaveToken(session, boardVO)) {
			boardService.regist(boardVO);
		}
		
		url += setParameterForRedirect(request);
		url += "&boardVO.freeNo=" + boardVO.getFreeNo();
		return url;
	}

	@RequestMapping(value="/detail")
	public String detailForm(BoardFormVO boardFormVO, Model model,HttpServletRequest request, HttpSession session) throws Exception {
		String url = "board/free/detail.member";
		
		BoardVO boardVO = boardService.detail(boardFormVO.getBoardVO());
		
		model.addAttribute("board", boardVO);
		model.addAttribute("boardFormVO", boardFormVO);
		
		return url;
	}

	@RequestMapping(value="/modifyView")
	public String modifyForm(BoardFormVO boardFormVO, ModelAndView mav, HttpSession session) throws Exception{
		String url = "board/free/modify.member";
		
		boardFormVO.getBoardVO().setModified(true);
		
		BoardVO boardVO = boardService.detail(boardFormVO.getBoardVO());
		
		boardFormVO.setBoardVO(boardVO);
		
		setSaveToken(session, boardFormVO.getBoardVO());
		
		mav.addObject("board", boardVO);
		mav.setViewName(url);
		
		return url;
	}
	
	@RequestMapping(value="/modify")
	public String modify(BoardFormVO boardFormVO, ModelAndView mav, HttpSession session,HttpServletRequest request) throws Exception {
		String url = "redirect:/board/detail";
		
		BoardVO boardVO = boardFormVO.getBoardVO();
		
		if(isValidateSaveToken(session, boardVO)) {
			boardService.modify(boardVO);
			boardVO.setModified(true);
		}
		url += setParameterForRedirect(request);
		return url;
	}
	
	@RequestMapping(value="/remove")
	public String remove(BoardFormVO boardFormVO, HttpSession session,HttpServletRequest request) throws Exception {
		String url = "redirect:/board/list";
		
		BoardVO boardVO = boardFormVO.getBoardVO();
		 
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		if(loginUser != null && boardVO.getMemId().equals(loginUser.getMemId())) {
			boardService.remove(boardVO);
		}
		
		url += setParameterForRedirect(request);
		return url;
	}
	
	@RequestMapping(value="/scrap/count")
	public String scrapRemove(BoardScrapVO boardScrapVO, HttpSession session, Model model) throws SQLException {
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		BoardVO boardVO = new BoardVO();
		
		boardVO.setMemId(member.getMemId());
		boardVO.setFreeNo(boardScrapVO.getFreeNo());
		
		int scrapFlag = boardService.getBoardScrapCount(boardScrapVO);
		
		model.addAttribute("scrapFlag", scrapFlag);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/scrap/regist")
	public String scrapRegist(BoardScrapVO boardScrapVO) throws SQLException {
		boardService.scrapRegist(boardScrapVO);
		return "jsonView";
	}
	
	@RequestMapping(value="/scrap/remove")
	public String scrapRemove(BoardScrapVO boardScrapVO) throws SQLException {
		boardService.scrapRemove(boardScrapVO);
		return "jsonView";
	}
	
}
