package kr.co.scm.board.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.InfoScrapVO;
import kr.co.scm.board.vo.InfoVO;

@Mapper("infoMapper")
public interface InfoMapper {

	
	public List<InfoVO> retrievePagingList(InfoVO vo) throws Exception;
	
	public int retrievePagingListCount(InfoVO vo);
	
	
	////////////////////////////////////////////////////////////
	
	
	public InfoVO selectInfoBoardByInfoNo(InfoVO info) throws SQLException;
	
	public void insertInfoBoard(InfoVO info) throws SQLException;
	
	public void updateInfoBoard(InfoVO info) throws SQLException;
	
	public void deleteInfoBoard(InfoVO info) throws SQLException;
	
	public void increaseViewCount(InfoVO info) throws SQLException;

	public int selectInfoScrapCount(InfoScrapVO infoScrapVO) throws SQLException;

	public void insertInfoScrap(InfoScrapVO infoScrapVO) throws SQLException;

	public void removeInfoScrap(InfoScrapVO infoScrapVO) throws SQLException;
	
}
