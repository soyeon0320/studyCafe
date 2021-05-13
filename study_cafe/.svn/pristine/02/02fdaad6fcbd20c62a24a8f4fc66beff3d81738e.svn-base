package kr.co.scm.order.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.order.vo.CartRefundVO;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.OrderDetailVO;
import kr.co.scm.order.vo.OrderVO;
import kr.co.scm.supply.vo.OrderListViewVO;


@Mapper("orderMapper")
public interface OrderMapper {
	
	public List<OrderListViewVO> selectOrderListByStoreCode(OrderListViewVO orderListViewVO) throws SQLException;

	public void insertOrder(OrderVO orderVO) throws SQLException;

	public void insertCart(CartVO cartVO)throws SQLException;

	public OrderDetailVO selectOrderDetail(OrderVO orderVO) throws SQLException;

	public List<CartVO> selectCartListByOrderNo(OrderVO orderVO) throws SQLException;

	public void modifyCartList(CartVO cartList)  throws SQLException;

	public int deleteEmptyProd(CartVO cartVO)  throws SQLException;

	public void deleteOrderByOrderNo(OrderVO orderVO)  throws SQLException;

	public void deleteCartListByOrderNo(OrderVO orderVO) throws SQLException;

	public void increaseCntByDeletedCartItem(CartVO cartVO) throws SQLException;

	public void updateOrderStatus(OrderVO orderVO) throws SQLException;

	public void insertRefundCart(CartRefundVO cartRefundVO) throws SQLException;

	public int selectOrderListCntByStoreCode(OrderListViewVO orderListViewVO) throws SQLException;
	

}
