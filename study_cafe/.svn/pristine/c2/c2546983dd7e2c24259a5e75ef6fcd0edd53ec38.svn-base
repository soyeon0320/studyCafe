package kr.co.scm.supply.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.command.SearchCriteria;
import kr.co.scm.order.vo.CartRefundVO;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.supply.dao.SupplyMapper;
import kr.co.scm.supply.vo.OrderListViewVO;

@Service("supplyService")
public class SupplyService {
	
	@Autowired
	private SupplyMapper supplyMapper;
	
	// 발주목록관리 리스트
	public Map<String, Object> orderManageList(SearchCriteria cri) throws SQLException{
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<OrderListViewVO> orderManageList = supplyMapper.orderManageList(cri);
		
		dataMap.put("orderManageList", orderManageList);
			
		return dataMap;
	}
	
	// 처리대기 상태값 변경
	public void updateOrderStatus(int orderProductNo) throws SQLException {
		
		supplyMapper.updateOrderStatus(orderProductNo);
	}
	
	// 체크리스트 다중 값 
	public OrderListViewVO getOrderProductNo(String chk) {
		
		OrderListViewVO getOrProNo = supplyMapper.getOrderProductNo(chk);
		
		return getOrProNo;
	}
	public void orderCheck(int[] chkData)throws SQLException {
		supplyMapper.orderCheck(chkData);
	}

	public Map<String, Object> orderDetailProductList(int orderProductNo) throws SQLException{
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<OrderListViewVO> orderDetailProductList = supplyMapper.orderDetailProductList(orderProductNo);
		
		dataMap.put("orderDetailProductList", orderDetailProductList);
		
		return dataMap;
	}
	
	public Map<String, Object> orderDetailOwnerList(int orderProductNo) throws SQLException{
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<OrderListViewVO> orderDetailOwnerList = supplyMapper.orderDetailOwnerList(orderProductNo);
		
		dataMap.put("orderDetailOwnerList", orderDetailOwnerList);
		
		return dataMap;
	}
	
	public List<OrderListViewVO> orderManagePagingList(OrderListViewVO searchOrderListViewVO)throws SQLException {
		
		return supplyMapper.orderManagePagingList(searchOrderListViewVO);
	}
	
	public int orderManagePagingListCount(OrderListViewVO searchOrderListViewVO) throws SQLException{
		return supplyMapper.orderManagePagingListCount(searchOrderListViewVO);
	}

	public void refundCheck(int[] refundChk) throws SQLException{
		supplyMapper.refundCheck(refundChk);
	}

	public List<CartRefundVO> getRefundOrderProduct(int[] refundChk) throws SQLException{
		return supplyMapper.getRefundOrderProduct(refundChk);
	}

	public void updateProductQuantity(ProductVO productVO)throws SQLException {
		
		supplyMapper.updateProductQuantity(productVO);
	}

	public List<OrderListViewVO> refundWait(OrderListViewVO searchOrderListViewVO) throws SQLException{
		return supplyMapper.refundWait(searchOrderListViewVO);
	}

	public int refundWaitPagingList(OrderListViewVO searchOrderListViewVO) throws SQLException{
		return supplyMapper.refundWaitPagingList(searchOrderListViewVO);
	}

	public List<OrderListViewVO> refundSuccessList(OrderListViewVO searchOrderListViewVO)throws SQLException {
		return supplyMapper.refundSuccessList(searchOrderListViewVO);
	}

	public int refundSuccessPagingList(OrderListViewVO searchOrderListViewVO)throws SQLException {
		return supplyMapper.refundSuccessPagingList(searchOrderListViewVO);
	}

	public List<OrderListViewVO> supplyManageList(OrderListViewVO orderListViewVO)throws SQLException {
		return supplyMapper.supplyManageList(orderListViewVO);
	}

	public int supplyManagePagingListCount(OrderListViewVO orderListViewVO)throws SQLException {
		return supplyMapper.supplyManagePagingListCount(orderListViewVO);
	}

	public List<OrderListViewVO> supplyBeforeList(OrderListViewVO orderListViewVO)throws SQLException {
		return supplyMapper.supplyBeforeList(orderListViewVO);
	}

	public int supplyBeforePagingListCount(OrderListViewVO orderListViewVO) throws SQLException{
		return supplyMapper.supplyBeforePagingListCount(orderListViewVO);
	}

//	public List<OrderListViewVO> refundReqPagingList(OrderListViewVO subSearchOrderListViewVO) throws SQLException {
//		return supplyMapper.refundReqPagingList(subSearchOrderListViewVO);
//	}
}
