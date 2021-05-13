package kr.co.scm.supply.vo;

import kr.co.scm.base.vo.BaseVO;

public class OrderListViewFormVO extends BaseVO {
	
	private OrderListViewVO orderListViewVO;
	
	private OrderListViewVO searchOrderListViewVO;
	private OrderListViewVO subSearchOrderListViewVO;
	
	private OrderListViewVO searchRefundWaitListVO;
	private OrderListViewVO searchRefundSuccessListVO;
	
	public OrderListViewFormVO() {
		this.orderListViewVO = new OrderListViewVO();
		this.searchOrderListViewVO = new OrderListViewVO();
		this.subSearchOrderListViewVO = new OrderListViewVO();
		this.searchRefundWaitListVO = new OrderListViewVO();
		this.searchRefundSuccessListVO = new OrderListViewVO();
	}
	

	public OrderListViewVO getSubSearchOrderListViewVO() {
		return subSearchOrderListViewVO;
	}

	public void setSubSearchOrderListViewVO(OrderListViewVO subSearchOrderListViewVO) {
		this.subSearchOrderListViewVO = subSearchOrderListViewVO;
	}



	public OrderListViewVO getOrderListViewVO() {
		return orderListViewVO;
	}

	public void setOrderListViewVO(OrderListViewVO orderListViewVO) {
		this.orderListViewVO = orderListViewVO;
	}

	public OrderListViewVO getSearchOrderListViewVO() {
		return searchOrderListViewVO;
	}

	public void setSearchOrderListViewVO(OrderListViewVO searchOrderListViewVO) {
		this.searchOrderListViewVO = searchOrderListViewVO;
	}


	public OrderListViewVO getSearchRefundWaitListVO() {
		return searchRefundWaitListVO;
	}


	public void setSearchRefundWaitListVO(OrderListViewVO searchRefundWaitListVO) {
		this.searchRefundWaitListVO = searchRefundWaitListVO;
	}


	public OrderListViewVO getSearchRefundSuccessListVO() {
		return searchRefundSuccessListVO;
	}


	public void setSearchRefundSuccessListVO(OrderListViewVO searchRefundSuccessListVO) {
		this.searchRefundSuccessListVO = searchRefundSuccessListVO;
	}
	
}
