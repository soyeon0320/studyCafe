package kr.co.scm.mypage.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.board.vo.ReplyVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.mypage.dao.MyPageMapper;
import kr.co.scm.mypage.vo.BuyListVO;
import kr.co.scm.mypage.vo.ReviewVO;
import kr.co.scm.mypage.vo.SeatReviewsVO;
import kr.co.scm.mypage.vo.StudyRoomReviewsVO;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Service("myPageService")
public class MyPageService {
	
	@Resource(name="myPageMapper")
	private MyPageMapper myPageMapper;
	
	public MemberVO getMyInfomation(MemberVO memberVO)throws SQLException {
		return myPageMapper.getMyInfomation(memberVO);
	}
	
	public void myInfoChange(MemberVO memberVO)throws SQLException {
		myPageMapper.myInfoChange(memberVO);
		
	}
	
	// 나의 리뷰목록 가져오기
	public List<StudyRoomReviewsVO> myStudyRoomReview(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException {

		List<StudyRoomReviewsVO> myStudyRoomReview = myPageMapper.myStudyRoomReview(studyRoomReviewsVO);

		return myStudyRoomReview;
	}

	// 나의 구매내역 조회
	public List<BuyListVO> buyList(BuyListVO buyListVO) throws SQLException {

		return myPageMapper.buyList(buyListVO);
	}
	
	public int searchBuyListCount(BuyListVO searchBuyListVO) throws SQLException{
		return myPageMapper.searchBuyListCount(searchBuyListVO);
	}

	public List<BoardVO> freeBoardList(BoardVO boardVO) throws SQLException {

		List<BoardVO> freeBoardList = myPageMapper.freeBoardList(boardVO);

		return freeBoardList;
	}

	public List<InfoVO> infoBoardList(InfoVO infoVO) throws SQLException {

		List<InfoVO> infoBoardList = myPageMapper.infoBoardList(infoVO);

		return infoBoardList;
	}

	public Map<String, Object> stgBoardList() throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<InfoVO> stgBoardList = myPageMapper.stgBoardList();

		dataMap.put("stgBoardList", stgBoardList);

		return dataMap;
	}

	public List<StudygroupVO> studygroupList(StudygroupVO studygroupVO) throws SQLException {

		List<StudygroupVO> studygroupList = myPageMapper.studygroupList(studygroupVO);

		return studygroupList;
	}

	public List<SeatReviewsVO> mySeatReview(SeatReviewsVO seatReviewsVO) throws SQLException {
		return myPageMapper.mySeatReview(seatReviewsVO);
	}

