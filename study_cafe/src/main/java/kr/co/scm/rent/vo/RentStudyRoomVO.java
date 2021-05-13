package kr.co.scm.rent.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.store.vo.StudyRoomVO;

public class RentStudyRoomVO extends StudyRoomVO{
	private int studyroomReservNo;
	private String memId;
	private int studyroomTotalPrice;
	private Date studyroomReservStart;
	private Date studyroomOut;
	private Date studyroomIn;
	private Date studyroomReservEnd;
	private Date studyroomReservDate;
	private int studyroomNo;
	private String studyroomTid;
	private String memName;
	private int flag;
	private int studyroomOccufied;
	private int overTime;
	
	private int strStudyroomReservStart;
	private int strStudyroomReservEnd;
	
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date searchReservEnd;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date searchReservStart;
	
	public RentStudyRoomVO() {
	}
	
	public RentStudyRoomVO(int rentNo) {
		this.studyroomReservNo = rentNo;
	}
	
	public int getStrStudyroomReservStart() {
		return strStudyroomReservStart;
	}
	public void setStrStudyroomReservStart(int strStudyroomReservStart) {
		this.strStudyroomReservStart = strStudyroomReservStart;
	}
	public int getStrStudyroomReservEnd() {
		return strStudyroomReservEnd;
	}
	public void setStrStudyroomReservEnd(int strStudyroomReservEnd) {
		this.strStudyroomReservEnd = strStudyroomReservEnd;
	}
	
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getStudyroomReservNo() {
		return studyroomReservNo;
	}
	public void setStudyroomReservNo(int studyroomReservNo) {
		this.studyroomReservNo = studyroomReservNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getStudyroomTotalPrice() {
		return studyroomTotalPrice;
	}
	public void setStudyroomTotalPrice(int studyroomTotalPrice) {
		this.studyroomTotalPrice = studyroomTotalPrice;
	}
	public Date getStudyroomReservStart() {
		return studyroomReservStart;
	}
	public void setStudyroomReservStart(Date studyroomReservStart) {
		this.studyroomReservStart = studyroomReservStart;
	}
	public Date getStudyroomOut() {
		return studyroomOut;
	}
	public void setStudyroomOut(Date studyroomOut) {
		this.studyroomOut = studyroomOut;
	}
	public Date getStudyroomIn() {
		return studyroomIn;
	}
	public void setStudyroomIn(Date studyroomIn) {
		this.studyroomIn = studyroomIn;
	}
	public Date getStudyroomReservEnd() {
		return studyroomReservEnd;
	}
	public void setStudyroomReservEnd(Date studyroomReservEnd) {
		this.studyroomReservEnd = studyroomReservEnd;
	}
	public Date getStudyroomReservDate() {
		return studyroomReservDate;
	}
	public void setStudyroomReservDate(Date studyroomReservDate) {
		this.studyroomReservDate = studyroomReservDate;
	}
	public int getStudyroomNo() {
		return studyroomNo;
	}
	public void setStudyroomNo(int studyroomNo) {
		this.studyroomNo = studyroomNo;
	}
	public String getStudyroomTid() {
		return studyroomTid;
	}
	public void setStudyroomTid(String studyroomTid) {
		this.studyroomTid = studyroomTid;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getStudyroomOccufied() {
		return studyroomOccufied;
	}
	public void setStudyroomOccufied(int studyroomOccufied) {
		this.studyroomOccufied = studyroomOccufied;
	}
	public int getOverTime() {
		return overTime;
	}
	public void setOverTime(int overTime) {
		this.overTime = overTime;
	}
	public Date getSearchReservEnd() {
		return searchReservEnd;
	}
	public Date getSearchReservStart() {
		return searchReservStart;
	}
	public void setSearchReservEnd(Date searchReservEnd) {
		this.searchReservEnd = searchReservEnd;
	}
	public void setSearchReservStart(Date searchReservStart) {
		this.searchReservStart = searchReservStart;
	}
	
}
