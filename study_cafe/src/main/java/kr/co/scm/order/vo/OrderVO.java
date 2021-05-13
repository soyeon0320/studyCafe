package kr.co.scm.order.vo;

import java.util.Date;

import kr.co.scm.base.vo.BaseVO;

public class OrderVO extends BaseVO {
	
	private Date orderProductRegDate;
	private int orderProductNo;
	private String storeCode;
	private String orderProductStatus;
	private String orderProductStatusLabel;
	private String orderDeliveryLocation;
	private int orderProductTotalPrice;
	private int orderProductTotalCount;
	
	
	public String getOrderDeliveryLocation() {
		return orderDeliveryLocation;
	}
	public void setOrderDeliveryLocation(String orderDeliveryLocation) {
		this.orderDeliveryLocation = orderDeliveryLocation;
	}
	public Date getOrderProductRegDate() {
		return orderProductRegDate;
	}
	public void setOrderProductRegDate(Date orderProductRegDate) {
		this.orderProductRegDate = orderProductRegDate;
	}
	public int getOrderProductNo() {
		return orderProductNo;
	}
	public void setOrderProductNo(int orderProductNo) {
		this.orderProductNo = orderProductNo;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getOrderProductStatus() {
		return orderProductStatus;
	}
	public void setOrderProductStatus(String orderProductStatus) {
		this.orderProductStatus = orderProductStatus;
	}
	public int getOrderProductTotalPrice() {
		return orderProductTotalPrice;
	}
	public void setOrderProductTotalPrice(int orderProductTotalPrice) {
		this.orderProductTotalPrice = orderProductTotalPrice;
	}
	public int getOrderProductTotalCount() {
		return orderProductTotalCount;
	}
	public void setOrderProductTotalCount(int orderProductTotalCount) {
		this.orderProductTotalCount = orderProductTotalCount;
	}
	public String getOrderProductStatusLabel() {
		return orderProductStatusLabel;
	}
	public void setOrderProductStatusLabel(String orderProductStatusLabel) {
		this.orderProductStatusLabel = orderProductStatusLabel;
	}
	
	
	
	
}