	public StudyRoomReviewsVO studyRoomReviewDetail(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException {

		StudyRoomReviewsVO studyRoomReviewDetail = myPageMapper.studyRoomReviewDetail(studyRoomReviewsVO);

		return studyRoomReviewDetail;
	}

	public SeatReviewsVO seatReviewDetail(SeatReviewsVO seatReviewsVO) throws SQLException {

		SeatReviewsVO seatReviewDetail = myPageMapper.seatReviewDetail(seatReviewsVO);

		return seatReviewDetail;
	}

	public void stduyRoomReviewRegist(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException {

		myPageMapper.studyRoomReviewRegist(studyRoomReviewsVO);
	}
	
	public void seatRegistReview(SeatReviewsVO seatReviewsVO)throws SQLException {
		
		myPageMapper.seatRegistReview(seatReviewsVO);
	}
	public void studyRoomReviewModify(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException {

		myPageMapper.studyRoomReivewModify(studyRoomReviewsVO);
	}

	public void reviewRemove(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException {

		myPageMapper.reviewRemove(studyRoomReviewsVO);
	}

	public void seatReviewModify(SeatReviewsVO seatReviewsVO) throws SQLException {

		myPageMapper.seatReviewModify(seatReviewsVO);
	}

	public void seatReviewRemove(SeatReviewsVO seatReviewsVO) throws SQLException {

		myPageMapper.seatReviewRemove(seatReviewsVO);
	}

	public RentStudyRoomVO getReservStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException {
		return myPageMapper.getReservStudyRoom(rentStudyRoomVO);
	}
	
	public RentSeatVO getRentSeat(RentSeatVO rentSeatVO) throws SQLException {
		return myPageMapper.getRentSeat(rentSeatVO);
	}
	
	public List<BuyListVO> myTicketList(BuyListVO buyListVO) throws SQLException {

		return myPageMapper.myTicketList(buyListVO);
	}

	public List<RentStudyRoomVO> getMyStudyRoomList(RentStudyRoomVO searchRentStudyRoomVO) throws SQLException {
		List<RentStudyRoomVO> myStudyRoomList = myPageMapper.myStudyRoomList(searchRentStudyRoomVO);
		return myStudyRoomList;
	}

	public int getMyStudyRoomListTotalCnt(RentStudyRoomVO searchRentStudyRoomVO) throws SQLException {
		return myPageMapper.myStudyRoomListCnt(searchRentStudyRoomVO);
	}

	public List<RentSeatVO> getMySeatList(RentSeatVO searchRentSeatVO) throws SQLException {
		List<RentSeatVO> mySeatList = myPageMapper.mySeatList(searchRentSeatVO);
		return mySeatList;
	}

	public int getMySeatListTotalCnt(RentStudyRoomVO searchRentStudyRoomVO) throws SQLException {
		return myPageMapper.mySeatListCnt(searchRentStudyRoomVO);
	}

	public int myStudyRoomReviewCnt(StudyRoomReviewsVO searchStudyRoomReviewsVO) throws SQLException {
		return myPageMapper.myStudyRoomReviewCnt(searchStudyRoomReviewsVO);
	}

	public int mySeatReviewCnt(SeatReviewsVO searchSeatReviewsVO) throws SQLException {
		return myPageMapper.mySeatReviewCnt(searchSeatReviewsVO);
	}

	public List<ReviewVO> getReivewList(ReviewVO reviewVO) throws SQLException {
		return myPageMapper.selectReivewList(reviewVO);
	}

	public int myFreeBoardCount(BoardVO searchFreeBoardVO)throws SQLException {
		return myPageMapper.myFreeBoardCount(searchFreeBoardVO);
	}

	public int myInfoBoardCount(InfoVO searchInfoVo) throws SQLException{
		return myPageMapper.myInfoBoardCount(searchInfoVo);
	}

	public int myStudygroupCount(StudygroupVO searchStudygroupVO) throws SQLException{
		return myPageMapper.myStudygroupCount(searchStudygroupVO);
	}

	public List<StoreScrapVO> storeScrapList(StoreScrapVO storeScrapVO) throws SQLException{
		List<StoreScrapVO> storeScrapList = myPageMapper.selectStoreScrapList(storeScrapVO);
		return storeScrapList;
	}

	public int storeScrapListCount(StoreScrapVO storeScrapVO) throws SQLException{
		return myPageMapper.selectStoreScrapListCount(storeScrapVO);
	}

	public List<BoardVO> boardScrapList(BoardVO boardVO) throws SQLException{
		List<BoardVO> boardScrapList = myPageMapper.selectBoardScrapList(boardVO);
		return boardScrapList;
	}

	public int boardScrapListCount(BoardVO boardVO) throws SQLException{
		return myPageMapper.selectBoardScrapListCount(boardVO);
	}

	public List<InfoVO> infoScrapList(InfoVO infoVO) throws SQLException {
		List<InfoVO> boardScrapList = myPageMapper.selectInfoScrapList(infoVO);
		return boardScrapList;
	}

	public int infoScrapListCount(InfoVO infoVO) throws SQLException {
		return myPageMapper.selectInfoScrapListCount(infoVO);
	}

	public List<StudygroupVO> studygroupScrapList(StudygroupVO studygroupVO) throws SQLException {
		List<StudygroupVO> studygroupScrapList = myPageMapper.selectStudygroupScrapList(studygroupVO);
		return studygroupScrapList;
	}

	public int studygroupScrapListCount(StudygroupVO studygroupVO) throws SQLException {
		return myPageMapper.selectStudygroupScrapListCount(studygroupVO);
	}

	public List<RentStudyRoomVO> getReservationList(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		return myPageMapper.selectReservationList(rentStudyRoomVO);
	}

	public void freeChk(int[] freeData)throws SQLException {
		myPageMapper.freeChk(freeData);
	}

	public List<ReplyVO> replyFreeNo(int[] freeData)throws SQLException {
		return myPageMapper.replyFreeNo(freeData);
	}

	public void deleteReply(int replyNo) throws SQLException{
		myPageMapper.deleteReply(replyNo);
	}

	public List<ReplyVO> replyInfoNo(int[] infoData) throws SQLException{
		return myPageMapper.replyInfoNo(infoData);
	}


	public void infoChk(int[] infoData)throws SQLException {
		myPageMapper.infoChk(infoData);
	}

	public void deleteInfoReply(int replyNo)throws SQLException {
		myPageMapper.deleteInfoReply(replyNo);
	}

	public List<ReplyVO> scrapInfoNo(int[] infoData)throws SQLException {
		return myPageMapper.scrapInfoNo(infoData);
	}

	public void deleteInfoScrap(int infoNo) throws SQLException{
		myPageMapper.deleteInfoScrap(infoNo);
	}

	public List<ReplyVO> scrapFreeNo(int[] freeData)throws SQLException {
		return myPageMapper.scrapFreeNo(freeData);
	}

	public void deleteFreeScrap(int freeNo)throws SQLException {
		myPageMapper.deleteFreeScrap(freeNo);
	}

	public List<ReplyVO> replyStudyNo(int[] stgData) throws SQLException{
		return myPageMapper.replyStudyNo(stgData);
	}

	public List<ReplyVO> scrapStudyNo(int[] stgData) throws SQLException{
		return myPageMapper.scrapStudyNo(stgData);
	}

	public void deleteStudyReply(int replyNo)throws SQLException {
		myPageMapper.deleteStudyReply(replyNo);
	}

	public void deleteStudyScrap(int studygroupNo)throws SQLException {
		myPageMapper.deleteStudyScrap(studygroupNo);
	}

	public void studyChk(int[] stgData)throws SQLException {
		myPageMapper.studyChk(stgData);
	}

	

	

}
