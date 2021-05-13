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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

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
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/str")
public class StudyRoomRentalOnKioskController extends BaseController{
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private RentService rentService;
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	@Autowired
	private KakaopayService kakaopayService;
	
	
	@RequestMapping(value="/view")
	public String main(StudyRoomRentFormVO studyRoomRentFormVO,Model model) throws SQLException {
		String url = "kiosk/rent/studyRoom.kiosk";

		model.addAttribute("donmCodeList", codeService.getAddrDonmList());
		
		StudyRoomVO studyRoom = new StudyRoomVO();
		studyRoom.setStoreCode("test");
		List<StudyRoomVO> studyRoomList = studyRoomService.getStudyRoomListByStoreCode(studyRoom);
		model.addAttribute("studyRoomList", studyRoomList);
		return url;
	}
	
	@RequestMapping("/get/studyRoomSchedule")
	public String getStudyRoomSchedule(TimeTableVO timetableVO,Model model) throws SQLException {
		
		List<TimeTableVO> timeList = rentService.getTimeListOnKiosk(timetableVO);
		model.addAttribute("timeList", timeList);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/rent",method=RequestMethod.POST)
	public String rentStudyRoom(StudyRoomRentCommandVO srrcVO,Model model,HttpSession session,RedirectAttributes redirectAttributes) throws Exception {
//		String url = "redirect:/kiosk/logout";
		RentStudyRoomVO rentVO = srrcVO.toRentStudyRoomVO();
		rentService.registStudyRoomRentOnKiosk(rentVO);
		
		// 결제번호로 큐알생성
		rentVO = rentService.getStudyRoomReserveNo(rentVO);
		int reserveNo = rentVO.getStudyroomReservNo();
		String qrInfo = "StudyRoom_" + reserveNo;
		qr_create(qrInfo);
		File qrImage = new File("D:\\qr_image\\" + qrInfo + ".png");
		model.addAttribute("qrInfo", qrInfo);
		model.addAttribute("serverIp", getServerIp());
		model.addAttribute("message", "스터디룸 예약 성공! 전송된 큐알코드로 입실하세요.");
		
		
//		redirectAttributes.addAttribute("qrInfo", qrInfo);
//		redirectAttributes.addAttribute("message", "스터디룸 예약 성공! 전송된 큐알코드로 입실하세요.");
 		return "jsonView";
	}
	
	@RequestMapping("/studyroom/pay/ready")
	public String payReady(Model model, StudyRoomRentCommandVO srrcVO, HttpServletRequest request) throws Exception{
		KakaoPayReadyVO readyVO = new KakaoPayReadyVO(request,srrcVO);
		model.addAttribute("redirectUrl",kakaopayService.kakaoPayReady(readyVO));

		return "jsonView";
	}
	

	@RequestMapping("/studyroom/pay/success")
	public String paySuccess(Model model, String pg_token) throws Exception{
		KakaoPayApprovalVO approvalVO = kakaopayService.kakaoPayInfo(pg_token);
		model.addAttribute("approvalVO", approvalVO);
		
		return "kakaopay/kakaopay_success.kiosk";
	}
	
	public void qr_create(String qrInfo) throws Exception{
	    String name = qrInfo + ".png";
	 
	    try {
	        File file = null;
	        // qr코드 이미지를 저장할 디렉토리 지정
	        file = new File("D:\\qr_image");
	        if(!file.exists()) {
	            file.mkdirs();
	        }
	        // qr코드 바코드 생성값
	        int qrcodeColor = 0x000000;
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
