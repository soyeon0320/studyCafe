package kr.co.scm.rent.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.common.service.KakaopayService;
import kr.co.scm.common.vo.KakaoPayApprovalVO;
import kr.co.scm.common.vo.KakaoPayReadyVO;
import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.service.TicketService;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.rent.vo.StudyRoomRentCommandVO;
import kr.co.scm.rent.vo.TicketVO;
import kr.co.scm.store.service.EquipService;
import kr.co.scm.store.service.OwnerService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.EquipFormVO;
import kr.co.scm.store.vo.EquipVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.user.service.MemberService;
import kr.co.scm.user.vo.MemberVO;
import oracle.net.aso.k;

@Controller
@RequestMapping("/equip")
public class EquipmentRentalController extends BaseController{
	
	@Autowired
	private RentService rentService;
	
	@Autowired
	private EquipService equipService;
	
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private KakaopayService kakaopayService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/tablet")
	public String main(Model model, HttpSession session, EquipFormVO equipFormVO)throws SQLException{
		
		String url = "kiosk/equip/tablet.kiosk";
		
//		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		RentalEquipVO searchEquipVO = equipFormVO.getSearchRentalEquipVO();
		searchEquipVO.setStoreCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
		searchEquipVO.setPageUnit(5);
		PaginationInfo equipPaginationInfo = new PaginationInfo();
		setUpPaginationInfo(equipPaginationInfo, searchEquipVO);
		List<RentalEquipVO> equipList = equipService.kioskRentTabletList(searchEquipVO);
		model.addAttribute("equipList", equipList);
		model.addAttribute("equipPaginationInfo", equipPaginationInfo);
		
		
		return url;
		
	}
	
	@RequestMapping("/notebook")
	public String notebook(Model model, HttpSession session, EquipFormVO equipFormVO)throws SQLException{
		String url = "kiosk/equip/notebook.kiosk";
		
		RentalEquipVO searchEquipVO = equipFormVO.getSearchRentalEquipVO();
		searchEquipVO.setPageUnit(5);
		searchEquipVO.setStoreCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
		List<RentalEquipVO> noteBookList = equipService.noteBookList(searchEquipVO);
		
		model.addAttribute("noteBookList", noteBookList);
		return url;
		
	}
	
	@RequestMapping("/rent")
	public String rent(Model model, HttpSession session, EquipVO equipVO, RentSeatVO rentSeatVO, RentStudyRoomVO rentStudyRoomVO)throws SQLException{
		String url = "kiosk/equip/notebookTicket.kiosk";
		
		equipVO.setEquipCode(equipVO.getEquipCode());
		
		EquipVO equip = equipService.getTablet(equipVO);
		rentSeatVO.setStoreCode(equip.getStoreCode());
		rentSeatVO = rentService.getSeat((MemberVO) session.getAttribute("loginUser"));
		if(rentSeatVO != null) {
			
			RentSeatVO currentMemSeat = rentService.currentMemSeat(rentSeatVO); 
			model.addAttribute("currentMemSeat", currentMemSeat);
	
			int curSeatTime = rentService.curSeatTime(rentSeatVO);
			model.addAttribute("curSeatTime", curSeatTime);
		}
		
		RentStudyRoomVO currentMemStudyRoom = rentService.currentMemStudyRoom((MemberVO) session.getAttribute("loginUser"));
		int remainTime = ticketService.countTotalRemainTime((MemberVO) session.getAttribute("loginUser"));
		
		model.addAttribute("equip", equip);
		model.addAttribute("currentMemStudyRoom", currentMemStudyRoom);
		model.addAttribute("remainTime", remainTime);
		
		
		return url;
	}
	
