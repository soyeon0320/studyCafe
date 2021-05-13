package kr.co.scm.admin.web;

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
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.VocManageService;
import kr.co.scm.board.service.VocService;
import kr.co.scm.board.vo.VocFormVO;
import kr.co.scm.board.vo.VocManageVO;
import kr.co.scm.board.vo.VocVO;
import kr.co.scm.egov.vo.CmmnCodeVO;

@Controller
@RequestMapping("/vocManage")
public class VocManageController extends BaseController{
	
	@Autowired 
	VocService vocService;
	
	@Autowired
	VocManageService vocManageService;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, VocFormVO vocFormVO) throws SQLException{
		List<CmmnCodeVO> statusList =codeService.getCodeListByLCode(new CmmnCodeVO("v01"));
		String url = "admin/vocManage/list2.admin";
		
		VocVO searchVocVO = vocFormVO.getSearchVocVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchVocVO);
		
		List<VocVO> vocList = vocService.getAllVocList(searchVocVO);
		List<VocVO> statusCntList = vocService.getStatusCntList(searchVocVO);
		int totalCnt = vocService.getAllVocListCount(searchVocVO);
		
		paginationInfo.setTotalRecordCount(totalCnt);
		
		mnv.addObject("vocList", vocList);
		mnv.addObject("paginationInfo",paginationInfo);
		mnv.addObject("statusList",statusList);
		mnv.addObject("statusCntList",statusCntList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, VocFormVO vocFormVO) throws SQLException {
		String url = "admin/vocManage/detail.admin";
		VocVO vocVO = vocService.getVoc(vocFormVO.getVocVO());

		mnv.addObject("vocVO",vocVO);
		mnv.addObject("vocFormVO", vocFormVO);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/vocReply")
	public String vocReply(VocManageVO vocManageVO, Model model,HttpServletRequest request,HttpSession session ) throws SQLException {
		VocManageVO vocManage = vocManageService.getVocReplyByVocNo(vocManageVO.getVocNo());
		model.addAttribute("vocManage",vocManage);
		setSaveToken(session, vocManageVO);
		
		return "admin/vocManage/replyVoc";
	}
	
	@RequestMapping("/regist")
	public String regist(VocManageVO vocManageVO,Model model,HttpServletRequest request, HttpSession session) throws SQLException {
		
		if (isValidateSaveToken(session, vocManageVO)) {
			vocManageService.registVocReply(vocManageVO);
		}
		
		return "forward:/vocManage/detail";
	}
	
	@RequestMapping("/modifyView")
	public String modifyView(Model model, VocManageVO vocManageVO,HttpSession session ) throws SQLException{
		
		vocManageVO = vocManageService.getVocReplyByVocReplyNo(vocManageVO);
		
		model.addAttribute("vocManage",vocManageVO);
		setSaveToken(session, vocManageVO);
		
		return "jsonView"; 
	}
	
	@RequestMapping("/modify")
	public String modify(VocManageVO vocManageVO, Model model,HttpSession session) throws SQLException{
		
		if (isValidateSaveToken(session, vocManageVO)) {
			vocManageService.modifyVocReply(vocManageVO);
		}
		
		return "forward:/vocManage/detail";
	}
	
	
	
}
