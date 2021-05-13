package kr.co.scm.board.vo;

import java.util.Date;

public class NoticeVO_my {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegDate;
	private int noticeCnt;
	private String adminId;
	private Date noticeStart;
	private Date noticeEnd;
	private int noticePriority;
	
	public NoticeVO_my() {}
	public NoticeVO_my(int noticeNo, String noticeTitle, String noticeContent, Date noticeRegDate, int noticeCnt,
			String adminId, Date noticeStart, Date noticeEnd, int noticePriority) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeRegDate = noticeRegDate;
		this.noticeCnt = noticeCnt;
		this.adminId = adminId;
		this.noticeStart = noticeStart;
		this.noticeEnd = noticeEnd;
		this.noticePriority = noticePriority;
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeRegDate() {
		return noticeRegDate;
	}
	public void setNoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	public int getNoticeCnt() {
		return noticeCnt;
	}
	public void setNoticeCnt(int noticeCnt) {
		this.noticeCnt = noticeCnt;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public Date getNoticeStart() {
		return noticeStart;
	}
	public void setNoticeStart(Date noticeStart) {
		this.noticeStart = noticeStart;
	}
	public Date getNoticeEnd() {
		return noticeEnd;
	}
	public void setNoticeEnd(Date noticeEnd) {
		this.noticeEnd = noticeEnd;
	}
	public int getNoticePriority() {
		return noticePriority;
	}
	public void setNoticePriority(int noticePriority) {
		this.noticePriority = noticePriority;
	}
	
	
}
