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
import kr.co.scm.base.web.BaseController;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.order.service.ProductService;
import kr.co.scm.order.vo.ProdEquipVO;
import kr.co.scm.order.vo.ProductFormVO;
import kr.co.scm.order.vo.ProductVO;

@Controller
@RequestMapping("/supply")
public class SupplyItemController extends BaseController{
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mnv, ProductFormVO productFormVO) throws Exception{
		List<CmmnCodeVO> statusList = codeService.getCodeListByLCode(new CmmnCodeVO("P01"));
		String url = "admin/supply/list.admin";
		
		ProductVO searchProductVO = productFormVO.getSearchProductVO();
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchProductVO);		
				
				
		List<ProductVO> prodList = productService.getProductList(searchProductVO);
		
		int totalCnt = productService.getProductListCnt(searchProductVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		
		mnv.addObject("prodList",prodList);
		mnv.addObject("paginationInfo",paginationInfo);
		mnv.addObject("statusList",statusList);
		mnv.addObject("lprodCnt",productService.getLProdCntList());
		mnv.addObject("prodAllCnt",productService.getProdAllCnt());
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/registForm")
	public String registForm(Model model) throws Exception{
		String url="admin/supply/registForm.open";
		
		model.addAttribute("lprodList",productService.getLProdList());
		
		return url;
	}
	
	
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(ProdEquipVO productEquip) throws SQLException {
		String url= "admin/supply/regist_success";

		productService.registProduct(productEquip);
		return url;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(String productCode, ModelAndView mnv) throws Exception{
		String url = "admin/supply/detail.open";
		
		ProdEquipVO prodEquip = productService.getProduct(productCode);

		mnv.addObject("product",prodEquip);
		
		mnv.setViewName(url);
		
		
		return mnv;
	}
	
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm(String productCode, ModelAndView mnv) throws Exception{
		String url = "admin/supply/modifyForm.open";
		
		ProdEquipVO prodEquip = productService.getProduct(productCode);
		
		mnv.addObject("product",prodEquip);
		mnv.addObject("lprodList",productService.getLProdList());
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modify(ProdEquipVO productEquip, ModelAndView mnv) throws Exception{
		String url ="admin/supply/modify_success.open";
		productService.modifyProduct(productEquip);
		
		mnv.addObject("product",productEquip);
		mnv.setViewName(url);
		return mnv;
		
		
	}

	
	
	
}
