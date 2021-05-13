package kr.co.scm.store.vo;

public class StoreFormVO{

	private StoreVO storeVO;
	private StoreVO searchStoreVO;
	
	public StoreFormVO() {
		this.storeVO = new StoreVO();
		this.searchStoreVO = new StoreVO();
	}
	
	public StoreVO getStoreVO() {
		return storeVO;
	}
	public void setStoreVO(StoreVO storeVO) {
		this.storeVO = storeVO;
	}
	public StoreVO getSearchStoreVO() {
		return searchStoreVO;
	}
	public void setSearchStoreVO(StoreVO searchStoreVO) {
		this.searchStoreVO = searchStoreVO;
	}
	
	
	
}
