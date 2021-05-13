package kr.co.scm.board.dao;

import java.sql.SQLException;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.VocManageVO;

@Mapper("vocManageMapper")
public interface VocManageMapper {

	public VocManageVO selectVocReplyByVocNo(int vocNo) throws SQLException;
	
	public VocManageVO selectVocReplyByVocReplyNo(VocManageVO vocManageVO) throws SQLException;
	
	public void insertVocReply(VocManageVO vocManageVO) throws SQLException;
	
	public void updateVocReply(VocManageVO vocManageVO) throws SQLException;
	
	public void updateVocStatus(VocManageVO vocManageVO) throws SQLException;
	
	
}
