package kr.co.scm.rent.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import kr.co.scm.base.web.BaseController;
import kr.co.scm.common.service.KakaopayService;
import kr.co.scm.common.vo.KakaoPayReadyVO;
import kr.co.scm.rent.dao.TicketMapper;
import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.service.TicketService;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.TicketBuyVO;
import kr.co.scm.rent.vo.TicketVO;
import kr.co.scm.store.service.SeatService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/seat")
public class SeatRentalController extends BaseController{
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private RentService rentService;
	
	@Autowired
	private KakaopayService kakaopayService;
	
	@RequestMapping("/view")
	public String view(Model model, HttpSession session) throws SQLException {
		
		StoreVO store = storeService.selectStoreByCode(((StoreVO)session.getAttribute("loginStore")).getStoreCode());
		String[] seatMap = seatService.getStoreSeatMap(store);
		Map<String,List<SeatVO>> seatList = seatService.currentSeatOccufied(store);
		model.addAllAttributes(seatList);
		model.addAttribute("seatMap",seatMap);
		model.addAttribute("store",store);
		session.setAttribute("storeUseInfo", storeService.getStoreUseInfo(store));
		
		return "kiosk/rent/seat.kiosk";
	}
	
	@RequestMapping("/rent")
	public String rent(SeatVO seat, Model model, HttpSession session) throws SQLException {
		
		// 이용권리스트
		List<TicketVO> ticketList = ticketService.getTicket();
		for (TicketVO ticketVO : ticketList) {
			ticketVO.setTicketName(ticketVO.getTicketName().split(" ")[0]);
		}
		model.addAttribute("ticketList", ticketList);
		model.addAttribute("seat", seat);
		
		// 보유시간 조회
		int remainTime = ticketService.countTotalRemainTime((MemberVO)session.getAttribute("loginUser"));
		model.addAttribute("remainTime", remainTime);
		
		model.addAttribute("serverIp", getServerIp());
		
		
		return "kiosk/rent/ticketSelect.kiosk";
	}
	
	@RequestMapping("/rent/pay/ready")
	public String payReady(Model model, RentSeatVO rentSeatVO , HttpServletRequest request) throws Exception{
		KakaoPayReadyVO readyVO = new KakaoPayReadyVO(request, rentSeatVO);
		model.addAttribute("redirectUrl",kakaopayService.kakaoPayReady(readyVO));
		
		return "jsonView";
	}
	
	@RequestMapping("/buyTicket")
	public String buyTicket(TicketBuyVO ticketBuy, RentSeatVO rentSeat, Model model, HttpSession session) throws Exception {
		
		if (ticketBuy.getTicketNo() != 0) {
			// 이용권 결제
			ticketService.buyTicket(ticketBuy);
			model.addAttribute("ticketBuy", ticketBuy);
			
		} 
		//rentSeat.setStoreCode("test");
		// 좌석 예약
		rentService.rentSeat(rentSeat);
		
		// 보유시간 조회
		int remainTime = ticketService.countTotalRemainTime((MemberVO)session.getAttribute("loginUser"));
		model.addAttribute("remainTime", remainTime);
		
		// 예약번호로 큐알생성
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		OwnerVO owner = (OwnerVO) session.getAttribute("loginOwner");
		member.setStoreCode(owner.getStoreCode());
		rentSeat = rentService.getSeat(member);
		int rentSeatNo = rentSeat.getRentSeatNo();
		String qrInfo = "Seat_" + rentSeatNo;
		qr_create(rentSeatNo, qrInfo);
		File qrImage = new File("D:\\qr_image\\" + qrInfo + ".png");
		model.addAttribute("qrInfo", qrInfo);
		
		model.addAttribute("message", "좌석 예약 성공! 전송된 큐알코드로 입실하세요.");
		
		return "jsonView";
	}
	
//	@ResponseBody
	public void qr_create(int rentSeatNo, String qrInfo) throws Exception{
//	    Logger.info(null);
	    String name = qrInfo + ".png";
	 
	    try {
	        File file = null;
	        // qr코드 이미지를 저장할 디렉토리 지정
	        file = new File("D:\\qr_image");
	        if(!file.exists()) {
	            file.mkdirs();
	        }
	        // qr코드 바코드 생성값
	        int qrcodeColor = 0xFF2e4e96;
	        // qr코드 배경색상값
	        int backgroundColor = 0xFFFFFFFF;
	          
	        QRCodeWriter qrCodeWriter = new QRCodeWriter();
	        // 3,4번째 parameter값 : width/height값 지정
	        BitMatrix bitMatrix = qrCodeWriter.encode(qrInfo, BarcodeFormat.QR_CODE,300, 300);
	        //
	        MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor);
	        BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);
	        // ImageIO를 사용한 바코드 파일쓰기
	        ImageIO.write(bufferedImage, "png", new File("D:\\qr_image\\"+name));
	          
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
//	    Logger.info("바코드 생성 끝");
	}


	
}
