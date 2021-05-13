package kr.co.scm.board.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.ReplyVO;

@Mapper("replyMapper")
public interface ReplyMapper {

	public List<ReplyVO> selectReplyList(ReplyVO replyVO) throws SQLException;

	public void insertReply(ReplyVO replyVO) throws SQLException;

	public void updateReply(ReplyVO replyVO) throws SQLException;

	public void deleteReply(ReplyVO replyVO) throws SQLException;

	public int selectReplyTotalCnt(ReplyVO searchReplyVO) throws SQLException;

	public ReplyVO selectReply(ReplyVO replyVO) throws SQLException;
	
}
