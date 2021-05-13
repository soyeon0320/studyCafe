package kr.co.scm.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.base.vo.BaseVO;

public class StudygroupVO extends BaseVO{
	
	private int studygroupNo;
	private String studygroupTitle;
	private String studygroupContent;
	private Date studygroupRegDate;
	private int studygroupCnt;
	private String memId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date studygroupEnd;
	private String recruitStatus;
	private int replyCnt;
	
	
	public int getStudygroupNo() {
		return studygroupNo;
	}
	public void setStudygroupNo(int studygroupNo) {
		this.studygroupNo = studygroupNo;
	}
	public String getStudygroupTitle() {
		return studygroupTitle;
	}
	public void setStudygroupTitle(String studygroupTitle) {
		this.studygroupTitle = studygroupTitle;
	}
	public String getStudygroupContent() {
		return studygroupContent;
	}
	public void setStudygroupContent(String studygroupContent) {
		this.studygroupContent = studygroupContent;
	}
	
	public Date getStudygroupRegDate() {
		return studygroupRegDate;
	}
	public void setStudygroupRegDate(Date studygroupRegDate) {
		this.studygroupRegDate = studygroupRegDate;
	}
	public int getStudygroupCnt() {
		return studygroupCnt;
	}
	public void setStudygroupCnt(int studygroupCnt) {
		this.studygroupCnt = studygroupCnt;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getStudygroupEnd() {
		return studygroupEnd;
	}
	public void setStudygroupEnd(Date studygroupEnd) {
		this.studygroupEnd = studygroupEnd;
	}
	public String getRecruitStatus() {
		return recruitStatus;
	}
	public void setRecruitStatus(String recruitStatus) {
		this.recruitStatus = recruitStatus;
	}
	
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	
}
