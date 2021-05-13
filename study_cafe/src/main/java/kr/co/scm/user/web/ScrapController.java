package kr.co.scm.user.web;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.scm.user.service.ScrapService;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.ScrapManageVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Controller
@RequestMapping(value="/scrap")
public class ScrapController {
	@Autowired
	private ScrapService scrapService;
	
	@RequestMapping(value="/store/regist")
	public String storeScrapRegist(StoreScrapVO storeScrapVO) throws SQLException {
		scrapService.storeScrapRegist(storeScrapVO);
		return "jsonView";
	}
	
	@RequestMapping(value="/store/remove")
	public String storeScrapRemove(StoreScrapVO storeScrapVO) throws SQLException {
		scrapService.storeScrapRemove(storeScrapVO);
		return "jsonView";
	}

	@RequestMapping(value="/myPage/store/remove")
	public String myPageStoreScrapRemove(String[] storeCode, HttpSession session) throws SQLException {
		ScrapManageVO scrapManageVO = new ScrapManageVO();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		scrapManageVO.setMemId(loginUser.getMemId());
		scrapManageVO.setStoreCode(storeCode);
		
		scrapService.myPageStoreScrapRemove(scrapManageVO);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/myPage/free/remove")
	public String myPageFreeScrapRemove(int[] freeNo, HttpSession session) throws SQLException {
		ScrapManageVO scrapManageVO = new ScrapManageVO();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		scrapManageVO.setMemId(loginUser.getMemId());
		scrapManageVO.setFreeNo(freeNo);
		
		scrapService.myPageFreeScrapRemove(scrapManageVO);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/myPage/info/remove")
	public String myPageInfoScrapRemove(int[] infoNo, HttpSession session) throws SQLException {
		ScrapManageVO scrapManageVO = new ScrapManageVO();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		scrapManageVO.setMemId(loginUser.getMemId());
		scrapManageVO.setInfoNo(infoNo);
		
		scrapService.myPageInfoScrapRemove(scrapManageVO);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/myPage/studygroup/remove")
	public String myPageStudygroupScrapRemove(int[] studygroupNo, HttpSession session) throws SQLException {
		ScrapManageVO scrapManageVO = new ScrapManageVO();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		scrapManageVO.setMemId(loginUser.getMemId());
		scrapManageVO.setStudygroupNo(studygroupNo);
		
		scrapService.myPageStudygroupScrapRemove(scrapManageVO);
		
		return "jsonView";
	}
	
}
