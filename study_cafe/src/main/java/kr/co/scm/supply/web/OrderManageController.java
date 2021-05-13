package kr.co.scm.supply.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.util.PaneInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.admin.service.AdminService;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.order.service.OrderService;
import kr.co.scm.order.vo.CartRefundVO;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.supply.service.SupplyService;
import kr.co.scm.supply.vo.OrderListViewFormVO;
import kr.co.scm.supply.vo.OrderListViewVO;

@Controller
@RequestMapping("/orderProduct")
public class OrderManageController extends BaseController{
	
	@Autowired 
	private SupplyService supplyService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("/list")
	public ModelAndView list(OrderListViewVO orderListViewVO, ModelAndView mnv) throws SQLException{
		
		String url = "admin/order/list_before.admin";
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, orderListViewVO);
		List<OrderListViewVO> supplyManageList = supplyService.supplyManageList(orderListViewVO);
		
		int totalCount = supplyService.supplyManagePagingListCount(orderListViewVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		mnv.addObject("orderCodeList", codeService.getCodeListByLCode(new CmmnCodeVO("S01")));
		mnv.addObject("orderStatus", orderListViewVO.getOrderProductStatus());
		mnv.addObject("codeList", codeService.getCodeListByLCode(new CmmnCodeVO("B06")));
		mnv.addObject("supplyManageList", supplyManageList);
		mnv.addObject("paginationInfo", paginationInfo);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/supplyBefore")
	public String supplyBefore(Model model, OrderListViewVO orderListViewVO)throws SQLException{
		
		PaginationInfo supplyBeforePaginationInfo = new PaginationInfo();
//		supplyBeforePaginationInfo.setCurrentPageNo(1);
		setUpPaginationInfo(supplyBeforePaginationInfo, orderListViewVO);
		
		List<OrderListViewVO> supplyBeforeList = supplyService.supplyBeforeList(orderListViewVO);
		
		int totalCount = supplyService.supplyBeforePagingListCount(orderListViewVO);
		supplyBeforePaginationInfo.setTotalRecordCount(totalCount);
		
		
		model.addAttribute("supplyBeforeList", supplyBeforeList);
		model.addAttribute("supplyBeforePaginationInfo", supplyBeforePaginationInfo);
		
		return "jsonView";
	}
	
	@RequestMapping("/orderSuccess")
	public String orderSuccess(@RequestParam("test")int[] chkData,RedirectAttributes rttr) throws SQLException{
		String url = "redirect:/orderProduct/list";
		rttr.addFlashAttribute("myMessage", "발주 처리 확인");
		supplyService.orderCheck(chkData);
		return url;
	}
	
	@RequestMapping("/orderDetail")
	public ModelAndView orderDetail(ModelAndView mnv, int orderProductNo )throws SQLException{
		
		String url = "admin/order/detail.open";
		
		Map<String, Object> orderDetailProductList = supplyService.orderDetailProductList(orderProductNo);
		Map<String, Object> orderDetailOwnerList = supplyService.orderDetailOwnerList(orderProductNo);
		
		mnv.addAllObjects(orderDetailProductList);
		mnv.addAllObjects(orderDetailOwnerList);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	@RequestMapping("/refundSuccess")
	public String refundSuccess(@RequestParam("refund")int[] refundChk) throws SQLException{
		String url = "admin/order/refundSuccess.open";
		ProductVO productVO = new ProductVO();
		List<CartRefundVO> cartProduct =  supplyService.getRefundOrderProduct(refundChk);
		
		for(CartRefundVO cart : cartProduct) {
			String productCode = cart.getProductCode();
			int orderProductNo = cart.getOrderProductNo();
			int productQuantity  = cart.getRefundProductQuantity();
			
			productVO.setProductCode(productCode);
			productVO.setOrderProductNo(orderProductNo);
			
			productVO.setProductQuantity(productQuantity);
			
			supplyService.updateProductQuantity(productVO);
		}
		
		supplyService.refundCheck(refundChk);
		return url;
	}
	

	@RequestMapping("/qr")
	public ModelAndView qr(@RequestParam String content) {
		
		return new ModelAndView("qrcodeview", "content", content);
	}
	
	@RequestMapping("/refundList")
	public ModelAndView refundList(ModelAndView mnv)throws SQLException{
		
		String url = "admin/order/refundList.admin";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
