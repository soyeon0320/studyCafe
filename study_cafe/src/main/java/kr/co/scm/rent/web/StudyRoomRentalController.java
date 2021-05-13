package kr.co.scm.rent.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.scm.base.web.BaseController;
import kr.co.scm.common.service.KakaopayService;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.common.vo.KakaoPayApprovalVO;
import kr.co.scm.common.vo.KakaoPayReadyVO;
import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.rent.vo.StudyRoomRentCommandVO;
import kr.co.scm.rent.vo.StudyRoomRentFormVO;
import kr.co.scm.rent.vo.TimeTableVO;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.service.StudyRoomService;
import kr.co.scm.store.vo.StudyRoomVO;
import kr.co.scm.user.service.MemberService;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/rent")
public class StudyRoomRentalController extends BaseController{
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private RentService rentService;
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	@Autowired
	private KakaopayService kakaopayService;
	
	@Autowired
	private MemberService memberService;
	
	
	
	@RequestMapping(value="/studyRoom/main")
	public String main(StudyRoomRentFormVO studyRoomRentFormVO,Model model,HttpSession session) throws SQLException {
		session.setAttribute("serverIp", getServerIp());
		String url = "rent/studyRoom/main.member";
		
		model.addAttribute("donmCodeList", codeService.getAddrDonmList());
		return url;
	}
	
	@RequestMapping("/get/storeCode")
	public String getStoreCode(AddrVO addrVO, Model model) throws SQLException{
		model.addAttribute("storeList", storeService.getStoreListBySigugun(addrVO));
		return "jsonView";
	}
	
	@RequestMapping("/get/studyRoom")
	public String getStudyRoom(StudyRoomVO data, Model model) throws SQLException{
		
		List<StudyRoomVO> studyRoomList = studyRoomService.getStudyRoomListByStoreCode(data);
		model.addAttribute("studyRoomList", studyRoomList);
		
		return "jsonView";
	}
	
	@RequestMapping("/get/studyRoomSchedule")
	public String getStudyRoomSchedule(TimeTableVO timetableVO,Model model) throws SQLException {
		
		List<TimeTableVO> timeList = rentService.getTimeList(timetableVO);
		model.addAttribute("timeList", timeList);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/studyRoom")
	public String rentStudyRoom(StudyRoomRentCommandVO srrcVO,Model model) throws SQLException {
		String url = "jsonView";
		RentStudyRoomVO rentVO = srrcVO.toRentStudyRoomVO();
		rentService.registStudyRoomRent(rentVO);
		model.addAttribute("result", "성공");
		model.addAttribute("rentNo", rentVO.getStudyroomReservNo());
		
 		return url;
	}
	
	@RequestMapping("/studyroom/pay/ready")
	public String payReady(Model model, StudyRoomRentCommandVO srrcVO, HttpServletRequest request) throws Exception{
		KakaoPayReadyVO readyVO = new KakaoPayReadyVO(request,srrcVO);
		model.addAttribute("redirectUrl",kakaopayService.kakaoPayReady(readyVO));
		
		return "jsonView";
	}
	

	@RequestMapping("/studyroom/pay/success")
	public String paySuccess(Model model, String pg_token,HttpSession session) throws Exception{
		KakaoPayApprovalVO approvalVO = kakaopayService.kakaoPayInfo(pg_token);
		model.addAttribute("approvalVO", approvalVO);
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(approvalVO.getPartner_user_id());
		session.setAttribute("loginUser", memberService.getMember(memberVO));
		
		return "kakaopay/kakaopay_success.open";
	}

	@RequestMapping("/test")
	public String test(int rentNo,Model model) throws SQLException{
		RentStudyRoomVO rentStudyRoomVO = new RentStudyRoomVO(rentNo);
		make_qrcode("StudyRoom_"+rentNo);
		rentStudyRoomVO = rentService.selectRentStudyRoomVO(rentStudyRoomVO);
		model.addAttribute("rentVO", rentStudyRoomVO);
		model.addAttribute("serverIp", getServerIp());
		return "rent/studyRoom/rentNoti.open";
	}
}
