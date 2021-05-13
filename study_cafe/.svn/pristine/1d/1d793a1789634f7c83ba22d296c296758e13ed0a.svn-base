package kr.co.scm.order.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.order.vo.CartVO;
import kr.co.scm.order.vo.LProdVO;
import kr.co.scm.order.vo.OrderVO;
import kr.co.scm.order.vo.ProdEquipVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.store.vo.StoreVO;

@Mapper("productMapper")
public interface ProductMapper {
	
	public List<LProdVO> selectLProdList() throws SQLException;
	
	public List<LProdVO> selectLprodCnt() throws SQLException;
	
	public List<LProdVO> selectLprodCntByStore(StoreVO storeVO) throws SQLException;
	
	public int selectProdAllCnt() throws SQLException;
	
	
	
	
	
	public void insertProduct(ProdEquipVO productEquip) throws SQLException;
	
	public void insertProductEquip(ProdEquipVO productEquip) throws SQLException;
	
	public void updateProduct(ProdEquipVO productEquip) throws SQLException;
	
	public void updateProductEquip(ProdEquipVO productEquip) throws SQLException;
	
	public ProdEquipVO selectProdEquipByProdCode(String productCode) throws SQLException;
	
	public ProdEquipVO selectProdByProdCode(String productCode) throws SQLException;
	
	public String selectLprodCodeByprodCode(String productCode) throws SQLException;
	
	public List<ProdEquipVO> getSerchProdEquipList(SearchCriteria cri) throws SQLException;

	public List<ProductVO> getSerchProdStoreList(SearchCriteria cri) throws SQLException;

	public List<ProductVO> selectSearchProductList(SearchCriteria cri) throws SQLException;
	
	public void updateProductCnt(CartVO cartVO) throws SQLException;

	public List<ProductVO> selectOrderProductList(OrderVO orderVO) throws SQLException;

	public List<ProdEquipVO> selectOrderAllProductList(OrderVO orderVO) throws SQLException;

	public ProductVO getProductByCartItem(CartVO cart) throws SQLException;

	
	
	public List<ProductVO> selectProductPagingList(ProductVO productVO) throws SQLException;
	
	public int selectProductPagingListCount(ProductVO productVO) throws SQLException;
	

	
}
