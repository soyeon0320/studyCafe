package kr.co.scm.order.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.command.OrderRegistCommand;
import kr.co.scm.order.dao.OrderMapper;
import kr.co.scm.order.dao.ProductMapper;
import kr.co.scm.order.vo.CartRefundVO;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.OrderDetailVO;
import kr.co.scm.order.vo.OrderVO;
import kr.co.scm.order.vo.ProdEquipVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.order.vo.RefundCommandVO;
import kr.co.scm.store.dao.StoreMapper;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.StockVO;
import kr.co.scm.supply.vo.OrderListViewVO;;

@Service("orderService")
public class OrderService  {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private StoreMapper storeMapper;

	public List<OrderListViewVO> getOrderList(OrderListViewVO orderListViewVO) throws SQLException {
		
		List<OrderListViewVO> orderList = orderMapper.selectOrderListByStoreCode(orderListViewVO);
		return orderList;
	}


	public void regist(OrderRegistCommand orc) throws SQLException{
		OrderVO orderVO = orc.toOrderVO();
		orderVO.setOrderProductStatus("OS01");
		orderMapper.insertOrder(orderVO);
		
		CartVO cartVO = new CartVO();
		cartVO.setOrderProductNo(orderVO.getOrderProductNo());
		for (LinkedHashMap<String, String> product : orc.getProductList()) {
			cartVO.setOrderProductQuantity(Integer.parseInt(product.get("orderProductQuantity")+""));
			cartVO.setProductCode(product.get("productCode"));
			orderMapper.insertCart(cartVO);
			productMapper.updateProductCnt(cartVO);
		}
		
	}


	public OrderDetailVO detail(OrderVO orderVO) throws SQLException{
		
		
		OrderDetailVO detailVO = orderMapper.selectOrderDetail(orderVO);
		
		return detailVO;
	}

	public void modifyOrderList(CartVO[] cartList)  throws SQLException {
		
		for (CartVO cartVO : cartList) {
			orderMapper.modifyCartList(cartVO);
		}
		
		int deletedNum = orderMapper.deleteEmptyProd(cartList[0]);
		
		if(deletedNum == cartList.length) {
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderProductNo(cartList[0].getOrderProductNo());
			orderMapper.deleteOrderByOrderNo(orderVO);
		}
	}


	public void deleteOrder(OrderVO orderVO) throws SQLException{
		List<CartVO> cartList = orderMapper.selectCartListByOrderNo(orderVO);
		for (CartVO cartVO : cartList) {
			orderMapper.increaseCntByDeletedCartItem(cartVO);
		}
		orderMapper.deleteCartListByOrderNo(orderVO);
		orderMapper.deleteOrderByOrderNo(orderVO);
	}


	public void getOrderProduct(OrderVO orderVO)throws SQLException{
		
		List<ProdEquipVO> productList = productMapper.selectOrderAllProductList(orderVO);
		String storeCode = storeMapper.selectStoreByOrderNo(orderVO).getStoreCode();
		for (ProdEquipVO productVO : productList) {
			if ("P101".equals(productVO.getLprodCode()) || "P102".equals(productVO.getLprodCode())) {
				for (int i = 0; i < productVO.getOrderProductQuantity(); i++) {
					RentalEquipVO rentalEquipVO  = new RentalEquipVO();
					rentalEquipVO.setLprodCode(productVO.getLprodCode());
					rentalEquipVO.setProductName(productVO.getProductName());
					rentalEquipVO.setProductEquipManufacture(productVO.getProductEquipManufacture());
					rentalEquipVO.setProductEquipRentPrice(productVO.getProductEquipRentPrice());
//					rentalEquipVO.setEquipUseable("0");
					rentalEquipVO.setStoreCode(storeCode);
					storeMapper.insertRentalEquip(rentalEquipVO);
					
				}
			}else {
				Map<String, String> search = new HashMap<String, String>();
				search.put("productCode", productVO.getProductCode());
				search.put("storeCode", storeCode);
				
				StockVO stock = storeMapper.findProductInStoreByProductCode(search);
				
				if (stock == null) {
					stock = new StockVO();
					stock.setStoreStockQuantity(productVO.getOrderProductQuantity());
					stock.setStoreCode(storeCode);
					stock.setStoreSupplyDate(new Date());
					stock.setProductCode(productVO.getProductCode());
					storeMapper.insertProductToStore(stock);
				}else {
					stock.setStoreStockQuantity(productVO.getOrderProductQuantity());
					storeMapper.addStoreStock(stock);
				}
			}
		}
		orderVO.setOrderProductStatus("OS04");
		orderMapper.updateOrderStatus(orderVO);
	}

	public void refund(RefundCommandVO refundVO) throws SQLException{
		List<CartVO> remainList = refundVO.getRemainItems();
		List<CartRefundVO> refundList = refundVO.getRefundItems();
		OrderVO orderVO = refundVO.getOrderVO();
		
		// 반품 할 목록 추가
		for (CartRefundVO cartRefundVO : refundList) {
			orderMapper.insertRefundCart(cartRefundVO);
		}
		orderVO.setOrderProductStatus("OS05");
		orderMapper.updateOrderStatus(orderVO);
		
		orderMapper.deleteCartListByOrderNo(orderVO);
		
		for (CartRefundVO cartRefundVO : refundList) {
			CartVO cartVO = new CartVO();
			BeanUtils.copyProperties(cartRefundVO, cartVO);
			cartVO.setOrderProductQuantity(cartRefundVO.getRefundProductQuantity());
			orderMapper.insertCart(cartVO);
		}
		
		
		// 미 반품 물품들 새로운 주문번호로 등록하고 매장 수령
		if(remainList != null && remainList.size() > 0) {
			
			orderVO.setOrderProductRegDate(new Date());
			orderVO.setOrderProductTotalCount(remainList.size());
			
			for (CartVO cart : remainList) {
				ProductVO product = productMapper.getProductByCartItem(cart);
				orderVO.setOrderProductTotalPrice(orderVO.getOrderProductTotalPrice() + product.getProductPrice()*cart.getOrderProductQuantity());
			}
			// 반품 합계 설정.... 흠... 자바에서 하지말고 스크립트에서?

			orderMapper.insertOrder(orderVO);
			
			for (CartVO cart : remainList) {
				cart.setOrderProductNo(orderVO.getOrderProductNo());
				orderMapper.insertCart(cart);
			}
			
			getOrderProduct(orderVO);
		}
		
		
	}


	public int getOrderListCnt(OrderListViewVO orderListViewVO) throws SQLException {
		return orderMapper.selectOrderListCntByStoreCode(orderListViewVO);
	}
}
