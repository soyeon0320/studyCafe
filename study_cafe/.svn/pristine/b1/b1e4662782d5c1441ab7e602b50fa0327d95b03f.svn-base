package kr.co.scm.order.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.command.SearchCriteria;
import kr.co.scm.order.dao.ProductMapper;
import kr.co.scm.order.vo.LProdVO;
import kr.co.scm.order.vo.OrderVO;
import kr.co.scm.order.vo.ProdEquipVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.store.vo.StoreVO;

@Service("productService")
public class ProductService  {
	
	protected Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private ProductMapper productMapper;
	
	public List<LProdVO> getLProdList() throws SQLException{
		List<LProdVO> lprodList = productMapper.selectLProdList();
		return lprodList;
	}
	
	public List<LProdVO> getLProdCntList() throws SQLException{
		List<LProdVO> lprodCntList = productMapper.selectLprodCnt();
		return lprodCntList;
	}
	
	public List<LProdVO> getLProdCntListByStore(String storeCode) throws SQLException{
		StoreVO storeVO = new StoreVO();
		storeVO.setStoreCode(storeCode);
		List<LProdVO> lprodCntList = productMapper.selectLprodCntByStore(storeVO);
		return lprodCntList;
	}
	
	public int getProdAllCnt() throws SQLException{
		return productMapper.selectProdAllCnt();
	}
	

	public List<ProductVO> getSerchProductList(SearchCriteria cri) throws SQLException{
		List<ProductVO> productList = productMapper.selectSearchProductList(cri);
		
		return productList;
	}
	
	public List<ProductVO> getProductList(ProductVO productVO) throws SQLException{
		List<ProductVO> productList = productMapper.selectProductPagingList(productVO);
		
		return productList;
	}
	
	public int getProductListCnt(ProductVO productVO) throws SQLException{
		return productMapper.selectProductPagingListCount(productVO);
	}

	public List<ProductVO> getOrderProductList(OrderVO orderVO) throws SQLException {
		
		List<ProductVO> productList = productMapper.selectOrderProductList(orderVO);
		
		return productList;
	}
	
	
	public void registProduct(ProdEquipVO productEquip) throws SQLException{
		productMapper.insertProduct(productEquip);
		if (productEquip.getLprodCode().equals("P101")||productEquip.getLprodCode().equals("P102")) {
			productMapper.insertProductEquip(productEquip);
		}
	}
	
	public ProdEquipVO getProduct(String productCode) throws SQLException{
		String lprodCode= productMapper.selectLprodCodeByprodCode(productCode);
		ProdEquipVO prodEquip = null;
		if (lprodCode.equals("P101") || lprodCode.equals("P102")) {
			prodEquip = productMapper.selectProdEquipByProdCode(productCode);
			return prodEquip;
		}
		prodEquip = productMapper.selectProdByProdCode(productCode);
		return prodEquip;
		
	}
	
	public void modifyProduct(ProdEquipVO productEquip) throws SQLException{
		productMapper.updateProduct(productEquip);
		if (productEquip.getLprodCode().equals("P101")||productEquip.getLprodCode().equals("P102")) {
			productMapper.updateProductEquip(productEquip);
		}
	}
	
	
	
	
	
}
