package kr.co.scm.rent.vo;

import java.util.Date;
import java.util.concurrent.TimeUnit;

import oracle.net.aso.e;

public class StudyRoomRentCommandVO {
	
	private String pickDate;

	private String memId;
	
	private int studyroomReservStart;
	
	private int studyroomReservEnd;
	
	private int studyroomNo;
	
	private int studyroomUsePrice;
	
	private String tid;
	
	public String getPickDate() {
		return pickDate;
	}

	public void setPickDate(String pickDate) {
		this.pickDate = pickDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getStudyroomReservStart() {
		return studyroomReservStart;
	}

	public void setStudyroomReservStart(int studyroomReservStart) {
		this.studyroomReservStart = studyroomReservStart;
	}

	public int getStudyroomReservEnd() {
		return studyroomReservEnd;
	}

	public void setStudyroomReservEnd(int studyroomReservEnd) {
		this.studyroomReservEnd = studyroomReservEnd;
	}

	public int getStudyroomNo() {
		return studyroomNo;
	}

	public void setStudyroomNo(int studyroomNo) {
		this.studyroomNo = studyroomNo;
	}

	public int getStudyroomUsePrice() {
		return studyroomUsePrice;
	}

	public void setStudyroomUsePrice(int studyroomUsePrice) {
		this.studyroomUsePrice = studyroomUsePrice;
	}


	
	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public RentStudyRoomVO toRentStudyRoomVO() {
		RentStudyRoomVO rentVO = new RentStudyRoomVO();
		rentVO.setMemId(this.memId);
		rentVO.setStudyroomNo(this.studyroomNo);
		rentVO.setStudyroomTotalPrice(this.studyroomUsePrice*(this.studyroomReservEnd-this.studyroomReservStart));
		rentVO.setStudyroomReservDate(new Date());
		if (pickDate != null) {
			rentVO.setStudyroomReservStart(new Date(Long.parseLong(pickDate) + TimeUnit.HOURS.toMillis(studyroomReservStart-9)));
			rentVO.setStudyroomReservEnd(new Date(Long.parseLong(pickDate) + TimeUnit.HOURS.toMillis(studyroomReservEnd-9)));
		} else {
			rentVO.setStrStudyroomReservStart(studyroomReservStart);
			rentVO.setStrStudyroomReservEnd(studyroomReservEnd);
		}
		if(this.tid != null) rentVO.setStudyroomTid(tid);
		return rentVO; 
	}
	
	

}
