package kr.co.scm.common.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.scm.common.service.KakaopayService;

@Controller
@RequestMapping("/kakaopay")
public class KakaopayAPIController {

	@Autowired
	private KakaopayService kakaopayService;
	
	@RequestMapping("/ready")
	public String pay(Model model) {
		
		/*
		model.addAttribute("redirectUrl",kakaoPayService.kakaoPayReady(rentStudyRoomVO));
		*/
		
		return "jsonView";
	}
	
	
	@RequestMapping("/success")
	public String success(Model model,String pg_token,HttpServletRequest request) {
		// 성공하면 pg_token으로 결제 정보 재요청 함
	/*	
		KakaoPayApprovalVO resultVO = kakaoPayService.kakaoPayInfo(pg_token);
		model.addAttribute("info", resultVO);
	*/        
		return "성공했을때 가는 페이지";
	}

	@RequestMapping("/fail")
	public String fail(Model model) {
		String url = "kakaopay/kakaopay_success";
		return url;
	}
	
	@RequestMapping("/cancel")
	public String cancle(Model model) {
		String url = "jsonView";
		return url;
	}
}
