package kr.co.scm.admin.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.base.vo.BaseVO;

public class MailSendVO extends BaseVO{

	private int mailNo;
	private String mailTitle;
	private String adminId;
	private String adminEmail;
	private String mailContent;
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date mailRegDate; // 작성일자

	
	

	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public Date getMailRegDate() {
		return mailRegDate;
	}
	public void setMailRegDate(Date mailRegDate) {
		this.mailRegDate = mailRegDate;
	}
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	
	
	
	
	
}
