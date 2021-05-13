package kr.co.scm.board.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.VocVO;
import kr.co.scm.exception.vo.ErrorLogVO;

@Mapper("vocMapper")
public interface VocMapper {

	public List<VocVO> selectVocList(VocVO searchVocVO) throws SQLException;

	public void insertVoc(VocVO voc) throws SQLException;

	public VocVO selectVocByVocNo(VocVO vocVO) throws SQLException;

	public int selectSearchListCnt(VocVO searchVocVO)  throws SQLException;

	public void insertErrorLog(ErrorLogVO logVO);

	
	
	
	
	
	public List<VocVO> selectAllVocPagingList(VocVO vocVO) throws SQLException;
	public List<VocVO> selectStatusCnt(VocVO vocVO) throws SQLException;
	public int selectAllVocPagingListCount(VocVO vocVO) throws SQLException;
	
	
}
