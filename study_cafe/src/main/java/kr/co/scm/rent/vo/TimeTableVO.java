package kr.co.scm.rent.vo;

import java.util.Date;
import java.util.concurrent.TimeUnit;

public class TimeTableVO {
	
	private int useYn;
	private int time24;

	
	private Date pickDate;
	
	private int studyroomNo;
	
	
	public int getUseYn() {
		return useYn;
	}
	public void setUseYn(int useYn) {
		this.useYn = useYn;
	}
	public int getTime24() {
		return time24;
	}
	public void setTime24(int time24) {
		this.time24 = time24;
	}
	public Date getPickDate() {
		return pickDate;
	}
	public void setPickDate(String pickDate) {
		this.pickDate = new Date(Long.parseLong(pickDate)-TimeUnit.HOURS.toMillis(9));
	}
	public int getStudyroomNo() {
		return studyroomNo;
	}
	public void setStudyroomNo(int studyroomNo) {
		this.studyroomNo = studyroomNo;
	}
	
}
