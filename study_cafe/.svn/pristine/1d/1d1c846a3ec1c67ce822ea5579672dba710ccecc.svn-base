package kr.co.scm.supply.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.order.vo.CartRefundVO;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.supply.vo.OrderListViewVO;

@Mapper("supplyMapper")
public interface SupplyMapper {
	
	public List<OrderListViewVO> orderManageList(SearchCriteria cri)throws SQLException;

	public void updateOrderStatus(int orderProductNo)throws SQLException;

	public OrderListViewVO getOrderProductNo(String chk);

	public void orderCheck(int[] chkData) throws SQLException;
	
	public List<OrderListViewVO> orderDetailProductList(int orderProductNo) throws SQLException;

	public List<OrderListViewVO> orderDetailOwnerList(int orderProductNo) throws SQLException;

	public List<OrderListViewVO> orderManagePagingList(OrderListViewVO orderListViewVO) throws SQLException;

	public int orderManagePagingListCount(OrderListViewVO orderListViewVO)throws SQLException;

	public void refundCheck(int[] refundChk)throws SQLException;

	public List<CartRefundVO> getRefundOrderProduct(int[] refundChk)throws SQLException;

	public void updateProductQuantity(ProductVO productVO)throws SQLException;

	public List<OrderListViewVO> refundWait(OrderListViewVO orderListViewVO);

	public int refundWaitPagingList(OrderListViewVO orderListViewVO);

	public List<OrderListViewVO> refundSuccessList(OrderListViewVO orderListViewVO) throws SQLException;

	public int refundSuccessPagingList(OrderListViewVO orderListViewVO)throws SQLException;

	public List<OrderListViewVO> supplyManageList(OrderListViewVO orderListViewVO)throws SQLException;

	public int supplyManagePagingListCount(OrderListViewVO orderListViewVO)throws SQLException;

	public List<OrderListViewVO> supplyBeforeList(OrderListViewVO orderListViewVO)throws SQLException;

	public int supplyBeforePagingListCount(OrderListViewVO orderListViewVO)throws SQLException;

//	public List<OrderListViewVO> refundReqPagingList(OrderListViewVO subSearchOrderListViewVO)throws SQLException;
}
