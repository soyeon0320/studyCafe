package kr.co.scm.mypage.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.vo.BoardScrapVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.board.vo.ReplyFormVO;
import kr.co.scm.board.vo.ReplyVO;
import kr.co.scm.board.vo.StudygroupFormVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.common.vo.KakaoPayCancelApprovalVO;
import kr.co.scm.common.web.VerifyRecaptchaController;
import kr.co.scm.mypage.service.MyPageService;
import kr.co.scm.mypage.vo.BuyListVO;
import kr.co.scm.mypage.vo.MemberBoardFormVO;
import kr.co.scm.mypage.vo.MemberBuyListFormVO;
import kr.co.scm.mypage.vo.MemberHistoryFormVO;
import kr.co.scm.mypage.vo.MemberReviewFormVO;
import kr.co.scm.mypage.vo.MemberScrapFormVO;
import kr.co.scm.mypage.vo.SeatReviewsVO;
import kr.co.scm.mypage.vo.StudyRoomReviewsVO;
import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Controller
@RequestMapping("/myPage")
public class MyPageController extends BaseController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private RentService rentService;

	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, HttpSession session, MemberVO memberVO, BuyListVO buyListVO) throws Exception {

		String url = "mypage/main.member";

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		memberVO.setMemId(loginUser.getMemId());

		MemberVO myInfo = myPageService.getMyInfomation(memberVO);
		mnv.addObject("myInfo", myInfo);

		mnv.setViewName(url);
		
		buyListVO.setMemId(loginUser.getMemId());
		List<BuyListVO> myTicketList = myPageService.myTicketList(buyListVO);

		mnv.addObject("myTicketList", myTicketList);
		mnv.setViewName(url);
		
		// 나의 이용권
		buyListVO.setMemId(loginUser.getMemId());
		buyListVO.setRecordCountPerPage(5);
		buyListVO.setFirstIndex(0);
		List<BuyListVO> buyList = myPageService.buyList(buyListVO);
		mnv.addObject("buyList", buyList);
		
		//나의 게시글
		BoardVO boardVO = new BoardVO();
		boardVO.setMemId(loginUser.getMemId());
		boardVO.setRecordCountPerPage(5);
		boardVO.setFirstIndex(0);
		List<BoardVO> freeBoardList = myPageService.freeBoardList(boardVO);
		mnv.addObject("freeBoardList", freeBoardList);
		
		InfoVO infoVO = new InfoVO();
		infoVO.setMemId(loginUser.getMemId());
		infoVO.setRecordCountPerPage(5);
		infoVO.setFirstIndex(0);
		List<InfoVO> infoBoardList = myPageService.infoBoardList(infoVO);
		mnv.addObject("infoBoardList", infoBoardList);
		
		StudygroupVO studygroupVO = new StudygroupVO();
		studygroupVO.setMemId(loginUser.getMemId());
		studygroupVO.setRecordCountPerPage(5);
		studygroupVO.setFirstIndex(0);
		List<StudygroupVO> studygroupList = myPageService.studygroupList(studygroupVO);
		mnv.addObject("studygroupList", studygroupList);
		
		// 예약 내역
		RentStudyRoomVO rentStudyRoomVO = new RentStudyRoomVO();
		rentStudyRoomVO.setMemId(loginUser.getMemId());
		rentStudyRoomVO.setRecordCountPerPage(5);
		rentStudyRoomVO.setFirstIndex(0);
		List<RentStudyRoomVO> reservationList = myPageService.getReservationList(rentStudyRoomVO);
		mnv.addObject("reservationList", reservationList);

		//이용내역
		rentStudyRoomVO.setMemId(loginUser.getMemId());
		rentStudyRoomVO.setRecordCountPerPage(5);
		rentStudyRoomVO.setFirstIndex(0);
		List<RentStudyRoomVO> myStudyRoomList = myPageService.getMyStudyRoomList(rentStudyRoomVO);
		mnv.addObject("myStudyRoomList", myStudyRoomList);
		
		RentSeatVO rentSeatVO = new RentSeatVO();
		rentSeatVO.setMemId(loginUser.getMemId());
		rentSeatVO.setRecordCountPerPage(5);
		rentSeatVO.setFirstIndex(0);
		List<RentSeatVO> mySeatList = myPageService.getMySeatList(rentSeatVO);
		mnv.addObject("mySeatList", mySeatList);
		
		//리뷰리스트
		StudyRoomReviewsVO studyRoomReviewsVO = new StudyRoomReviewsVO();
		studyRoomReviewsVO.setMemId(loginUser.getMemId());
		studyRoomReviewsVO.setRecordCountPerPage(5);
		studyRoomReviewsVO.setFirstIndex(0);
		List<StudyRoomReviewsVO> myStudyRoomReview = myPageService.myStudyRoomReview(studyRoomReviewsVO);
		mnv.addObject("myStudyRoomReview", myStudyRoomReview);
		
		SeatReviewsVO seatReviewsVO = new SeatReviewsVO();
		seatReviewsVO.setMemId(loginUser.getMemId());
		seatReviewsVO.setRecordCountPerPage(5);
		seatReviewsVO.setFirstIndex(0);
		List<SeatReviewsVO> mySeatReview = myPageService.mySeatReview(seatReviewsVO);
		mnv.addObject("mySeatReview", mySeatReview);
		
		//즐겨찾기 관리
		StoreScrapVO storeScrapVO = new StoreScrapVO();
		storeScrapVO.setMemId(loginUser.getMemId());
		storeScrapVO.setRecordCountPerPage(5);
		storeScrapVO.setFirstIndex(0);
		List<StoreScrapVO> storeScrapList = myPageService.storeScrapList(storeScrapVO);
		mnv.addObject("storeScrapList", storeScrapList);
		
		BoardVO boardScrapVO = new BoardVO();
		boardScrapVO.setMemId(loginUser.getMemId());
		boardScrapVO.setRecordCountPerPage(5);
		boardScrapVO.setFirstIndex(0);
		List<BoardVO> boardScrapList = myPageService.boardScrapList(boardScrapVO);
		mnv.addObject("boardScrapList", boardScrapList);
		
		InfoVO infoScrapVO = new InfoVO();
		infoScrapVO.setMemId(loginUser.getMemId());
		infoScrapVO.setRecordCountPerPage(5);
		infoScrapVO.setFirstIndex(0);
		List<InfoVO> infoScrapList = myPageService.infoScrapList(infoScrapVO);
		mnv.addObject("infoScrapList", infoScrapList);
		
		StudygroupVO studygroupScrapVO = new StudygroupVO();
		studygroupScrapVO.setMemId(loginUser.getMemId());
		studygroupScrapVO.setRecordCountPerPage(5);
		studygroupScrapVO.setFirstIndex(0);
		List<StudygroupVO> studygroupScrapList = myPageService.studygroupScrapList(studygroupScrapVO);
		mnv.addObject("studygroupScrapList", studygroupScrapList);
		
		return mnv;

	}
	@RequestMapping("/myInfo")
	public String myInfo(HttpSession session, MemberVO memberVO, Model model)throws SQLException{
		String url = "mypage/main_before.member";
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		memberVO.setMemId(loginUser.getMemId());

		MemberVO myInfo = myPageService.getMyInfomation(memberVO);
		model.addAttribute("myInfo", myInfo);
		
		return url;
	}
	
	@RequestMapping("/myInfoCh")
	public String myInfoCh(MemberVO memberVO, HttpSession session) throws SQLException{
		
		String url = "redirect:/mypage/main_before.member";
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		memberVO.setMemId(loginUser.getMemId());
		
		myPageService.myInfoChange(memberVO);
		
		return url;
		
	}
	
	@RequestMapping("/checkPass")
	public String checkPass(Model model)throws SQLException{
		String url = "mypage/passLock";
		
		return url;
	}
	
	@RequestMapping("/myInfoPass")
	public String myInfoPass(Model model, MemberVO memberVO)throws SQLException{
		
		String url = "mypage/changePass.member";
		
		return url;
		
	}
	@ResponseBody
	@RequestMapping(value = "/VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
	    VerifyRecaptchaController.setSecretKey("6LeMobEaAAAAAB4eTfqnz2JqBaAYF9YOlsHMzTRu");
	    String gRecaptchaResponse = request.getParameter("recaptcha");
	    try {
	       if(VerifyRecaptchaController.verify(gRecaptchaResponse))
	          return 0; // 성공
	       else return 1; // 실패
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; //에러
	    }
	}
	
	// 페이징 들어가야됨
	@RequestMapping("/buyList")
	public ModelAndView buyList(MemberBuyListFormVO buyListFormVO, ModelAndView mnv) throws Exception {

		String url = "mypage/buyList.member";

		BuyListVO searchBuyListVO = buyListFormVO.getSearchBuyListVO();

		PaginationInfo buyListPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(buyListPaginationInfo, searchBuyListVO);

		List<BuyListVO> buyList = myPageService.buyList(searchBuyListVO);
		mnv.addObject("buyList", buyList);

		int totalCount = myPageService.searchBuyListCount(searchBuyListVO);
		buyListPaginationInfo.setTotalRecordCount(totalCount);
		mnv.addObject("buyListPaginationInfo", buyListPaginationInfo);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/mbl")
	public String mbl() {

		return "mypage/myBoardReq.member";
	}

	@RequestMapping("/myBoard")
	public ModelAndView myBoard(ModelAndView mnv, String tab, HttpSession session,  MemberBoardFormVO memberBoardFormVO) throws SQLException {
		String url = "mypage/myBoardList.member";
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//		switch (tab) {

//		case "#freeBoardList":
			BoardVO searchFreeBoardVO = memberBoardFormVO.getSearchBoardVO();
			PaginationInfo freeBoardPaginationInfo = new PaginationInfo();
			setUpPaginationInfo(freeBoardPaginationInfo, searchFreeBoardVO);
			searchFreeBoardVO.setMemId(loginUser.getMemId());
			List<BoardVO> freeBoardList = myPageService.freeBoardList(searchFreeBoardVO);
			int totalCount = myPageService.myFreeBoardCount(searchFreeBoardVO);
			freeBoardPaginationInfo.setTotalRecordCount(totalCount);
			mnv.addObject("freeBoardList", freeBoardList);
			mnv.addObject("freeBoardPaginationInfo", freeBoardPaginationInfo);
//			break;
//		case "#infoBoardList":
			InfoVO searchInfoVo = memberBoardFormVO.getSearchInfoVO();
			PaginationInfo infoPaginationInfo = new PaginationInfo();
			setUpPaginationInfo(infoPaginationInfo, searchInfoVo);
			searchInfoVo.setMemId(loginUser.getMemId());
			List<InfoVO> infoBoardList = myPageService.infoBoardList(searchInfoVo);
			totalCount = myPageService.myInfoBoardCount(searchInfoVo);
			infoPaginationInfo.setTotalRecordCount(totalCount);
			mnv.addObject("infoBoardList", infoBoardList);
			mnv.addObject("infoPaginationInfo", infoPaginationInfo);
//			break;
//		case "#studygroupList":
			StudygroupVO searchStudygroupVO = memberBoardFormVO.getSearchStudygroupVO();
			PaginationInfo studygroupPaginationInfo = new PaginationInfo();
			setUpPaginationInfo(studygroupPaginationInfo, searchStudygroupVO);
			searchStudygroupVO.setMemId(loginUser.getMemId());
			List<StudygroupVO> studygroupList = myPageService.studygroupList(searchStudygroupVO);
			totalCount = myPageService.myStudygroupCount(searchStudygroupVO);
			studygroupPaginationInfo.setTotalRecordCount(totalCount);
			mnv.addObject("studygroupList", studygroupList);
			mnv.addObject("studygroupPaginationInfo", studygroupPaginationInfo);
//			break;
//		}
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/myBoardList")
	public ModelAndView myBoardList(ModelAndView mnv, StudygroupFormVO sgv) throws Exception {

		String url = "mypage/myBoardList.member";

//		Map<String, Object> freeBoardList = memberService.freeBoardList(sgv);
		// Map<String, Object> infoBoardList = memberService.infoBoardList(cri);

//		mnv.addAllObjects(freeBoardList);
		// mnv.addAllObjects(infoBoardList);
//		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/freeChkSuccess")
	public String freeChkSuccess(@RequestParam("freeData")int[] freeData) throws SQLException{
		String url = "mypage/freeChkSuccess.open";
		List<ReplyVO> reNo =  myPageService.replyFreeNo(freeData);
		List<ReplyVO> scNo =  myPageService.scrapFreeNo(freeData);
		
			
		for(int i=0; i<reNo.size(); i++) {
			int replyNo = reNo.get(i).getReplyNo();
			myPageService.deleteReply(replyNo);
		}
		for(int i=0; i<scNo.size(); i++) {
			int freeNo = scNo.get(i).getFreeNo();
			myPageService.deleteFreeScrap(freeNo);
		}
		
		myPageService.freeChk(freeData);
		
		return url;
	}
	@RequestMapping("/infoChkSuccess")
	public String infoChkSuccess(@RequestParam("infoData")int[] infoData) throws SQLException{
		String url = "mypage/freeChkSuccess.open";
		List<ReplyVO> inNo =  myPageService.replyInfoNo(infoData);
		List<ReplyVO> scNo =  myPageService.scrapInfoNo(infoData);
		
		
		for(int i=0; i<inNo.size(); i++) {
			int replyNo = inNo.get(i).getReplyNo();
			myPageService.deleteInfoReply(replyNo);
		}
		for(int i=0; i<scNo.size(); i++) {
			int freeNo = scNo.get(i).getInfoNo();
			myPageService.deleteInfoScrap(freeNo);
		}
		
		myPageService.infoChk(infoData);
		
		return url;
	}
	
	@RequestMapping("/stgChkSuccess")
	public String stgChkSuccess(@RequestParam("stgData")int[] stgData)throws SQLException{
		String url = "mypage/freeChkSuccess.open";
		
		List<ReplyVO> stgNo = myPageService.replyStudyNo(stgData);
		List<ReplyVO> scNo = myPageService.scrapStudyNo(stgData);
		
		
		for(int i=0; i<stgNo.size(); i++) {
			int replyNo = stgNo.get(i).getReplyNo();
			myPageService.deleteStudyReply(replyNo);
		}
		
		for(int i=0; i<scNo.size(); i++) {
			int studygroupNo = scNo.get(i).getStudygroupNo();
			myPageService.deleteStudyScrap(studygroupNo);
		}
		
		
		myPageService.studyChk(stgData);
		
		return url;
	}
	
	@RequestMapping("/infoBoard")
	public ModelAndView infoBoard(ModelAndView mnv) throws Exception {

		String url = "mypage/infoBoard.member";

//		Map<String, Object> infoBoardList = memberService.infoBoardList(cri);

//		mnv.addAllObjects(infoBoardList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/stgBoard")
	public ModelAndView stgBoard(ModelAndView mnv) throws Exception {

		String url = "mypage/stgBoard.member";

		Map<String, Object> stgBoardList = myPageService.stgBoardList();

		mnv.addAllObjects(stgBoardList);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/myScrap")
	public ModelAndView myScrap(ModelAndView mnv, HttpSession session, MemberScrapFormVO memberScrapFormVO) throws Exception {
		String url = "mypage/myScrap.member";
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		//가맹점 즐겨찾기 목록
		StoreScrapVO searchStoreScrapVO = memberScrapFormVO.getSearchStoreScrapVO();
		
		PaginationInfo storePaginationInfo = new PaginationInfo();
		setUpPaginationInfo(storePaginationInfo, searchStoreScrapVO);
		
		searchStoreScrapVO.setMemId(loginUser.getMemId());
		List<StoreScrapVO> storeScrapList = myPageService.storeScrapList(searchStoreScrapVO);
		
		int storeScrapTotalCount = myPageService.storeScrapListCount(searchStoreScrapVO);
		storePaginationInfo.setTotalRecordCount(storeScrapTotalCount);
		
		mnv.addObject("storeScrapList", storeScrapList);
		mnv.addObject("storePaginationInfo", storePaginationInfo);
		
		//자유게시판 즐겨찾기 목록
		BoardVO searchBoardScrapVO = memberScrapFormVO.getSearchBoardVO();
		
		PaginationInfo boardPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(boardPaginationInfo, searchBoardScrapVO);
		
		searchBoardScrapVO.setMemId(loginUser.getMemId());
		List<BoardVO> boardScrapList = myPageService.boardScrapList(searchBoardScrapVO);
		
		int boardScrapTotalCount = myPageService.boardScrapListCount(searchBoardScrapVO);
		boardPaginationInfo.setTotalRecordCount(boardScrapTotalCount);
		
		mnv.addObject("boardScrapList", boardScrapList);
		mnv.addObject("boardPaginationInfo", boardPaginationInfo);
		
		//정보게시판 즐겨찾기 목록
		InfoVO searchInfoScrapVO = memberScrapFormVO.getSearchInfoVO();
		
		PaginationInfo infoPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(infoPaginationInfo, searchInfoScrapVO);
		
		searchInfoScrapVO.setMemId(loginUser.getMemId());
		List<InfoVO> infoScrapList = myPageService.infoScrapList(searchInfoScrapVO);
		
		int infoScrapTotalCount = myPageService.infoScrapListCount(searchInfoScrapVO);
		infoPaginationInfo.setTotalRecordCount(infoScrapTotalCount);
		
		mnv.addObject("infoScrapList", infoScrapList);
		mnv.addObject("infoPaginationInfo", infoPaginationInfo);
		
		//소모임게시판 즐겨찾기
		StudygroupVO searchStudygroupScrapVO = memberScrapFormVO.getSearchStudygroupVO();
		
		PaginationInfo studygroupPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(studygroupPaginationInfo, searchStudygroupScrapVO);
		
		searchStudygroupScrapVO.setMemId(loginUser.getMemId());
		List<StudygroupVO> studygroupScrapList = myPageService.studygroupScrapList(searchStudygroupScrapVO);
		
		int studygroupScrapTotalCount = myPageService.studygroupScrapListCount(searchStudygroupScrapVO);
		infoPaginationInfo.setTotalRecordCount(studygroupScrapTotalCount);
		
		mnv.addObject("studygroupScrapList", studygroupScrapList);
		mnv.addObject("studygroupPaginationInfo", studygroupPaginationInfo);
		
		mnv.setViewName(url);

		return mnv;
	}
	
	

	@RequestMapping("/myTicketList")
	public ModelAndView myTicketList(ModelAndView mnv, HttpSession session, BuyListVO buyListVO) throws Exception {

		String url = "mypage/myTicketList.member";
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		buyListVO.setMemId(loginUser.getMemId());
		List<BuyListVO> myTicketList = myPageService.myTicketList(buyListVO);

		mnv.addObject("myTicketList", myTicketList);
		mnv.setViewName(url);

		return mnv;
	}

	/*
	 * 마이페이지 스터디카페 이용내역
	 */
	@RequestMapping("/history")
	public String history(MemberHistoryFormVO memberHistoryFormVO, Model model, HttpSession session)
			throws SQLException {

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		RentStudyRoomVO searchRentStudyRoomVO = memberHistoryFormVO.getSearchRentStudyRoomVO();
		PaginationInfo roomPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(roomPaginationInfo, searchRentStudyRoomVO);
		searchRentStudyRoomVO.setMemId(loginUser.getMemId());
		List<RentStudyRoomVO> myStudyRoomList = myPageService.getMyStudyRoomList(searchRentStudyRoomVO);
		int totalCnt = myPageService.getMyStudyRoomListTotalCnt(searchRentStudyRoomVO);
		roomPaginationInfo.setTotalRecordCount(totalCnt);

		RentSeatVO searchRentSeatVO = memberHistoryFormVO.getSearchRentSeatVO();
		PaginationInfo seatPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(seatPaginationInfo, searchRentSeatVO);
		searchRentSeatVO.setMemId(loginUser.getMemId());
		List<RentSeatVO> mySeatList = myPageService.getMySeatList(searchRentSeatVO);
		totalCnt = myPageService.getMySeatListTotalCnt(searchRentStudyRoomVO);
		seatPaginationInfo.setTotalRecordCount(totalCnt);

		model.addAttribute("mySeatList", mySeatList);
		model.addAttribute("seatPaginationInfo", seatPaginationInfo);
		model.addAttribute("myStudyRoomList", myStudyRoomList);
		model.addAttribute("roomPaginationInfo", roomPaginationInfo);

		return "mypage/history.member";
	}

	@RequestMapping("/history/cancel")
	public String roomCancel(MemberHistoryFormVO memberHistoryFormVO)
			throws SQLException {
		rentService.cancelRoomRent(memberHistoryFormVO.getRentStudyRoomVO());
		return "jsonView";
	}
	
	@RequestMapping("/registReviewForm")
	public ModelAndView registReviewForm(ModelAndView mnv, RentStudyRoomVO rentStudyRoomVO) throws Exception {

		String url = "mypage/registReviewForm.open";

		RentStudyRoomVO rvStore = myPageService.getReservStudyRoom(rentStudyRoomVO);

		mnv.addObject("rvStore", rvStore);
		mnv.setViewName(url);

		return mnv;
	}
	
	// reserv_no랑 비교해서 해당 번호 후기있으면 막아야됨
	@RequestMapping(value = "/studyRoomRegistReview", method = RequestMethod.POST)
	public void registReview(StudyRoomReviewsVO studyRoomReviewsVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		myPageService.stduyRoomReviewRegist(studyRoomReviewsVO);

	}
	@RequestMapping("/registSeatReviewForm")
	public ModelAndView registSeatReviewForm(ModelAndView mnv, RentSeatVO rentSeatVO)throws SQLException{
		
		String url = "mypage/registSeatReviewForm.open";
		
		RentSeatVO rentSeat = myPageService.getRentSeat(rentSeatVO);
		
		mnv.addObject("rentSeat", rentSeat);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/seatRegistReview", method=RequestMethod.POST)
	public void seatRegistReview(SeatReviewsVO seatReviewsVO, HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
		myPageService.seatRegistReview(seatReviewsVO);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('좌석 후기 등록이 완료되었습니다.');");
		out.println("window.open('about:blank', '_self').close();");
		out.println("</script>");
		out.close();
	}

	@RequestMapping("/reviewList")
	public ModelAndView reviewList(ModelAndView mnv, String tab, MemberReviewFormVO memberReviewFormVO,
			HttpSession session) throws SQLException {
		String url = "mypage/reviewList.member";

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//		switch(tab) {
//		case "#myStudyRoomReview":
		
		StudyRoomReviewsVO searchStudyRoomReviewsVO = memberReviewFormVO.getSearchStudyRoomReviewsVO();
		PaginationInfo studyRoomPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(studyRoomPaginationInfo, searchStudyRoomReviewsVO);
		searchStudyRoomReviewsVO.setMemId(loginUser.getMemId());
		List<StudyRoomReviewsVO> myStudyRoomReview = myPageService.myStudyRoomReview(searchStudyRoomReviewsVO);
		int totalCount = myPageService.myStudyRoomReviewCnt(searchStudyRoomReviewsVO);
		studyRoomPaginationInfo.setTotalRecordCount(totalCount);
		mnv.addObject("myStudyRoomReview", myStudyRoomReview);
		mnv.addObject("studyRoomPaginationInfo", studyRoomPaginationInfo);

//			break;
//		case "#mySeatReview":

		SeatReviewsVO searchSeatReviewsVO = memberReviewFormVO.getSearchSeatReviewsVO();
		PaginationInfo seatPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(seatPaginationInfo, searchSeatReviewsVO);
		searchSeatReviewsVO.setMemId(loginUser.getMemId());
		List<SeatReviewsVO> mySeatReview = myPageService.mySeatReview(searchSeatReviewsVO);
		totalCount = myPageService.mySeatReviewCnt(searchSeatReviewsVO);
		seatPaginationInfo.setTotalRecordCount(totalCount);
		mnv.addObject("mySeatReview", mySeatReview);
		mnv.addObject("seatPaginationInfo", seatPaginationInfo);

//		}

		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/reviewDetail")
	public ModelAndView reviewDetail(ModelAndView mnv, StudyRoomReviewsVO studyRoomReviewsVO,
			SeatReviewsVO seatReviewsVO) throws SQLException {

		String studyRoomReview = "mypage/studyRoomReviewDetail.open";
		String seatReview = "mypage/seatReviewDetail.open";

		if (studyRoomReviewsVO.getReviewsNo() != 0) {
			StudyRoomReviewsVO studyRoomReviewDetail = myPageService.studyRoomReviewDetail(studyRoomReviewsVO);

			mnv.addObject("studyRoomReviewDetail", studyRoomReviewDetail);
			mnv.setViewName(studyRoomReview);
		}
		if (seatReviewsVO.getSeatReviewsNo() != 0) {
			SeatReviewsVO seatReviewDetail = myPageService.seatReviewDetail(seatReviewsVO);
			mnv.addObject("seatReviewDetail", seatReviewDetail);
			mnv.setViewName(seatReview);
		}

		return mnv;
	}

	@RequestMapping(value = "/studyReviewModify", method = RequestMethod.POST)
	public void reviewModify(StudyRoomReviewsVO studyRoomReviewsVO, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, IOException {

		myPageService.studyRoomReviewModify(studyRoomReviewsVO);

	}

	@RequestMapping(value = "/seatReviewModify", method = RequestMethod.POST)
	public void seatReviewModify(SeatReviewsVO seatReviewsVO, HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		myPageService.seatReviewModify(seatReviewsVO);

	}

	@RequestMapping(value = "/studyReviewRemove", method = RequestMethod.GET)
	public void reviewRemove(StudyRoomReviewsVO studyRoomReviewsVO, HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		myPageService.reviewRemove(studyRoomReviewsVO);

	}

	@RequestMapping(value = "/seatReviewRemove", method = RequestMethod.GET)
	public void seatReviewRemove(SeatReviewsVO seatReviewsVO, HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		myPageService.seatReviewRemove(seatReviewsVO);

	}
}
