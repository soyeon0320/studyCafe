package kr.co.scm.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.board.dao.BoardMapper;
import kr.co.scm.board.vo.BoardFormVO;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.command.PageMaker;
import kr.co.scm.command.SearchCriteria;

@Service("boardService")
public class BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardVO> getBoardList(BoardVO boardVO) throws SQLException {
		List<BoardVO> boardList = boardMapper.getBoardList(boardVO);
		return boardList;
	}
	
	public int getBoardListCount(BoardVO boardVO) throws SQLException {
		int totalCount = boardMapper.getBoardListCount(boardVO);
		return totalCount;
	}
	
	public void increaseViewCount(BoardVO boardVO) throws SQLException {
		boardMapper.increaseViewCount(boardVO);
	}
	
	public void regist(BoardVO boardVO) throws SQLException {
		boardMapper.regist(boardVO);
	}

	public BoardVO detail(BoardVO boardVO) throws SQLException {
		boolean isModified = boardVO.isModified();
		
		boardVO = boardMapper.detail(boardVO);
		
		if(!isModified) {
			boardMapper.increaseViewCount(boardVO);
			boardVO.setFreeCnt(boardVO.getFreeCnt()+1);
		}
		
		return boardVO;
	}

	public void modify(BoardVO boardVO) throws SQLException {
		boardMapper.modify(boardVO);
	}

	public void remove(BoardVO boardVO) throws SQLException {
		boardMapper.remove(boardVO);
	}

	public int getBoardScrapCount(BoardScrapVO boardScrapVO) throws SQLException {
		int boardScrapCount = boardMapper.selectBoardScrapCount(boardScrapVO);
		return boardScrapCount;
	}
	
	public void scrapRegist(BoardScrapVO boardScrapVO) throws SQLException {
		boardMapper.insertBoardScrap(boardScrapVO);
	}

	public void scrapRemove(BoardScrapVO boardScrapVO) throws SQLException {
		boardMapper.removeBoardScrap(boardScrapVO);
	}

}
