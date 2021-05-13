package kr.co.scm.mypage.vo;

import kr.co.scm.base.vo.BaseVO;

public class MemberReviewFormVO extends BaseVO {
	
	private StudyRoomReviewsVO studyRoomReviewsVO;
	private StudyRoomReviewsVO searchStudyRoomReviewsVO;
	
	private SeatReviewsVO seatReviewsVO;
	private SeatReviewsVO searchSeatReviewsVO;
	
	private String tabType;
	
	public MemberReviewFormVO() {
		this.studyRoomReviewsVO = new StudyRoomReviewsVO();
		this.searchStudyRoomReviewsVO = new StudyRoomReviewsVO();
		
		this.seatReviewsVO = new SeatReviewsVO();
		this.searchSeatReviewsVO = new SeatReviewsVO();
	}

	public StudyRoomReviewsVO getStudyRoomReviewsVO() {
		return studyRoomReviewsVO;
	}

	public void setStudyRoomReviewsVO(StudyRoomReviewsVO studyRoomReviewsVO) {
		this.studyRoomReviewsVO = studyRoomReviewsVO;
	}

	public StudyRoomReviewsVO getSearchStudyRoomReviewsVO() {
		return searchStudyRoomReviewsVO;
	}

	public void setSearchStudyRoomReviewsVO(StudyRoomReviewsVO searchStudyRoomReviewsVO) {
		this.searchStudyRoomReviewsVO = searchStudyRoomReviewsVO;
	}

	public SeatReviewsVO getSeatReviewsVO() {
		return seatReviewsVO;
	}

	public void setSeatReviewsVO(SeatReviewsVO seatReviewsVO) {
		this.seatReviewsVO = seatReviewsVO;
	}

	public SeatReviewsVO getSearchSeatReviewsVO() {
		return searchSeatReviewsVO;
	}

	public void setSearchSeatReviewsVO(SeatReviewsVO searchSeatReviewsVO) {
		this.searchSeatReviewsVO = searchSeatReviewsVO;
	}

	public String getTabType() {
		return tabType;
	}

	public void setTabType(String tabType) {
		this.tabType = tabType;
	}
	
	
}
