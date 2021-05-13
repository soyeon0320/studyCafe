package kr.co.scm.exception.web;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.exception.service.ErrorLogService;
import kr.co.scm.exception.vo.ErrorLogVO;

@Controller
public class ErrorLogController extends BaseController {
	
	@Autowired
	private ErrorLogService errorLogService;
	
	@RequestMapping("/error/main")
	public String main(ErrorLogVO errorLogVO,Model model) throws SQLException{
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("E01"));
		PaginationInfo paginationInfo = new PaginationInfo();
		errorLogVO.setFirstIndex(0);
		setUpPaginationInfo(paginationInfo, errorLogVO);
		List<ErrorLogVO> logList =errorLogService.selectLogList(errorLogVO);
		int totalCnt = errorLogService.selectLogListCnt(errorLogVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		model.addAttribute("errorLogVO", errorLogVO);
		model.addAttribute("logList", logList);
		model.addAttribute("codeList", codeList);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "exception/main.admin";
	}
	
	@RequestMapping("/error/detail")
	public String detail(ErrorLogVO errorLogVO,Model model) {
		
		model.addAttribute("errorLogVO", errorLogService.getErrorDetail(errorLogVO));
		
		return "jsonView";
	}
}
