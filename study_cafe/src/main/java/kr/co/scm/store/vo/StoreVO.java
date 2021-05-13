package kr.co.scm.store.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.base.vo.BaseVO;

public class StoreVO extends BaseVO {
	
	public static final int STORE_WIDTH = 14;
	public static final int STORE_HEIGHT = 14;
	
	private String storeCode;
	private String storeName;
	private int storeWidth;
	private int storeHeight;
	private String usingGuide;
	private String storeStatus;
	private int storeTotalSeat;
	private String storeContractStatus;
	private String storeAddr;
	private double storeMapX;
	private double storeMapY;
	private String storeSeatMap;
	private String storePhone;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date contractPermitDate;
	
	private float storeGrade;
	private int storeScrapCnt;
	private int newReserv;
	
	private String storeImageUrl;
	private String storeCid;
	
	private int studyroomCnt;
	private int useCnt;
	
	private int storeCurrentRoom;
	private int storeTotalRoom;
	private int storeCurrentSeat;
	private int storeLocatedSeat;
	
	
	
	public StoreVO() {
	}
	public StoreVO(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getUsingGuide() {
		return usingGuide;
	}
	public void setUsingGuide(String usingGuide) {
		this.usingGuide = usingGuide;
	}
	public String getStoreStatus() {
		return storeStatus;
	}
	public void setStoreStatus(String storeStatus) {
		this.storeStatus = storeStatus;
	}
	public int getStoreTotalSeat() {
		return storeTotalSeat;
	}
	public void setStoreTotalSeat(int storeTotalSeat) {
		this.storeTotalSeat = storeTotalSeat;
	}
	public String getStoreContractStatus() {
		return storeContractStatus;
	}
	public void setStoreContractStatus(String storeContractStatus) {
		this.storeContractStatus = storeContractStatus;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public double getStoreMapX() {
		return storeMapX;
	}
	public void setStoreMapX(double storeMapX) {
		this.storeMapX = storeMapX;
	}
	public double getStoreMapY() {
		return storeMapY;
	}
	public void setStoreMapY(double storeMapY) {
		this.storeMapY = storeMapY;
	}
	public String getStoreSeatMap() {
		return storeSeatMap;
	}
	public void setStoreSeatMap(String storeSeatMap) {
		this.storeSeatMap = storeSeatMap;
	}
	public String getStorePhone() {
		return storePhone;
	}
	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}
	public int getSTORE_WIDTH() {
		return STORE_WIDTH;
	}
	public int getSTORE_HEIGHT() {
		return STORE_HEIGHT;
	}
	public Date getContractPermitDate() {
		return contractPermitDate;
	}
	public void setContractPermitDate(Date contractPermitDate) {
		this.contractPermitDate = contractPermitDate;
	}
	public float getStoreGrade() {
		return storeGrade;
	}
	public void setStoreGrade(float storeGrade) {
		this.storeGrade = storeGrade;
	}
	public int getStoreWidth() {
		return storeWidth;
	}
	public int getStoreHeight() {
		return storeHeight;
	}
	public void setStoreWidth(int storeWidth) {
		this.storeWidth = storeWidth;
	}
	public void setStoreHeight(int storeHeight) {
		this.storeHeight = storeHeight;
	}
	public int getStoreScrapCnt() {
		return storeScrapCnt;
	}
	public void setStoreScrapCnt(int storeScrapCnt) {
		this.storeScrapCnt = storeScrapCnt;
	}
	public int getNewReserv() {
		return newReserv;
	}
	public void setNewReserv(int newReserv) {
		this.newReserv = newReserv;
	}
	public String getStoreImageUrl() {
		return storeImageUrl;
	}
	public void setStoreImageUrl(String storeImageUrl) {
		this.storeImageUrl = storeImageUrl;
	}
	public String getStoreCid() {
		return storeCid;
	}
	public void setStoreCid(String storeCid) {
		this.storeCid = storeCid;
	}
	public int getStudyroomCnt() {
		return studyroomCnt;
	}
	public void setStudyroomCnt(int studyroomCnt) {
		this.studyroomCnt = studyroomCnt;
	}
	public int getUseCnt() {
		return useCnt;
	}
	public void setUseCnt(int useCnt) {
		this.useCnt = useCnt;
	}
	public int getStoreTotalRoom() {
		return storeTotalRoom;
	}
	public int getStoreCurrentSeat() {
		return storeCurrentSeat;
	}
	public int getStoreLocatedSeat() {
		return storeLocatedSeat;
	}
	public void setStoreTotalRoom(int storeTotalRoom) {
		this.storeTotalRoom = storeTotalRoom;
	}
	public void setStoreCurrentSeat(int storeCurrentSeat) {
		this.storeCurrentSeat = storeCurrentSeat;
	}
	public void setStoreLocatedSeat(int storeLocatedSeat) {
		this.storeLocatedSeat = storeLocatedSeat;
	}
	public int getStoreCurrentRoom() {
		return storeCurrentRoom;
	}
	public void setStoreCurrentRoom(int storeCurrentRoom) {
		this.storeCurrentRoom = storeCurrentRoom;
	}

	

}