	@RequestMapping("/tbRent")
	public String tbRent(Model model, HttpSession session, EquipVO equipVO, RentSeatVO rentSeatVO, RentStudyRoomVO rentStudyRoomVO)throws SQLException{
		String url = "kiosk/equip/tabletTicket.kiosk";
		
		equipVO.setEquipCode(equipVO.getEquipCode());
		
		EquipVO equip = equipService.getTablet(equipVO);
		
		rentSeatVO.setStoreCode(equip.getStoreCode());
		rentSeatVO = rentService.getSeat((MemberVO) session.getAttribute("loginUser"));
		if(rentSeatVO != null) {
			
			RentSeatVO currentMemSeat = rentService.currentMemSeat(rentSeatVO); 
			model.addAttribute("currentMemSeat", currentMemSeat);
	
			int curSeatTime = rentService.curSeatTime(rentSeatVO);
			model.addAttribute("curSeatTime", curSeatTime);
		}
		
//		List<RentStudyRoomVO> rentStudyRoom = rentService.getStudyroomIn((MemberVO) session.getAttribute("loginUser"));
//		RentStudyRoomVO currentMemStudyRoom = rentService.currentMemStudyRoom(rentStudyRoom);
		RentStudyRoomVO currentMemStudyRoom = rentService.currentMemStudyRoom((MemberVO) session.getAttribute("loginUser"));
		int remainTime = ticketService.countTotalRemainTime((MemberVO) session.getAttribute("loginUser"));
		
		
		model.addAttribute("equip", equip);
		model.addAttribute("currentMemStudyRoom", currentMemStudyRoom);
		model.addAttribute("remainTime", remainTime);
		
		return url;
	}
	
	@RequestMapping("/tbRent/pay")
	public String tbRentPay(RentalEquipVO rentalEquipVO, Model model, HttpSession session)throws Exception{
		
		if (rentalEquipVO.getEquipCode() != null) {
			
			equipService.tbRentPay(rentalEquipVO);
		}
		
		int rentEquipNo = rentalEquipVO.getRentEquipNo();
		String qrInfo = "tablet_" + rentEquipNo;
		qr_create(rentEquipNo, qrInfo);
		File qrImage = new File("D:\\qr_image\\" + qrInfo + ".png");
		model.addAttribute("qrInfo", qrInfo);
		model.addAttribute("serverIp", getServerIp());
		model.addAttribute("message", "기기 대여 완료! 전송된 큐알코드로 반납해주세요.");
		
		return "jsonView";
	}
	
	@RequestMapping("/rent/pay/ready")
	public String payReady(Model model, RentalEquipVO rentalEquipVO , HttpServletRequest request, HttpSession session) throws Exception{
		rentalEquipVO.setStoreCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
		KakaoPayReadyVO readyVO = new KakaoPayReadyVO(request, rentalEquipVO);
		model.addAttribute("redirectUrl",kakaopayService.kakaoPayReady(readyVO));
		
		return "jsonView";
	}
	
	@RequestMapping("/rent/pay/success")
	public String paySuccess(Model model, String pg_token, HttpSession session) throws Exception{
		KakaoPayApprovalVO approvalVO = kakaopayService.kakaoPayInfo(pg_token);
		model.addAttribute("approvalVO", approvalVO);
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(approvalVO.getPartner_user_id());
		memberVO = memberService.getMember(memberVO);
		session.setAttribute("loginUser", memberVO);
		
		OwnerVO ownerVO = new OwnerVO();
		ownerVO.setStoreCode(approvalVO.getPartner_order_id());
		
		session.setAttribute("loginOwner", ownerService.selectOwnerByStoreCode(ownerVO));
		session.setAttribute("loginStore", storeService.selectStoreByCode(approvalVO.getPartner_order_id()));
		
		return "kakaopay/kakaopay_success_rentEquip.open";
	}
	
	@RequestMapping("/sendTo")
	public String sendTo(RentalEquipVO rentalEquipVO, HttpSession session, Model model)throws SQLException{
		String url = "kiosk/equip/sendTo";
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		RentalEquipVO reciveKakao = new RentalEquipVO();
		reciveKakao.setEquipTicket(rentalEquipVO.getEquipTicket());
		reciveKakao.setEquipTotalPrice(rentalEquipVO.getEquipTotalPrice());
		reciveKakao.setEquipName(rentalEquipVO.getEquipName());
		
		model.addAttribute("reciveKakao", reciveKakao);
		model.addAttribute("loginUser", loginUser);
	
		return url;
	}
	
	@RequestMapping("/send")
	public String send(RentalEquipVO rentalEquipVO, HttpSession session, Model model) {
		
		RentalEquipVO kakaoSend = new RentalEquipVO();
		kakaoSend.setEquipName(rentalEquipVO.getEquipName());
		kakaoSend.setEquipTotalPrice(rentalEquipVO.getEquipTotalPrice());
		kakaoSend.setEquipTicket(rentalEquipVO.getEquipTicket());
		kakaoSend.setQrInfo(rentalEquipVO.getQrInfo());
		model.addAttribute("kakaoSend", kakaoSend);
		
		return "jsonView";
	}
	
	public void qr_create(int rentEquipNo, String qrInfo) throws Exception{
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
	
	}
	
}
