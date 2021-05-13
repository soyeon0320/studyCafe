package kr.co.scm.board.service;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.scm.board.dao.VocManageMapper;
import kr.co.scm.board.vo.VocManageVO;

@Service("vocManageService")
public class VocManageService {

	@Resource(name="vocManageMapper")
	private VocManageMapper vocManageMapper;
	
	public VocManageVO getVocReplyByVocNo(int vocNo) throws SQLException {
		return vocManageMapper.selectVocReplyByVocNo(vocNo);
	}
	
	public VocManageVO getVocReplyByVocReplyNo(VocManageVO vocManageVO) throws SQLException {
		return vocManageMapper.selectVocReplyByVocReplyNo(vocManageVO);
	}
	
	public void registVocReply(VocManageVO vocManageVO) throws SQLException{
		vocManageMapper.insertVocReply(vocManageVO);
		vocManageMapper.updateVocStatus(vocManageVO);
		
	}
	
	public void modifyVocReply(VocManageVO vocManageVO) throws SQLException{
		vocManageMapper.updateVocReply(vocManageVO);
	}
	
	
	
	
	
}
