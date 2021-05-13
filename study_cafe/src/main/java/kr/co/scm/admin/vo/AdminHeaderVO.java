package kr.co.scm.admin.vo;

import kr.co.scm.base.vo.BaseVO;

public class AdminHeaderVO extends BaseVO{

	private int contractCnt;
	private int orderCnt;
	private int vocCnt;
	private int memberCnt;
	public int getContractCnt() {
		return contractCnt;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public int getVocCnt() {
		return vocCnt;
	}
	public int getMemberCnt() {
		return memberCnt;
	}
	public void setContractCnt(int contractCnt) {
		this.contractCnt = contractCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	public void setVocCnt(int vocCnt) {
		this.vocCnt = vocCnt;
	}
	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}
	
}
