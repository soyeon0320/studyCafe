package kr.co.scm.board.vo;

import java.util.Date;

public class AttachVO {

	private int attachNo;
	private String attachName;
	private String attachOriginName;
	private String attachCours;
	private String attachExtsn;
	private Date attachRegDate;
	private int attachCount;
	
	public int getAttachNo() {
		return attachNo;
	}
	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}
	public String getAttachName() {
		return attachName;
	}
	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}
	public String getAttachOriginName() {
		return attachOriginName;
	}
	public void setAttachOriginName(String attachOriginName) {
		this.attachOriginName = attachOriginName;
	}
	public String getAttachCours() {
		return attachCours;
	}
	public void setAttachCours(String attachCours) {
		this.attachCours = attachCours;
	}
	public String getAttachExtsn() {
		return attachExtsn;
	}
	public void setAttachExtsn(String attachExtsn) {
		this.attachExtsn = attachExtsn;
	}
	public Date getAttachRegDate() {
		return attachRegDate;
	}
	public void setAttachRegDate(Date attachRegDate) {
		this.attachRegDate = attachRegDate;
	}
	public int getAttachCount() {
		return attachCount;
	}
	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}
	
}
