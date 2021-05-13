package kr.co.scm.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.board.vo.ReplyVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.mypage.vo.BuyListVO;
import kr.co.scm.mypage.vo.ReviewVO;
import kr.co.scm.mypage.vo.SeatReviewsVO;
import kr.co.scm.mypage.vo.StudyRoomReviewsVO;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Mapper("myPageMapper")
public interface MyPageMapper {
		
		MemberVO getMyInfomation(MemberVO memberVO)throws SQLException;
		
		void myInfoChange(MemberVO memberVO)throws SQLException;

		// 나의 구매내역 조회
		List<BuyListVO> buyList(BuyListVO buyListVO)throws SQLException;
		
		// 나의 자유게시판 작성글 조회
		List<BoardVO> freeBoardList(BoardVO boardVO)throws SQLException;
		
		// 나의 정보게시판 작성글 조회
		List<InfoVO> infoBoardList(InfoVO infoVO)throws SQLException;

		List<InfoVO> stgBoardList();
		//나의 스터디룸 이용내역
		List<RentStudyRoomVO> myStudyRoomList(RentStudyRoomVO searchRentStudyRoomVO) throws SQLException;

		List<RentSeatVO> mySeatList(RentSeatVO searchRentSeatVO) throws SQLException;
		
		//
		List<StudygroupVO> studygroupList(StudygroupVO studygroupVO) throws SQLException;
		
		//나의 스터디룸 리뷰가져오기
		List<StudyRoomReviewsVO> myStudyRoomReview(StudyRoomReviewsVO studyRoomReviewsVO)throws SQLException;

		List<SeatReviewsVO> mySeatReview(SeatReviewsVO seatReviewsVO)throws SQLException;

		SeatReviewsVO seatReviewDetail(SeatReviewsVO seatReviewsVO) throws SQLException;

		StudyRoomReviewsVO studyRoomReviewDetail(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException;

		void studyRoomReviewRegist(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException;
		
		void seatRegistReview(SeatReviewsVO seatReviewsVO)throws SQLException;
		
		void studyRoomReivewModify(StudyRoomReviewsVO studyRoomReviewsVO)throws SQLException;

		void reviewRemove(StudyRoomReviewsVO studyRoomReviewsVO) throws SQLException;

		void seatReviewModify(SeatReviewsVO seatReviewsVO) throws SQLException;

		void seatReviewRemove(SeatReviewsVO seatReviewsVO)throws SQLException;

		RentStudyRoomVO getReservStudyRoom(RentStudyRoomVO rentStudyRoomVO)throws SQLException;
		
		RentSeatVO getRentSeat(RentSeatVO rentSeatVO) throws SQLException;
		
		List<BuyListVO> myTicketList(BuyListVO buyListVO) throws SQLException;

		int mySeatListCnt(RentStudyRoomVO searchRentStudyRoomVO);

		int myStudyRoomListCnt(RentStudyRoomVO searchRentStudyRoomVO);

		int myStudyRoomReviewCnt(StudyRoomReviewsVO searchStudyRoomReviewsVO);

		int mySeatReviewCnt(SeatReviewsVO searchSeatReviewsVO);

		int searchBuyListCount(BuyListVO searchBuyListVO);

		List<ReviewVO> selectReivewList(ReviewVO reviewVO);

		int myFreeBoardCount(BoardVO searchFreeBoardVO);

		int myInfoBoardCount(InfoVO searchInfoVo);

		int myStudygroupCount(StudygroupVO searchStudygroupVO);

		List<StoreScrapVO> selectStoreScrapList(StoreScrapVO storeScrapVO) throws SQLException;

		int selectStoreScrapListCount(StoreScrapVO storeScrapVO) throws SQLException;

		List<BoardVO> selectBoardScrapList(BoardVO boardVO) throws SQLException;

		int selectBoardScrapListCount(BoardVO boardVO) throws SQLException;

		List<InfoVO> selectInfoScrapList(InfoVO infoVO) throws SQLException;

		int selectInfoScrapListCount(InfoVO infoVO) throws SQLException;

		List<StudygroupVO> selectStudygroupScrapList(StudygroupVO studygroupScrapVO) throws SQLException;

		int selectStudygroupScrapListCount(StudygroupVO studygroupScrapVO) throws SQLException;

		List<RentStudyRoomVO> selectReservationList(RentStudyRoomVO rentStudyRoomVO) throws SQLException;

		void freeChk(int[] freeData)throws SQLException;

		List<ReplyVO> replyFreeNo(int[] freeData)throws SQLException;

		void deleteReply(int replyNo)throws SQLException;

		List<ReplyVO> replyInfoNo(int[] infoData)throws SQLException;

		void infoChk(int[] infoData)throws SQLException;

		void deleteInfoReply(int replyNo)throws SQLException;

		List<ReplyVO> scrapInfoNo(int[] infoData)throws SQLException;

		void deleteInfoScrap(int infoNo)throws SQLException;

		List<ReplyVO> scrapFreeNo(int[] freeData)throws SQLException;

		void deleteFreeScrap(int freeNo)throws SQLException;

		List<ReplyVO> replyStudyNo(int[] stgData)throws SQLException;

		List<ReplyVO> scrapStudyNo(int[] stgData)throws SQLException;

		void deleteStudyReply(int replyNo)throws SQLException;

		void deleteStudyScrap(int studygroupNo)throws SQLException;

		void studyChk(int[] stgData)throws SQLException;
		

		

		//List<MyBoardVO> myBoardList(SearchCriteria cri);
		
		// 나의 스터디룸 리뷰 가져오기
		//List<StudyRoomReviewsVO> studyRoomReviewList(SearchCriteria cri)throws SQLException;
}
