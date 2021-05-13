package kr.co.scm.board.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;

@Mapper("boardMapper")
public interface BoardMapper {
	public List<BoardVO> getBoardList(BoardVO boardVO) throws SQLException;
	
	public int getBoardListCount(BoardVO boardVO) throws SQLException;
	
	public void increaseViewCount(BoardVO boardVO) throws SQLException;
	
	public void regist(BoardVO boardVO) throws SQLException;
	
	public BoardVO detail(BoardVO boardVO) throws SQLException;
	
	public void modify(BoardVO boardVO) throws SQLException;
	
	public void remove(BoardVO boardVO) throws SQLException;

	public void insertBoardScrap(BoardScrapVO boardScrapVO) throws SQLException;

	public int selectBoardScrapCount(BoardScrapVO boardScrapVO) throws SQLException;

	public void removeBoardScrap(BoardScrapVO boardScrapVO) throws SQLException;
}
