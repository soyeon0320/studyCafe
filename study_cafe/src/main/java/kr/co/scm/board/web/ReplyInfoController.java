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
import kr.co.scm.board.vo.ReplyInfoFormVO;
import kr.co.scm.board.vo.ReplyVO;

@Controller
@RequestMapping("/replyInfo")
public class ReplyInfoController extends BaseController {

	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/list")
	private String list(ReplyInfoFormVO replyInfoFormVO,Model model,HttpServletRequest request,HttpSession session) throws SQLException{
		ReplyVO searchReplyVO = replyInfoFormVO.getSearchReplyVO();
		searchReplyVO.setReplyTable(replyInfoFormVO.getTableName());
		
		PaginationInfo replyPaginationInfo = new PaginationInfo();
		searchReplyVO.setPageUnit(5);
		setUpPaginationInfo(replyPaginationInfo, searchReplyVO);
		
		int totalCount = replyService.getReplyListCount(searchReplyVO);
		replyPaginationInfo.setTotalRecordCount(totalCount);
		
		List<ReplyVO> replyList = replyService.getReplyList(searchReplyVO);
		model.addAttribute("replyPaginationInfo", replyPaginationInfo);
		model.addAttribute("replyList", replyList);
		
		replyInfoFormVO.setReplyVO(new ReplyVO());
		setSaveToken(session, replyInfoFormVO.getReplyVO());
		
		return "board/reply/replyInfo";
		
	}
	
	
	@RequestMapping("/regist")
	public String regist(ReplyInfoFormVO replyInfoFormVO,Model model,HttpServletRequest request, HttpSession session) throws SQLException {
		
		try {
			ReplyVO replyVO = replyInfoFormVO.getReplyVO();

			if(isValidateSaveToken(session, replyVO)) {
				replyVO.setReplyTable(replyInfoFormVO.getTableName());
				replyService.replyRegist(replyVO);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "forward:/info/detail";
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
	public String modify(ReplyInfoFormVO replyInfoFormVO, Model model,HttpSession session) throws SQLException {
		
		try {
				ReplyVO replyVO = replyInfoFormVO.getReplyVO();
			if(isValidateSaveToken(session, replyVO)) {
				replyVO.setReplyTable(replyInfoFormVO.getTableName());
				replyService.replyModify(replyInfoFormVO.getReplyVO());
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "forward:/info/detail";
	}
	
	@RequestMapping(value="/remove")
	public String remove(ReplyInfoFormVO replyInfoFormVO, Model model) throws SQLException {
		
		try {
			ReplyVO replyVO = replyInfoFormVO.getReplyVO();
			replyVO.setReplyTable(replyInfoFormVO.getTableName());
			replyService.replyRemove(replyVO);
		
		}catch(SQLException e) {
			
			e.printStackTrace();
			
		}
		
		return "forward:/info/detail";
	}
	
	
	
}
