package kr.co.scm.command;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import kr.co.scm.order.vo.OrderVO;

public class OrderRegistCommand {
	
	private List<LinkedHashMap<String, String>> productList;
	private int orderProductTotalPrice;
	private String storeCode;
	
	public OrderRegistCommand() {}

	public OrderRegistCommand(Map<String, Object> orderList) {
		this.productList = (List<LinkedHashMap<String, String>>)orderList.get("productList");
		this.orderProductTotalPrice = Integer.parseInt(orderList.get("orderProductTotalPrice")+"");
		this.storeCode = (String)orderList.get("storeCode");
		
	}
	public List<LinkedHashMap<String, String>> getProductList() {
		return productList;
	}
	public void setProductList(List<LinkedHashMap<String, String>> productList) {
		this.productList = productList;
	}
	public int getOrderProductTotalPrice() {
		return orderProductTotalPrice;
	}
	public void setOrderProductTotalPrice(int orderProductTotalPrice) {
		this.orderProductTotalPrice = orderProductTotalPrice;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	
	public OrderVO toOrderVO() {
		OrderVO orderVO = new OrderVO();
		
		orderVO.setStoreCode(storeCode);
		orderVO.setOrderProductRegDate(new Date());
		orderVO.setOrderProductTotalPrice(orderProductTotalPrice);
		orderVO.setOrderProductStatus("0");
		int totalCnt = 0;
		for (LinkedHashMap<String, String> product : productList) {
			totalCnt+=Integer.parseInt(product.get("orderProductQuantity")+"");
		}
		orderVO.setOrderProductTotalCount(totalCnt);
		
		
		return orderVO;
	}
	
	
	
}
