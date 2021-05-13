package kr.co.scm.rent.vo;

import java.util.Date;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;

import com.itextpdf.io.util.DateTimeUtil;

import kr.co.scm.store.vo.SeatVO;

public class RentSeatVO extends SeatVO{
	
	private int seatNo;
	private Date seatIn;
	private Date seatOut;
	private int rentSeatNo;
	private int seatTotalTime;
	private String memId;
	private String memName;
	private String storeCode;
	private String goingOut;
	private int flag;
	
	private String seatDate;	// 엑셀다운로드에 보여줄 날짜 형식을 위한 변수
	private int curSeatTime;    // 현재 사용자가 이용중인 시간을 나타내기 위한 변수
	
	private int ticketNo;
	private int ticketPrice;
	private String ticketName;
	
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public int getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public String getTicketName() {
		return ticketName;
	}
	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}
	public String getSeatDate() {
		return seatDate;
	}
	public void setSeatDate(String seatDate) {
		this.seatDate = seatDate;
	}
	public Date getSeatIn() {
		return seatIn;
	}
	public void setSeatIn(Date seatIn) {
		this.seatIn = seatIn;
	}
	public Date getSeatOut() {
		return seatOut;
	}
	public void setSeatOut(Date seatOut) {
		this.seatOut = seatOut;
	}
	public int getRentSeatNo() {
		return rentSeatNo;
	}
	public void setRentSeatNo(int rentSeatNo) {
		this.rentSeatNo = rentSeatNo;
	}
	public int getSeatTotalTime() {
		return seatTotalTime;
	}
	public void setSeatTotalTime(int seatTotalTime) {
		this.seatTotalTime = seatTotalTime;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getGoingOut() {
		return goingOut;
	}
	public void setGoingOut(String goingOut) {
		this.goingOut = goingOut;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getCurSeatTime() {
		return curSeatTime;
	}
	public void setCurSeatTime(int curSeatTime) {
		this.curSeatTime = curSeatTime;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	
	public int calcSeatTotalTime() {
		int var = (int)((new Date().getTime() - this.seatIn.getTime())/DateUtils.MILLIS_PER_MINUTE);
		return var;
	}
	
}
