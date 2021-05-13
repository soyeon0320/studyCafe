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
import kr.co.scm.board.vo.ReplySGFormVO;
import kr.co.scm.board.vo.ReplyVO;

@Controller
@RequestMapping("/replySG")
public class ReplySGController extends BaseController {

	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/list")
	private String list(ReplySGFormVO replySGFormVO,Model model,HttpServletRequest request,HttpSession session) throws SQLException{
		ReplyVO searchReplyVO = replySGFormVO.getSearchReplyVO();
		searchReplyVO.setReplyTable(replySGFormVO.getTableName());
		
		PaginationInfo replyPaginationInfo = new PaginationInfo();
		searchReplyVO.setPageUnit(5);
		setUpPaginationInfo(replyPaginationInfo, searchReplyVO);
		
		int totalCount = replyService.getReplyListCount(searchReplyVO);
		replyPaginationInfo.setTotalRecordCount(totalCount);
		
		List<ReplyVO> replyList = replyService.getReplyList(searchReplyVO);
		model.addAttribute("replyPaginationInfo", replyPaginationInfo);
		model.addAttribute("replyList", replyList);
		
		replySGFormVO.setReplyVO(new ReplyVO());
		setSaveToken(session, replySGFormVO.getReplyVO());
		
		return "board/reply/replySG";
		
	}
	
	
	@RequestMapping(value="/regist")
	public String regist(ReplySGFormVO replySGFormVO,Model model,HttpServletRequest request, HttpSession session) throws SQLException {
		
		try {
		
			ReplyVO replyVO = replySGFormVO.getReplyVO();

			if(isValidateSaveToken(session, replyVO)) {
				replyVO.setReplyTable(replySGFormVO.getTableName());
				replyService.replyRegist(replyVO);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "forward:/stb/detail";
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
	public String modify(ReplySGFormVO replySGFormVO, Model model,HttpSession session) throws SQLException {
		
		try {
				ReplyVO replyVO = replySGFormVO.getReplyVO();
			if(isValidateSaveToken(session, replyVO)) {
				replyVO.setReplyTable(replySGFormVO.getTableName());
				replyService.replyModify(replySGFormVO.getReplyVO());
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "forward:/stb/detail";
	}
	
	@RequestMapping(value="/remove")
	public String remove(ReplySGFormVO replySGFormVO, Model model) throws SQLException {
		
		try {
			ReplyVO replyVO = replySGFormVO.getReplyVO();
			replyVO.setReplyTable(replySGFormVO.getTableName());
			replyService.replyRemove(replyVO);
		
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		return "forward:/stb/detail";
	}
	
}
