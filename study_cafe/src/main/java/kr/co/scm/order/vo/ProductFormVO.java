package kr.co.scm.order.vo;

public class ProductFormVO {

	private ProductVO productVO;
	private ProductVO searchProductVO;
	
	public ProductFormVO() {
		this.productVO = new ProductVO();
		this.searchProductVO = new ProductVO();
	}
	
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public ProductVO getSearchProductVO() {
		return searchProductVO;
	}
	public void setSearchProductVO(ProductVO searchProductVO) {
		this.searchProductVO = searchProductVO;
	}
	
	
	
	
}
