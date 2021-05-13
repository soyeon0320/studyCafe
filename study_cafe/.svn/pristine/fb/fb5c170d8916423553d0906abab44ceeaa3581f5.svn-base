package kr.co.scm.user.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.scm.board.vo.BoardFormVO;
import kr.co.scm.board.vo.BoardVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.board.vo.StudygroupFormVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.mypage.vo.BuyListVO;
import kr.co.scm.mypage.vo.SeatReviewsVO;
import kr.co.scm.mypage.vo.StudyRoomReviewsVO;
import kr.co.scm.user.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired 
	private MemberService memberService;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv) throws Exception{
		
		String url = "sc_member/myPage/join_member.page";
		
		return mnv;
	}
	
	@RequestMapping(value="/loginForm_member",method=RequestMethod.GET)
	public String loginForm() {
		String url = "sc_member/myPage/loginForm_member";
		return url;
	}
	
	@RequestMapping(value="/joinForm_member",method=RequestMethod.GET)
	public String joinForm() {
		String url = "sc_member/myPage/join_member";
		return url;
	}
	
	
	
}
