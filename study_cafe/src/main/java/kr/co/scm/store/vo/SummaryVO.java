package kr.co.scm.store.vo;

import java.util.Date;

import kr.co.scm.base.vo.BaseVO;

public class SummaryVO extends BaseVO implements Comparable<SummaryVO>{
	
	private int equipUseCnt;
	private int vocCnt;
	private int reviewCnt;
	private long sales;
	private Date day;
	private int usingCnt;
	
	public int getEquipUseCnt() {
		return equipUseCnt;
	}
	public int getVocCnt() {
		return vocCnt;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public long getSales() {
		return sales;
	}
	public Date getDay() {
		return day;
	}
	public int getUsingCnt() {
		return usingCnt;
	}
	public void setEquipUseCnt(int equipUseCnt) {
		this.equipUseCnt = equipUseCnt;
	}
	public void setVocCnt(int vocCnt) {
		this.vocCnt = vocCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public void setSales(long sales) {
		this.sales = sales;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public void setUsingCnt(int usingCnt) {
		this.usingCnt = usingCnt;
	}
	
	@Override
	public int compareTo(SummaryVO o) {
		return this.getDay().compareTo(o.getDay());
	}
}
