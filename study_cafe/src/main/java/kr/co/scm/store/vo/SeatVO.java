package kr.co.scm.store.vo;

import kr.co.scm.base.vo.BaseVO;

public class SeatVO extends BaseVO{
	private int seatNo;
	private String storeCode;
	private int seatLocation;
	private String seatUseable;
	private String seatInfo;
	private String seatDirection;
	private int seatOccufied;
	private String storeName;
	
	public int getSeatOccufied() {
		return seatOccufied;
	}
	public void setSeatOccufied(int seatOccufied) {
		this.seatOccufied = seatOccufied;
	}
	public String getSeatInfo() {
		return seatInfo;
	}
	public void setSeatInfo(String seatInfo) {
		this.seatInfo = seatInfo;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public int getSeatLocation() {
		return seatLocation;
	}
	public void setSeatLocation(int seatLocation) {
		this.seatLocation = seatLocation;
	}
	public String getSeatUseable() {
		return seatUseable;
	}
	public void setSeatUseable(String seatUseable) {
		this.seatUseable = seatUseable;
	}
	
	public String getSeatDirection() {
		return seatDirection;
	}
	public void setSeatDirection(String seatDirection) {
		this.seatDirection = seatDirection;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	
	
}
