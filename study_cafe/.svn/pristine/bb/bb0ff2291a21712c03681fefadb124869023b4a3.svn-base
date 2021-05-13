package kr.co.scm.order.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.command.OrderRegistCommand;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.order.service.OrderService;
import kr.co.scm.order.service.ProductService;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.OrderDetailVO;
import kr.co.scm.order.vo.OrderVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.order.vo.RefundCommandVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.supply.vo.OrderListViewVO;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController{
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping("/main")
	public String main(Model model, OrderListViewVO orderListViewVO,HttpSession session) throws SQLException{
		String url= "order/main.store";
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, orderListViewVO);
		
		OwnerVO ownerVO =(OwnerVO)session.getAttribute("loginOwner");
		orderListViewVO.setStoreCode(ownerVO.getStoreCode());
		
		List<OrderListViewVO> orderList = orderService.getOrderList(orderListViewVO);
		int totalCount = orderService.getOrderListCnt(orderListViewVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("lprodList", productService.getLProdList());
		model.addAttribute("codeList", codeService.getCodeListByLCode(new CmmnCodeVO("B06")));
		model.addAttribute("paginationInfo", paginationInfo);
		
		return url;
	}
	
	@RequestMapping(value="/orderList",method=RequestMethod.POST)
	public String getOrderList(OrderListViewVO orderListViewVO, Model model) throws SQLException{
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, orderListViewVO);
		
		List<OrderListViewVO> orderList = orderService.getOrderList(orderListViewVO);
		int totalCount = orderService.getOrderListCnt(orderListViewVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("orderList", orderList);
		
		
		return "jsonView";
	}
	
	
	

	@RequestMapping("/search")
	public String search(Model model,SearchCriteria cri) throws SQLException{
		List<ProductVO> productList = productService.getSerchProductList(cri);
		model.addAttribute("result", productList);
		
		return "jsonView";
	}
	
	
	@RequestMapping(value="/regist",produces = "application/json;charset=utf-8;")
	public String regist(@RequestBody Map<String, Object> orderList) throws SQLException{
		String url = "jsonView";
		
		OrderRegistCommand orc = new OrderRegistCommand(orderList);
		
		orderService.regist(orc);
		
		return url;
	}
	
	
	
	
	@RequestMapping("/detail")
	public String detail(OrderVO orderVO, Model model) throws SQLException{
		String url= "order/detail.open";
		OrderDetailVO orderDetailVO = orderService.detail(orderVO);
		List<ProductVO> orderProductList = productService.getOrderProductList(orderVO);
		model.addAttribute("orderDetail",orderDetailVO);
		model.addAttribute("orderProductList",orderProductList);
		
		return url;
	}

	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyForm(OrderVO orderVO,Model model) throws SQLException{
		String url= "order/modify.open";
		
		OrderDetailVO orderDetailVO = orderService.detail(orderVO);
		List<ProductVO> orderProductList = productService.getOrderProductList(orderVO);
		model.addAttribute("orderDetail",orderDetailVO);
		model.addAttribute("orderProductList",orderProductList);
		
		
		return url;
	}

	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@RequestBody CartVO[] cartList) throws SQLException{
		String url= "jsonView";
		
		orderService.modifyOrderList(cartList);
		
		
		return url;
	}
	
	@RequestMapping(value="/refund",method=RequestMethod.GET)
	public String refundForm(OrderVO orderVO,Model model) throws SQLException {
		String url= "order/refund.open";
		OrderDetailVO orderDetailVO = orderService.detail(orderVO);
		List<ProductVO> orderProductList = productService.getOrderProductList(orderVO);
		model.addAttribute("orderDetail",orderDetailVO);
		model.addAttribute("orderProductList",orderProductList);
		
		
		return url;
	}
	
	@RequestMapping(value="/refund",method=RequestMethod.POST,produces = "application/json;charset=utf-8;")
	public String refund(@RequestBody RefundCommandVO refundVO) throws SQLException{
		String url= "jsonView";
		
		orderService.refund(refundVO);
		
		return url;
	}
	
	@RequestMapping("/cancle")
	public String cancle(OrderVO orderVO) throws SQLException{
		String url= "jsonView";
		orderService.deleteOrder(orderVO);
		return url;
	}
	
	@RequestMapping("/confirm")
	public String confirm(OrderVO orderVO) throws SQLException{
		String url= "jsonView";
		orderService.getOrderProduct(orderVO); 
		
		return url;
	}
	
}
