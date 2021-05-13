package kr.co.scm.board.vo;

import kr.co.scm.base.vo.BaseVO;

public class BoardScrapVO extends BaseVO{
	private int freeNo;
	private String memId;
	
	public int getFreeNo() {
		return freeNo;
	}
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	
}
