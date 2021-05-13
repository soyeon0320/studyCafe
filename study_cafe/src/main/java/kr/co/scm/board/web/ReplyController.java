package kr.co.scm.board.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.ReplyService;
import kr.co.scm.board.vo.ReplyFormVO;
import kr.co.scm.board.vo.ReplyVO;

@Controller
@RequestMapping("/reply")
public class ReplyController extends BaseController {

	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/list")
	private String list(ReplyFormVO replyFormVO,Model model,HttpServletRequest request,HttpSession session) throws SQLException{
		ReplyVO searchReplyVO = replyFormVO.getSearchReplyVO();
		searchReplyVO.setReplyTable(replyFormVO.getTableName());
		
		PaginationInfo replyPaginationInfo = new PaginationInfo();
		searchReplyVO.setPageUnit(5);
		searchReplyVO.setPageSize(5);
		setUpPaginationInfo(replyPaginationInfo, searchReplyVO);
		
		int totalCount = replyService.getReplyListCount(searchReplyVO);
		replyPaginationInfo.setTotalRecordCount(totalCount);
		
		List<ReplyVO> replyList = replyService.getReplyList(searchReplyVO);
		model.addAttribute("replyPaginationInfo", replyPaginationInfo);
		model.addAttribute("replyList", replyList);
		
		replyFormVO.setReplyVO(new ReplyVO());
		setSaveToken(session, replyFormVO.getReplyVO());
		
		return "board/reply/reply";
		
	}
	
	
	@RequestMapping(value="/regist")
	public String regist(ReplyFormVO replyFormVO,Model model,HttpServletRequest request, HttpSession session) throws SQLException {
		
		try {
		
			ReplyVO replyVO = replyFormVO.getReplyVO();

			if(isValidateSaveToken(session, replyVO)) {
				replyVO.setReplyTable(replyFormVO.getTableName());
				replyService.replyRegist(replyVO);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();

		}
		
		
		return "forward:/board/detail";
	}
	
	@RequestMapping("/modifyView")
	public String modifyView(Model model, ReplyVO replyVO, HttpSession session, String[] tableName) throws SQLException {
		
		try {
			replyVO.setReplyTable(tableName);
			replyVO = replyService.getReplyByReplyNo(replyVO);
			model.addAttribute("replyVO",replyVO);
			setSaveToken(session, replyVO);
		} catch (SQLException e) {

		}
		
		return "jsonView";
	}


	@RequestMapping(value="/modify")
	public String modify(ReplyFormVO replyFormVO, Model model,HttpSession session) throws SQLException {
		
		try {
				ReplyVO replyVO = replyFormVO.getReplyVO();
			if(isValidateSaveToken(session, replyVO)) {
				replyVO.setReplyTable(replyFormVO.getTableName());
				replyService.replyModify(replyFormVO.getReplyVO());

			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "forward:/board/detail";
	}
	
	@RequestMapping(value="/remove")
	public String remove(ReplyFormVO replyFormVO, Model model) throws SQLException {
		
		try {
			ReplyVO replyVO = replyFormVO.getReplyVO();
			replyVO.setReplyTable(replyFormVO.getTableName());
			replyService.replyRemove(replyVO);
		
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return "forward:/board/detail";
	}
	
	
	
}
