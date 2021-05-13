package kr.co.scm.kiosk.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.service.TicketService;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.service.SeatService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.service.MemberService;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/kiosk")
public class UserController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RentService rentService;
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping("/main")
	public String main(Model model, HttpSession session) throws SQLException{
		String url = "kiosk/main.kiosk";
		
		StoreVO store = storeService.selectStoreByCode(((StoreVO)session.getAttribute("loginStore")).getStoreCode());
		String[] seatMap = seatService.getStoreSeatMap(store);
		Map<String,List<SeatVO>> seatList = seatService.currentSeatOccufied(store);
		model.addAllAttributes(seatList);
		model.addAttribute("seatMap",seatMap);
		model.addAttribute("store",store);
		session.setAttribute("storeUseInfo", storeService.getStoreUseInfo(store));
			
		return url;
	}
	
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		String url = "kiosk/account/joinForm.kiosk";
		
		return url;
	}
	
	@RequestMapping("/join")
	public String join(RedirectAttributes redirectAttributes, MemberVO member) throws SQLException {
		String url = "redirect:/kiosk/main";
		
		
		redirectAttributes.addFlashAttribute("message","회원가입 성공");
		return url;
	}
	
	
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		String url = "kiosk/account/loginForm.kiosk";
		
		return url;
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, RedirectAttributes redirectAttributes, MemberVO member) throws SQLException {
		String url = "redirect:/kiosk/rent";
		String msg = "";
		MemberVO memberVO = memberService.getMember(member);
		if (memberVO != null) {
			String memPass = DigestUtils.sha256Hex(member.getMemPass());
			if (memberVO.getMemPass().equals(memPass)) { //로그인 성공
				OwnerVO owner = (OwnerVO) session.getAttribute("loginOwner");
				memberVO.setStoreCode(owner.getStoreCode());
				session.setAttribute("loginUser", memberVO);
				msg= memberVO.getMemName() + "님 어서오세요!";
			}else {
				msg = "아이디 또는 패스워드가 틀렸습니다.";
				url="redirect:/kiosk/loginForm";
			}
		}else {
			msg="존재하지 않는 아이디입니다.";
			url="redirect:/kiosk/loginForm";
		}
		redirectAttributes.addFlashAttribute("message",msg);
		return url;
	}
	
	@RequestMapping("/input_QR")
	public String input_QR(HttpServletRequest request, HttpSession session) {
		String url = "kiosk/qr/input_QR.kiosk";
//		session.setAttribute("useType", request.getParameter("useType"));
		
		return url;
	}
	
	@RequestMapping("/findId")
	public String findId() {
		String url = "kiosk/account/findId.kiosk";
		
		return url;
	}
	
	@RequestMapping("/findPwd")
	public String findPwd() {
		String url = "kiosk/account/findPwd.kiosk";
		
		return url;
	}
	
	@RequestMapping("/logout")
	public String logoutUser(HttpSession session, RedirectAttributes redirectAttributes) {
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String msg = member.getMemName() + "님 로그아웃!";
		session.removeAttribute("loginUser");
		redirectAttributes.addFlashAttribute("message",msg);
		return "redirect:/kiosk/main";
	}
	
	@RequestMapping("/rent")
	public String rent(Model model, HttpSession session) throws SQLException {
		String url = "kiosk/rent/main.kiosk";
		
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		// 이미 입실한 좌석이 있는지 확인
//		RentSeatVO rentSeat = rentService.getSeat(member);
		if (member.getUseInfoVO() != null) {
			int totalRemainTime = ticketService.countTotalRemainTime(member);
			model.addAttribute("totalRemainTime",totalRemainTime);
		}
//		model.addAttribute("rentSeat",rentSeat);
		
		RentSeatVO checkSeatIn =  rentService.checkSeatIn(member);
//		List<RentStudyRoomVO> studyroomIn = rentService.getStudyroomIn(member);
		
		RentStudyRoomVO currentMemStudyRoom = rentService.currentMemStudyRoom(member);
		model.addAttribute("checkSeatIn", checkSeatIn);
		model.addAttribute("currentMemStudyRoom", currentMemStudyRoom);
		
		return url;
	}
	
	@RequestMapping("/useInfo")
	public String getUseInfo(StoreVO storeVO, Model model) {
		
		
		return "";
	}

}
