package kr.co.scm.order.vo;

import kr.co.scm.base.vo.BaseVO;

public class CartRefundVO extends BaseVO{
    private int orderProductNo;
    private int refundProductQuantity;
    private String productCode;
    
	public int getOrderProductNo() {
		return orderProductNo;
	}
	public void setOrderProductNo(int orderProductNo) {
		this.orderProductNo = orderProductNo;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public int getRefundProductQuantity() {
		return refundProductQuantity;
	}
	public void setRefundProductQuantity(int refundProductQuantity) {
		this.refundProductQuantity = refundProductQuantity;
	}
    
	
    
}
