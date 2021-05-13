package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.admin.service.ContractService;
import kr.co.scm.admin.vo.ContractStaticVO;
import kr.co.scm.admin.vo.ContractViewFormVO;
import kr.co.scm.admin.vo.ContractViewVO;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.store.vo.OwnerVO;

@Controller
@RequestMapping("/contract")
public class ContractController extends BaseController {
	@Autowired
	private ContractService contractService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(ModelAndView mav, ContractViewFormVO contractViewFormVO, Model model) throws SQLException {
		List<CmmnCodeVO> codeList = codeService.getCodeListByLCode(new CmmnCodeVO("B05"));
		List<CmmnCodeVO> conStaCodeList = codeService.getCodeListByLCode(new CmmnCodeVO("B07"));
		
		String url = "admin/contract/list.admin";
		
		ContractViewVO searchContractVO = contractViewFormVO.getSearchContractVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		setUpPaginationInfo(paginationInfo, searchContractVO);
		List<ContractViewVO> contractList = contractService.getContractList(searchContractVO);
		
		int totalCount = contractService.getContractListCount(searchContractVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		ContractStaticVO contractStatic = contractService.status(model);
		
		mav.addObject("contractList", contractList);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("codeList", codeList);
		mav.addObject("conStaCodeList", conStaCodeList);
		mav.addObject("contractStatic", contractStatic);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detail(ContractViewVO contractViewVO, ModelAndView mav) throws SQLException {
		String url = "admin/contract/detail.open";
		
		ContractViewVO contract = contractService.detail(contractViewVO.getStoreCode());
		
		mav.addObject("contract", contract);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String registForm() {
		String url = "store/contract/regist.open";
		return url;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView regist(OwnerVO ownerVO, ModelAndView mav) throws SQLException {
		String url = "redirect:/home";
		contractService.regist(ownerVO);
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/approval", method=RequestMethod.POST)
	public String approval(OwnerVO ownerVO) throws SQLException {
		String url = "redirect:/contract/list";
		contractService.approval(ownerVO);
		return url;
	}
	
	@RequestMapping(value="/extend", method=RequestMethod.POST)
	public String extend(OwnerVO ownerVO) throws SQLException {
		String url = "redirect:/contract/list";
		contractService.extend(ownerVO);
		return url;
	}
	
}
