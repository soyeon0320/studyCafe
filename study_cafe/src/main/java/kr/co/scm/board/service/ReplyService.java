package kr.co.scm.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.board.dao.ReplyMapper;
import kr.co.scm.board.vo.ReplyVO;

@Service("replyService")
public class ReplyService   {

	@Autowired
	private ReplyMapper replyMapper;
	
	public List<ReplyVO> getReplyList(ReplyVO replyVO) throws SQLException {
		return replyMapper.selectReplyList(replyVO);
	}
	
	public void replyRegist(ReplyVO replyVO) throws SQLException {
		replyMapper.insertReply(replyVO);
	}
	
	public void replyModify(ReplyVO replyVO) throws SQLException {
		replyMapper.updateReply(replyVO);
	}
	
	public void replyRemove(ReplyVO replyVO) throws SQLException {
		replyMapper.deleteReply(replyVO);
	}

	public int getReplyListCount(ReplyVO searchReplyVO)  throws SQLException{
		return replyMapper.selectReplyTotalCnt(searchReplyVO);
	}

	public ReplyVO getReplyByReplyNo(ReplyVO replyVO) throws SQLException{
		return replyMapper.selectReply(replyVO);
	}
}
