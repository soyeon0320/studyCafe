package kr.co.scm.mypage.vo;

import java.util.Date;

import kr.co.scm.rent.vo.RentSeatVO;

public class SeatReviewsVO extends RentSeatVO{
	
	private int seatReviewsNo; 
	private String seatReviewsContent;
	private float seatGrade;
	private Date seatReviewsRegDate;
	
	public int getSeatReviewsNo() {
		return seatReviewsNo;
	}
	public void setSeatReviewsNo(int seatReviewsNo) {
		this.seatReviewsNo = seatReviewsNo;
	}
	public String getSeatReviewsContent() {
		return seatReviewsContent;
	}
	public void setSeatReviewsContent(String seatReviewsContent) {
		this.seatReviewsContent = seatReviewsContent;
	}
	
	public float getSeatGrade() {
		return seatGrade;
	}
	public void setSeatGrade(float seatGrade) {
		this.seatGrade = seatGrade;
	}
	public Date getSeatReviewsRegDate() {
		return seatReviewsRegDate;
	}
	public void setSeatReviewsRegDate(Date seatReviewsRegDate) {
		this.seatReviewsRegDate = seatReviewsRegDate;
	}
	
}
