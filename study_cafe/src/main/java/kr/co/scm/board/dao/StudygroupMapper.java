package kr.co.scm.board.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.StudygroupScrapVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.command.SearchCriteria;

@Mapper("studygroupMapper")
public interface StudygroupMapper {
	
	public List<StudygroupVO> getAllStgList() throws SQLException;

	public List<StudygroupVO> getRecruitTime() throws SQLException;
	
	public void chRcStatus()throws SQLException;
	
	public void insertSgb(StudygroupVO sgv)throws SQLException;
	
	public void increaseViewCnt(StudygroupVO studygroupVO)throws SQLException;
	
	public StudygroupVO getStudygroupNo(StudygroupVO studygroupVO)throws SQLException;
	
	public List<StudygroupVO> selectSearchStudyList(SearchCriteria cri)throws SQLException;
	
	public int selectStudyCriteriaTotalCount(SearchCriteria cri)throws SQLException;
	
	public void updateModify(StudygroupVO studygroupVO)throws SQLException;

	public void deleteStudygroup(StudygroupVO studygroupVO)throws SQLException;

	public List<StudygroupVO> studygroupPagingList(StudygroupVO searchStudygroupVO);

	public int searchStudygroupPagingListCount(StudygroupVO searchStudygroupVO);

	public int selectStudyGroupScrapCount(StudygroupVO studygroupVO) throws SQLException;

	public void insertStudyGroupScrap(StudygroupScrapVO studygroupScrapVO) throws SQLException;

	public void removeStudyGroupScrap(StudygroupScrapVO studygroupScrapVO) throws SQLException;

}
