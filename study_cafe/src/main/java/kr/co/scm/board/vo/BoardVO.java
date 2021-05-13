package kr.co.scm.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.base.vo.BaseVO;

public class BoardVO extends BaseVO{
	private int freeNo;
	private String freeTitle;
	private String freeContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date freeRegDate;
	private int freeCnt;
	private String memId;
	private int replyCnt;
	
	public int getFreeNo() {
		return freeNo;
	}
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}
	public String getFreeTitle() {
		return freeTitle;
	}
	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}
	public String getFreeContent() {
		return freeContent;
	}
	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}
	public Date getFreeRegDate() {
		return freeRegDate;
	}
	public void setFreeRegDate(Date freeRegDate) {
		this.freeRegDate = freeRegDate;
	}
	public int getFreeCnt() {
		return freeCnt;
	}
	public void setFreeCnt(int freeCnt) {
		this.freeCnt = freeCnt;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	
}
