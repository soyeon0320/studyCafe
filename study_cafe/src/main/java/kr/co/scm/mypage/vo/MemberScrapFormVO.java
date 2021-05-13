package kr.co.scm.mypage.vo;

import kr.co.scm.base.vo.BaseVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.user.vo.StoreScrapVO;

public class MemberScrapFormVO extends BaseVO{
	private String tabType;
	
	private StoreScrapVO storeScrapVO;
	private StoreScrapVO searchStoreScrapVO;
	
	private BoardVO boardVO;
	private BoardVO searchBoardVO;
	
	private InfoVO infoVO;
	private InfoVO searchInfoVO;
	
	private StudygroupVO studygroupVO;
	private StudygroupVO searchStudygroupVO;
	
	public MemberScrapFormVO() {
		this.storeScrapVO = new StoreScrapVO();
		this.searchStoreScrapVO = new StoreScrapVO();
		
		this.boardVO = new BoardVO();
		this.searchBoardVO = new BoardVO();
		
		this.infoVO = new InfoVO();
		this.searchInfoVO = new InfoVO();
		
		this.studygroupVO = new StudygroupVO();
		this.searchStudygroupVO = new StudygroupVO();
	}

	public String getTabType() {
		return tabType;
	}

	
	public StoreScrapVO getStoreScrapVO() {
		return storeScrapVO;
	}

	public void setStoreScrapVO(StoreScrapVO storeScrapVO) {
		this.storeScrapVO = storeScrapVO;
	}

	public StoreScrapVO getSearchStoreScrapVO() {
		return searchStoreScrapVO;
	}

	public void setSearchStoreScrapVO(StoreScrapVO searchStoreScrapVO) {
		this.searchStoreScrapVO = searchStoreScrapVO;
	}

	public void setTabType(String tabType) {
		this.tabType = tabType;
	}

	public BoardVO getBoardVO() {
		return boardVO;
	}

	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}

	public BoardVO getSearchBoardVO() {
		return searchBoardVO;
	}

	public void setSearchBoardVO(BoardVO searchBoardVO) {
		this.searchBoardVO = searchBoardVO;
	}

	public InfoVO getInfoVO() {
		return infoVO;
	}

	public void setInfoVO(InfoVO infoVO) {
		this.infoVO = infoVO;
	}

	public InfoVO getSearchInfoVO() {
		return searchInfoVO;
	}

	public void setSearchInfoVO(InfoVO searchInfoVO) {
		this.searchInfoVO = searchInfoVO;
	}

	public StudygroupVO getStudygroupVO() {
		return studygroupVO;
	}

	public void setStudygroupVO(StudygroupVO studygroupVO) {
		this.studygroupVO = studygroupVO;
	}

	public StudygroupVO getSearchStudygroupVO() {
		return searchStudygroupVO;
	}

	public void setSearchStudygroupVO(StudygroupVO searchStudygroupVO) {
		this.searchStudygroupVO = searchStudygroupVO;
	}
	
	
	
	
}
