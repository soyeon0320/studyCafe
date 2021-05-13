package kr.co.scm.rent.vo;

import java.util.Date;

public class TicketBuyVO extends TicketVO{

	private Date ticketBuyDate;
	private int ticketBuyNo;
	private int ticketNo;
	private String memId;
	private int ticketTimeRemain;
	private Date ticketExpireDate;
	
	public Date getTicketBuyDate() {
		return ticketBuyDate;
	}
	public void setTicketBuyDate(Date ticketBuyDate) {
		this.ticketBuyDate = ticketBuyDate;
	}
	public int getTicketBuyNo() {
		return ticketBuyNo;
	}
	public void setTicketBuyNo(int ticketBuyNo) {
		this.ticketBuyNo = ticketBuyNo;
	}
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getTicketTimeRemain() {
		return ticketTimeRemain;
	}
	public void setTicketTimeRemain(int ticketTimeRemain) {
		this.ticketTimeRemain = ticketTimeRemain;
	}
	public Date getTicketExpireDate() {
		return ticketExpireDate;
	}
	public void setTicketExpireDate(Date ticketExpireDate) {
		this.ticketExpireDate = ticketExpireDate;
	}
	
	
	
}
