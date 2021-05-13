package kr.co.scm.rent.web;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.service.TicketService;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.service.StudyRoomService;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.service.MemberService;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/QR")
public class InOutController {
	
	@Autowired
	RentService rentService;
	
	@Autowired
	TicketService ticketService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	StudyRoomService studyRoomService;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/main")
	public String main() {
		return "kiosk/qr/input_QR.kiosk";
	}
	
	
	@RequestMapping("/checkIn")
	public String checkIn(HttpServletRequest request, RedirectAttributes redirectAttributes, HttpSession session) throws SQLException{
		String url = "redirect:/kiosk/main";
		String message = "유효한 코드를 입력해주세요.";
		
		String type = request.getParameter("type");
		if ("Seat".equals(type)) {
			// 좌석 입실
			RentSeatVO rentSeat = new RentSeatVO();
			int rentSeatNo = Integer.parseInt(request.getParameter("no"));
			rentSeat.setRentSeatNo(rentSeatNo);
			// 예약번호 유효성 검사
			if (rentService.checkSeatAvailable(rentSeat)) {
				// 퇴실여부체크
				if (!rentService.getCheckedOut(rentSeat)) {
					// 입실한 사용자 정보 가져오기
					rentSeat = rentService.getRentSeat(rentSeat);
					MemberVO member = new MemberVO();
					member.setMemId(rentSeat.getMemId());
					member = memberService.getMember(member);
					
					rentService.checkInSeat(rentSeat);
					
					message = member.getMemName() + "님 입실완료";
					session.removeAttribute("useType");
				} else {
					message = "이미 퇴실한 좌석입니다.";
					url = "redirect:/QR/main";
				}
			} else {
				url = "redirect:/QR/main";
			}
		} else if ("StudyRoom".equals(type)) {
			// 스터디룸 입실
			RentStudyRoomVO rentStudyRoom = new RentStudyRoomVO();
			int reserveNo = Integer.parseInt(request.getParameter("no"));
			rentStudyRoom.setStudyroomReservNo(reserveNo);
			List<RentStudyRoomVO> studyRoomList = studyRoomService.detailStudyRoomList(rentStudyRoom);
			// 예약번호 유효성 체크
			if (studyRoomList.size() != 0) {
				RentStudyRoomVO vo = studyRoomList.get(0);
				Date today = new Date();
				// 이용시간체크
				if (today.compareTo(vo.getStudyroomReservStart()) > -1 ) {
					if (today.compareTo(vo.getStudyroomReservEnd()) < 0 ) {
						rentService.checkInStudyRoom(rentStudyRoom);
						message = "스터디룸 입실완료";
						session.removeAttribute("useType");
					} else {
						message = "스터디룸 이용시간이 지났습니다.";
					}
					
				} else {
					message = "스터디룸 이용시간에 맞춰 입실해주세요.";
				}
			} else {
				url = "redirect:/QR/main";
			}
			
		} else {
			url = "redirect:/QR/main";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return url;
	}

	@RequestMapping("/checkOut")
	public String checkOut(HttpServletRequest request, RedirectAttributes redirectAttributes, HttpSession session) throws SQLException{
		String url = "redirect:/kiosk/main";
		String message = "";
		
		String type = request.getParameter("type");
		if ("Seat".equals(type)) {
			// 좌석 퇴실
			RentSeatVO rentSeat = new RentSeatVO();
			int rentSeatNo = Integer.parseInt(request.getParameter("no"));
			rentSeat.setRentSeatNo(rentSeatNo);
			if (!rentService.getCheckedOut(rentSeat)) {
				// 입실한 사용자 정보 가져오기
				rentSeat = rentService.getRentSeat(rentSeat);
				MemberVO member = memberService.getMember(new MemberVO(rentSeat.getMemId()));
				
				// 기기 반납여부 체크
				RentalEquipVO rentalEquipVO = new RentalEquipVO();
				rentalEquipVO.setMemId(rentSeat.getMemId());
				if(rentService.checkRentEquipOutByMemId(member).size() != 0) {
					message = "기기반납 후 퇴실해주세요.";
				} else {
					
					// 총 이용시간, 총 잔여시간
					int seatTotalTime = rentSeat.calcSeatTotalTime();
					rentSeat.setSeatTotalTime(seatTotalTime);
					int remainTime = ticketService.countTotalRemainTime(member);
					
					if (seatTotalTime > remainTime) {
						// 초과시간 발생
						// 보유시간 모두 차감 후
						ticketService.useAllTicket(member);
						// 추가시간 10분단위로 올림 후 10분당 추가요금 계산
						int overTime = seatTotalTime - remainTime; 
						int overPrice = (int)Math.ceil((double)overTime/10)*1000; 
						
						message = member.getMemName() + "님 추가시간이 발생하여 추가요금 페이지로 이동합니다.</p><p>추가시간 : " + overTime + "분";
						redirectAttributes.addFlashAttribute("overPrice", overPrice);
						redirectAttributes.addFlashAttribute("member", member);
						
						url = "redirect:";
						
					} else {
						// 잔여시간이 0이 될때까지 첫번째 이용권의 잔여시간 차감
						while (true) {
							// 첫번째 이용권의 잔여시간
							int firstTicketRemainTime = ticketService.getFirstTicket(member);
							if (seatTotalTime <= firstTicketRemainTime) {
								// 첫번째 이용권의 잔여시간을 초과하지 않는 경우
								ticketService.useTicket(rentSeat);
								break;
							} else {
								// 여러 이용권을 사용하여 차감할 경우, 첫번째 이용권부터 차감한다.
								// 첫번째 이용권 잔여시간 0으로  차감
								rentSeat.setSeatTotalTime(firstTicketRemainTime);
								ticketService.useTicket(rentSeat);
								
								// 첫번재 이용권 잔여시간만큼 결제할 시간이 차감
								seatTotalTime -= firstTicketRemainTime;
								rentSeat.setSeatTotalTime(seatTotalTime);
								
							}
							
						}
						message = member.getMemName() + "님 퇴실완료\\n이용해 주셔서 감사합니다.";
						session.removeAttribute("useType");
					}
					// 퇴실시간 입력
					rentService.checkOutSeat(rentSeat);
				}
				
				
			} else {
				message = "유효한 코드를 입력해주세요.";
				url = "redirect:/QR/main";
			}
		} else if ("StudyRoom".equals(type)) {
			
			RentStudyRoomVO rentStudyRoom = new RentStudyRoomVO();
			int reserveNo = Integer.parseInt(request.getParameter("no"));
			rentStudyRoom.setStudyroomReservNo(reserveNo);
			List<RentStudyRoomVO> studyRoomList = studyRoomService.detailStudyRoomList(rentStudyRoom);
			// 예약번호 유효성 체크
			if (studyRoomList.size() != 0) {
				RentStudyRoomVO vo = studyRoomList.get(0);
				Date today = new Date();
				// 이용시간체크
				if (vo.getStudyroomIn() != null && vo.getStudyroomOut() == null) {
					RentalEquipVO rentalEquipVO = new RentalEquipVO();
					rentalEquipVO.setMemId(vo.getMemId());
					if(!rentService.getRentEquip(rentalEquipVO)) {
						message = "기기반납 후 퇴실해주세요.";
						return url;
					}
					// 제시간에 퇴실
					if (today.compareTo(vo.getStudyroomReservEnd()) <= 0 ) {
						message = "스터디룸 퇴실완료";
						session.removeAttribute("useType");
					} else {
						// 추가요금 발생
						int overMi = (int) Math.ceil(((double)(today.getTime()-vo.getStudyroomReservEnd().getTime()) / 1000 / 60  ));
						System.err.println((today.getTime()-vo.getStudyroomReservEnd().getTime()) / 1000 / 60 + "분");
						int overPrice = (int)(Math.ceil((double)overMi/10) * 10) * 2000;
						message = "스터디룸 이용시간이 " + overMi + "분 지났습니다.</p><p>추가요금 : "+ overPrice +"원</p><p>결제페이지로 이동합니다.";
						
						redirectAttributes.addFlashAttribute("overMi", overMi);
						redirectAttributes.addFlashAttribute("overPrice", overPrice);
						redirectAttributes.addFlashAttribute("rentStudyRoom", vo);
						url = "redirect:/QR/overPay";
					}
					rentService.checkOutStudyRoom(rentStudyRoom);
					
				} else {
					message = "유효한 코드를 입력해주세요.";
					url = "redirect:/QR/main";
				}
			} else {
				message = "유효한 코드를 입력해주세요.";
				url = "redirect:/QR/main";
			}
			
		} else {
			message = "유효한 코드를 입력해주세요.";
			url = "redirect:/QR/main";
		}
		redirectAttributes.addFlashAttribute("message", message);
		return url;
	}
	
	@RequestMapping("/goingOut")
	public String goingOut(HttpServletRequest request, RedirectAttributes redirectAttributes, HttpSession session) throws SQLException{
		String url = "redirect:/kiosk/main";
		
		RentSeatVO rentSeat = new RentSeatVO();
		int rentSeatNo = Integer.parseInt(request.getParameter("no"));
		rentSeat.setRentSeatNo(rentSeatNo);
		
		if (!rentService.getCheckedOut(rentSeat)) {
			// 입실한 사용자 정보 가져오기
			rentSeat = rentService.getRentSeat(rentSeat);
			MemberVO member = new MemberVO();
			member.setMemId(rentSeat.getMemId());
			member = memberService.getMember(member);
			
			if ("Y".equals(rentSeat.getGoingOut())) {
				redirectAttributes.addFlashAttribute("message", "이미 외출한 코드입니다.</p><p>유효한 코드를 입력해주세요.");
				url = "redirect:/QR/main";
			} else {
				rentService.goingOut(rentSeat);
				redirectAttributes.addFlashAttribute("message", member.getMemName() + "님 외출완료");
				session.removeAttribute("useType");
			}
			
		} else {
			redirectAttributes.addFlashAttribute("message", "이미 퇴실한 코드입니다.</p><p>유효한 코드를 입력해주세요.");
			url = "redirect:/QR/main";
		}
		
		return url;
	}
	
	@RequestMapping("/rentOut")
	public String rentOut(RentalEquipVO rentalEquipVO, RedirectAttributes redirectAttributes, HttpSession session)throws SQLException{
		
		String url = "redirect:/kiosk/main";
		
//		RentalEquipVO rentOutTime = rentService.getRentEquip(rentalEquipVO); 
//		rentService.getRentEquip(rentalEquipVO)
		// 반납시, 이용마감시간과 sysdate 비교 
		// 1) 추가요금 발생 X
		// : sysdate <= 이용마감시간
		rentalEquipVO = rentService.myEquip(rentalEquipVO);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
//		member.setMemId(rentalEquipVO.getMemId());
//		member = memberService.getMember(member);
		
		RentalEquipVO rentOutOk = rentService.nowUseEquip(rentalEquipVO);
		
		RentalEquipVO rentOutFalse = rentService.overUseEquip(rentalEquipVO);
		
		redirectAttributes.addFlashAttribute("member", member);
		
		// 이경우에 반납 시키고
		if(!ObjectUtils.isEmpty(rentOutOk)) {
			
			// 여기서 Equip_Rent_End 업데이트
			rentService.rentEquipEnd(rentalEquipVO);
			redirectAttributes.addFlashAttribute("message", rentalEquipVO.getMemId() + "님 반납완료!");
			
		}else if(!ObjectUtils.isEmpty(rentOutFalse)) {
			// 다시들어왔을때 equipRentEnd 데이터 없을때만 들어오게
			int overRentTime = rentService.overRentTime(rentalEquipVO);
			
			int overPayTime = (int)Math.round((overRentTime + 9)/10*10);
			int overPayPrice = (overPayTime/10) *2000;
			
			rentalEquipVO.setOverPayPrice(overPayPrice);
			
			//여기에 rental no로 
			RentalEquipVO myEquip = rentService.myEquip(rentalEquipVO);
			
			//여기서 end 데이터 업뎃 시키고
			rentService.rentEquipEnd(rentalEquipVO);
			
			//추가요금 까지 업뎃
			rentService.overPayCharge(rentalEquipVO);
			
			// 추가결제 추가
			redirectAttributes.addFlashAttribute("message", rentalEquipVO.getMemId() + "님 추가시간이 발생하여 추가요금 페이지로 이동합니다.</p><p>추가시간 : " + overPayTime + "분");
			redirectAttributes.addFlashAttribute("overPayTime", overPayTime);
			redirectAttributes.addFlashAttribute("overPayPrice", overPayPrice);
			redirectAttributes.addFlashAttribute("myEquip", myEquip);
			url = "redirect:/QR/overPay";
		}else{
			
			redirectAttributes.addFlashAttribute("message", "반납하신 QR 코드입니다. 다시 확인해주세요.");
		}
		
//		url = "redirect:/QR/main";
		return url;
		
	}
	
	@RequestMapping("/overPay")
	public String overPay(HttpServletRequest request, HttpSession session, Model model) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		 Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);  
		 
		 // memId와 equipName, equipTotalPrice
		 
		 int overPayTime = 0;
		 int overPayPrice = 0;
		 RentalEquipVO myEquip = null;
		 
		 if(redirectMap != null) {
			 overPayTime = (int)redirectMap.get("overPayTime");
			 overPayPrice = (int)redirectMap.get("overPayPrice");
			 myEquip = (RentalEquipVO)redirectMap.get("myEquip");
		 }
		model.addAttribute("overPayTime", overPayTime);
		model.addAttribute("overPayPrice", overPayPrice);
		model.addAttribute("myEquip", myEquip);
		model.addAttribute("message", "추가결제가 완료되었습니다. 감사합니다!.");
		
		return "kiosk/equip/overTimePay.kiosk";
	}
	
}
