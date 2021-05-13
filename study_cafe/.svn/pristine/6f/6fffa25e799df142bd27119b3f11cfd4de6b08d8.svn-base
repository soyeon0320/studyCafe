package kr.co.scm.board.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.base.vo.BaseVO;

public class ReplyVO extends BaseVO{
	private String replyTable;
	private String boardTable;
	private String noColumnName;
	private int boardNo;
	// 댓글 공통화 작업
	
	private int freeNo;
	private int studygroupNo;
	private int infoNo;
	
	private String replyContent;
	private int replyNo;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date replyRegDate;
	private String memId;
	
	private String replyModifyContent;
	
	public int getFreeNo() {
		return freeNo;
	}
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
		setBoardNo(freeNo);
	}
	public int getStudygroupNo() {
		return studygroupNo;
	}
	public void setStudygroupNo(int studygroupNo) {
		this.studygroupNo = studygroupNo;
		setBoardNo(studygroupNo);
	}
	public int getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
		setBoardNo(infoNo);
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public Date getReplyRegDate() {
		return replyRegDate;
	}
	public void setReplyRegDate(Date replyRegDate) {
		this.replyRegDate = replyRegDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getReplyTable() {
		return replyTable;
	}
	public void setReplyTable(String[] tableName) {
		this.replyTable = "TB_BOARD_"+tableName[0].toUpperCase()+"_REPLY";
		setBoardTable("TB_BOARD_"+tableName[0].toUpperCase());
		setNoColumnName(tableName[0].toUpperCase()+"_NO");
	}
	public String getReplyModifyContent() {
		return replyModifyContent;
	}
	public void setReplyModifyContent(String replyModifyContent) {
		this.replyModifyContent = replyModifyContent;
	}
	
	public String getBoardTable() {
		return boardTable;
	}
	
	public void setBoardTable(String boardTable) {
		this.boardTable = boardTable;
	}
	public String getNoColumnName() {
		return noColumnName;
	}
	public void setNoColumnName(String noColumnName) {
		this.noColumnName = noColumnName;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	
	
}
