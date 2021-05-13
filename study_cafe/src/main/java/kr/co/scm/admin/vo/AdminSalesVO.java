package kr.co.scm.admin.vo;

import java.util.Date;

public class AdminSalesVO {
	
	private Date period;
	private String periodByFormat;
	
	private long ticketSales;
	private long prodSales;
	
	private int seatUse;
	private int studyroomUse;
	private int equipUse;
	
	public Date getPeriod() {
		return period;
	}
	public void setPeriod(Date period) {
		this.period = period;
	}
	public String getPeriodByFormat() {
		return periodByFormat;
	}
	public void setPeriodByFormat(String periodByFormat) {
		this.periodByFormat = periodByFormat;
	}
	public long getTicketSales() {
		return ticketSales;
	}
	public void setTicketSales(long ticketSales) {
		this.ticketSales = ticketSales;
	}
	public long getProdSales() {
		return prodSales;
	}
	public void setProdSales(long prodSales) {
		this.prodSales = prodSales;
	}
	public int getSeatUse() {
		return seatUse;
	}
	public void setSeatUse(int seatUse) {
		this.seatUse = seatUse;
	}
	public int getStudyroomUse() {
		return studyroomUse;
	}
	public void setStudyroomUse(int studyroomUse) {
		this.studyroomUse = studyroomUse;
	}
	public int getEquipUse() {
		return equipUse;
	}
	public void setEquipUse(int equipUse) {
		this.equipUse = equipUse;
	}
	
	
	
	
}
