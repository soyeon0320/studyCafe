package kr.co.scm.mypage.vo;

import kr.co.scm.base.vo.BaseVO;

public class MemberBuyListFormVO {
	
	private BuyListVO buyListVO;
	private BuyListVO searchBuyListVO;
	
	public MemberBuyListFormVO() {
		this.buyListVO = new BuyListVO();
		this.searchBuyListVO = new BuyListVO();
			
	}

	public BuyListVO getBuyListVO() {
		return buyListVO;
	}

	public void setBuyListVO(BuyListVO buyListVO) {
		this.buyListVO = buyListVO;
	}

	public BuyListVO getSearchBuyListVO() {
		return searchBuyListVO;
	}

	public void setSearchBuyListVO(BuyListVO searchBuyListVO) {
		this.searchBuyListVO = searchBuyListVO;
	}
	
	
	
}
