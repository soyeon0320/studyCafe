package kr.co.scm.supply.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import kr.co.scm.order.vo.OrderVO;

public class OrderListViewVO extends OrderVO{
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date startDate;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date endDate;
	
	private String storeName; 
	private int orderProductQuantity;
	private String productCode;
	private String productName; 
	private int productPrice; 
	private int productQuantity; 
	private String productUseable;
	private String lprodCode;
	private String ownerId;
	private String ownerName;
	private String businessNumber;
	private String ownerTel;
	private Date affilateRegDate;
	private String ownerPass;
	private String storeAddr;
	
	private String formatRegDate;
	
	public String getStoreName() {
		return storeName;
	}
	public int getOrderProductQuantity() {
		return orderProductQuantity;
	}
	public String getProductCode() {
		return productCode;
	}
	public String getProductName() {
		return productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public String getProductUseable() {
		return productUseable;
	}
	public String getLprodCode() {
		return lprodCode;
	}
	public String getOwnerId() {
		return ownerId;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public String getOwnerTel() {
		return ownerTel;
	}
	public Date getAffilateRegDate() {
		return affilateRegDate;
	}
	public String getOwnerPass() {
		return ownerPass;
	}
	public String getStoreAddr() {
		return storeAddr;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public void setOrderProductQuantity(int orderProductQuantity) {
		this.orderProductQuantity = orderProductQuantity;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	public void setProductUseable(String productUseable) {
		this.productUseable = productUseable;
	}
	public void setLprodCode(String lprodCode) {
		this.lprodCode = lprodCode;
	}
	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public void setOwnerTel(String ownerTel) {
		this.ownerTel = ownerTel;
	}
	public void setAffilateRegDate(Date affilateRegDate) {
		this.affilateRegDate = affilateRegDate;
	}
	public void setOwnerPass(String ownerPass) {
		this.ownerPass = ownerPass;
	}
	public void setStoreAddr(String storeAddr) {
		this.storeAddr = storeAddr;
	}
	public Date getStartDate() {
		return startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getFormatRegDate() {
		return formatRegDate;
	}
	public void setFormatRegDate(String formatRegDate) {
		this.formatRegDate = formatRegDate;
	}
	
	@Override
	public void setOrderProductRegDate(Date orderProductRegDate) {
		super.setOrderProductRegDate(orderProductRegDate);
		setFormatRegDate(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(orderProductRegDate));
	}
	
	
}
