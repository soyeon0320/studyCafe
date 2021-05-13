package kr.co.scm.board.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.base.vo.BaseVO;

public class InfoVO extends BaseVO{

	private int infoNo; //게시판 번호
	private String infoTitle; // 게시판제목
	private String infoContent; //게시판 내용
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date infoRegDate; // 작성일자
	
	private int infoCnt; // 조회수
	private String memId; // 회원아이디
	private String memName; // 회원아이디
	private int replyCnt;
	private int attachNo;
	private List<AttachVO> attachList; 
	

	public List<AttachVO> getAttachList() {
		return attachList;
	}


	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public int getInfoNo() {
		return infoNo;
	}


	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}


	public String getInfoTitle() {
		return infoTitle;
	}


	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}


	public String getInfoContent() {
		return infoContent;
	}
	
	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}


	public Date getInfoRegDate() {
		return infoRegDate;
	}


	public void setInfoRegDate(Date infoRegDate) {
		this.infoRegDate = infoRegDate;
	}


	public int getInfoCnt() {
		return infoCnt;
	}


	public void setInfoCnt(int infoCnt) {
		this.infoCnt = infoCnt;
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


	public int getAttachNo() {
		return attachNo;
	}


	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}
	
	
	
}
