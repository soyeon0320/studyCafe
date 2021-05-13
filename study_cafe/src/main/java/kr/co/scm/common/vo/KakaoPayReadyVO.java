package kr.co.scm.common.vo;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.StudyRoomRentCommandVO;
import kr.co.scm.store.vo.RentalEquipVO;

public class KakaoPayReadyVO {
	
	private String cid;
	// 가맹점 주문번호, 최대 100자
	private String partner_order_id;
	// 가맹점 회원 id, 최대 100자
	private String partner_user_id;
	private String item_name;
	private int quantity;
	private int total_amount;
	private int vat_amount;
	private int tax_free_amount;
	private String approval_url;
	private String fail_url;
	private String cancel_url;
	
    private String next_redirect_pc_url;
    private String tid;
    private Date created_at;
    
    public KakaoPayReadyVO() {}
    
    public KakaoPayReadyVO(HttpServletRequest request) {
    	
    	this.approval_url = request.getContextPath()+"/kakaopay/success";
    	this.cancel_url =  request.getContextPath()+"/kakaopay/cancel";
    	this.fail_url = request.getContextPath()+"/kakaopay/fail";
    	this.cid = "TC0ONETIME";
    	
    	
    }
    
    
    
    
	public KakaoPayReadyVO(HttpServletRequest request, StudyRoomRentCommandVO srrcVO) {
    	this.cancel_url =  "http://localhost/" + request.getContextPath()+"/kakaopay/cancel";
    	this.fail_url = "http://localhost/" + request.getContextPath()+"/kakaopay/fail";
    	this.cid = "TC0ONETIME";
		this.approval_url = "http://localhost/" + request.getContextPath() + "/rent/studyroom/pay/success";
		this.item_name = srrcVO.getStudyroomNo()+"번 방";
		this.partner_order_id = "test";
		this.partner_user_id = srrcVO.getMemId();
		this.quantity = srrcVO.getStudyroomReservEnd() - srrcVO.getStudyroomReservStart();
		this.total_amount = srrcVO.toRentStudyRoomVO().getStudyroomTotalPrice();
		this.tax_free_amount = this.total_amount/10;
	}
	
	public KakaoPayReadyVO(HttpServletRequest request, RentalEquipVO rentalEquipVO) {
		this.cancel_url =  "http://localhost/" + request.getContextPath()+"/kakaopay/cancel";
		this.fail_url = "http://localhost/" + request.getContextPath()+"/kakaopay/fail";
		this.cid = "TC0ONETIME";
		this.approval_url = "http://localhost/" + request.getContextPath() + "/equip/rent/pay/success";
		this.item_name = rentalEquipVO.getEquipName();
		this.partner_order_id = rentalEquipVO.getStoreCode();
		this.partner_user_id = rentalEquipVO.getMemId();
		this.quantity = 1;
		this.total_amount = rentalEquipVO.getEquipTotalPrice();
		this.tax_free_amount = this.total_amount/10;
	}
	
	public KakaoPayReadyVO(HttpServletRequest request, RentSeatVO rentSeatVO) {
		this.cancel_url =  "http://localhost/" + request.getContextPath()+"/kakaopay/cancel";
		this.fail_url = "http://localhost/" + request.getContextPath()+"/kakaopay/fail";
		this.cid = "TC0ONETIME";
		this.approval_url = "http://localhost/" + request.getContextPath() + "/equip/rent/pay/success";
		this.item_name = rentSeatVO.getTicketName();
		this.partner_order_id = rentSeatVO.getStoreCode();
		this.partner_user_id = rentSeatVO.getMemId();
		this.quantity = 1;
		this.total_amount = rentSeatVO.getTicketPrice();
		this.tax_free_amount = this.total_amount/10;
	}
	
	

	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getVat_amount() {
		return vat_amount;
	}
	public void setVat_amount(int vat_amount) {
		this.vat_amount = vat_amount;
	}
	public int getTax_free_amount() {
		return tax_free_amount;
	}
	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}
	public String getApproval_url() {
		return approval_url;
	}
	public void setApproval_url(String approval_url) {
		this.approval_url = approval_url;
	}
	public String getFail_url() {
		return fail_url;
	}
	public void setFail_url(String fail_url) {
		this.fail_url = fail_url;
	}
	public String getCancel_url() {
		return cancel_url;
	}
	public void setCancel_url(String cancel_url) {
		this.cancel_url = cancel_url;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
	
	
	
	
}
