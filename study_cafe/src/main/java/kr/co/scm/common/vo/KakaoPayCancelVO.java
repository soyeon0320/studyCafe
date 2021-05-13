package kr.co.scm.common.vo;

import kr.co.scm.rent.vo.RentStudyRoomVO;

public class KakaoPayCancelVO {
	
	private String cid;
	private String tid;
	private int cancel_amount;
	private int cancel_tax_free_amount;
	
	public KakaoPayCancelVO() {
		this.cid = "TC0ONETIME";
	}
	
	
	
	public KakaoPayCancelVO(RentStudyRoomVO rentVO) {
		this.cid = "TC0ONETIME";
		this.tid = rentVO.getStudyroomTid();
		this.cancel_amount = rentVO.getStudyroomTotalPrice();
		this.cancel_tax_free_amount = rentVO.getStudyroomTotalPrice()/10;
	}



	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public int getCancel_amount() {
		return cancel_amount;
	}
	public void setCancel_amount(int cancel_amount) {
		this.cancel_amount = cancel_amount;
	}
	public int getCancel_tax_free_amount() {
		return cancel_tax_free_amount;
	}
	public void setCancel_tax_free_amount(int cancel_tax_free_amount) {
		this.cancel_tax_free_amount = cancel_tax_free_amount;
	}
	
	
	
	
}
