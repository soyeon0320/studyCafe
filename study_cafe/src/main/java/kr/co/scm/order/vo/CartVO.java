package kr.co.scm.order.vo;

import kr.co.scm.base.vo.BaseVO;

public class CartVO extends BaseVO {
    private int orderProductNo;
    private int orderProductQuantity;
    private String productCode;
    
	public int getOrderProductNo() {
		return orderProductNo;
	}
	public void setOrderProductNo(int orderProductNo) {
		this.orderProductNo = orderProductNo;
	}
	public int getOrderProductQuantity() {
		return orderProductQuantity;
	}
	public void setOrderProductQuantity(int orderProductQuantity) {
		this.orderProductQuantity = orderProductQuantity;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
    
    
}
