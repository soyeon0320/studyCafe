package kr.co.scm.store.vo;

import java.util.Date;

import kr.co.scm.order.vo.ProductVO;

public class StockVO extends ProductVO{
    private int storeStockQuantity;
    private String storeCode;
    private Date storeSupplyDate;
    private String productCode;
    
	public int getStoreStockQuantity() {
		return storeStockQuantity;
	}
	public void setStoreStockQuantity(int storeStockQuantity) {
		this.storeStockQuantity = storeStockQuantity;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}

	public Date getStoreSupplyDate() {
		return storeSupplyDate;
	}
	public void setStoreSupplyDate(Date storeSupplyDate) {
		this.storeSupplyDate = storeSupplyDate;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	
	
    
}
