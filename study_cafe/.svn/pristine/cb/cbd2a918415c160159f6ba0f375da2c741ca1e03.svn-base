package kr.co.scm.common.web;

import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.scm.user.service.MemberService;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/user")
public class UserLoginController {

	@Autowired
	private MemberService memberService;
	
	//회원가입
	@RequestMapping(value="/joinForm",method=RequestMethod.GET)
	public String joinForm() {
		String url = "user/common/join_member";
		return url;
	}
	
	
	@RequestMapping("/id_check")
	@ResponseBody
	public ResponseEntity<String> idCheck(MemberVO member){
		ResponseEntity<String> entity = null;
		
		
		MemberVO vo;
		try {
			vo = memberService.getMember(member);
			
			if (vo != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/tel_check")
	@ResponseBody
	public ResponseEntity<String> telCheck(MemberVO member){
		ResponseEntity<String> entity = null;
		MemberVO vo;
		try {
			vo = memberService.getMemberByTel(member);
			
			if (vo != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/email_check")
	@ResponseBody
	public ResponseEntity<String> emailCheck(MemberVO member){
		ResponseEntity<String> entity = null;
		MemberVO vo;
		try {
			vo = memberService.getMemberByEmail(member);
			
			if (vo != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}

	
	
	
	@RequestMapping("/join")
	public String join(MemberVO member) throws Exception{
		String url = "user/common/join_success";
		
		
		String orgMemPass = member.getMemPass();
		
		try {
			String memPass = DigestUtils.sha256Hex(orgMemPass);
			member.setMemPass(memPass);
			
			memberService.registMember(member);
		} catch (Exception e) {
			url="user/common/join_fail";
		}
		
		return url;
	}
	
	
	//회원 로그인
	@RequestMapping(value="/loginForm",method=RequestMethod.GET)
	public String loginForm() {
		String url = "user/common/loginForm_member";
		return url;
	}
	
	@RequestMapping("/loginUser")
	public String loginUser(HttpSession session,RedirectAttributes rttr, MemberVO member) throws SQLException {
		String url = "redirect:/home";
		String message = "";
		MemberVO vo = memberService.getMember(member);
		if (vo != null) {
			String memPass = DigestUtils.sha256Hex(member.getMemPass());
			if (vo.getMemPass().equals(memPass)) { //로그인 성공
				session.setAttribute("loginUser", vo);
				
/*				String redirectUrl = (String) session.getAttribute("redirectUrl");
				if (redirectUrl != null && !"".equals(redirectUrl)) {
					url = "redirect:"+redirectUrl;
					session.removeAttribute("redirectUrl");
				}*/
				
			}else {
				message = "아이디 또는 패스워드가 틀렸습니다.";
				url="redirect:/user/loginForm";
			}
		}else {
			message="존재하지 않는 아이디입니다.";
			url="redirect:/user/loginForm";
		}
		rttr.addFlashAttribute("message",message);
		return url;
	}
	
	@RequestMapping("/findForm_id")
	public String findIdForm() {
		return "user/common/find_id.open";
	}
	
	@RequestMapping("/findId")
	public String findId(RedirectAttributes rttr, MemberVO member,HttpServletRequest request) throws SQLException {
		String url = "user/common/find_id_success.open";
		
		MemberVO vo = memberService.findId(member);
		if (vo != null) {
			request.setAttribute("member", vo);
		}else {
			rttr.addFlashAttribute("message", "일치하는 회원 정보가 없습니다.");
			url = "redirect:/user/findForm_id";
		}
		return url;
	}
	
	@RequestMapping("/findForm_pw")
	public String findPwForm() {
		return "user/common/find_pw.open";
	}
	
	
	@RequestMapping(value="/sendMail", method=RequestMethod.POST)
	public String sendMailPw(MemberVO member, RedirectAttributes rttr, HttpServletRequest request) throws SQLException {
		MemberVO vo = memberService.findPw(member);
		
		if (vo != null) {
			int rnd = new Random().nextInt(100000) + 10000; 
			String pass = String.valueOf(rnd);
			member.setMemPass(DigestUtils.sha256Hex(pass));
			memberService.modifyPass(member);
			
			String subject = "[Spring Study] 스터디 카페 임시비밀번호 발급 안내입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("안녕하십니까 Spring Study 입니다. \n"
					+"고객님의 임시 비밀번호는 [ " + pass + " ] 입니다. \n"
					+"정보 보호를 위해 비밀번호는 바로 변경해주시길 바랍니다.");
			memberService.send(subject, sb.toString(),"testes01@naver.com" , vo.getMemEmail());
			
			rttr.addFlashAttribute("message","등록되어있는 고객님의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
			request.setAttribute("member", vo);
			return "user/common/modify_pw.open";
		}else {
			rttr.addFlashAttribute("message","일치하는 회원정보가 없습니다.");
			return "redirect:/user/findForm_pw";
		}
	}

	
	@RequestMapping("/check_pw")
	@ResponseBody
	public ResponseEntity<String> checkPw(MemberVO member){
		ResponseEntity<String> entity = null;
		MemberVO vo;
		try {
			member.setMemPass(DigestUtils.sha256Hex(member.getMemPass()));
			vo = memberService.getMemberByPI(member);
			
			if (vo != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@RequestMapping("/modify_pw")
	@ResponseBody
	public void modifyPw(MemberVO member) {
		try {
			member.setMemPass(DigestUtils.sha256Hex(member.getMemPass().trim()));
			memberService.modifyPass(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/logoutUser")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("loginUser");
		session.removeAttribute("useInfo");
		return "redirect:/home";
	}
	
}
