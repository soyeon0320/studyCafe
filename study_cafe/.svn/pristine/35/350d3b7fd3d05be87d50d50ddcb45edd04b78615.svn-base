package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.admin.vo.AdminHeaderVO;
import kr.co.scm.common.vo.StaticVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.store.vo.SummaryVO;

@Mapper("mainViewMapper")
public interface MainViewMapper {

	public List<SummaryVO> getWeeklySummary(OwnerVO owner) throws SQLException;

	public List<HashMap<String, Object>> getVocStatic(OwnerVO owner) throws SQLException;

	public AdminHeaderVO getAdminMainHeader() throws SQLException;

	public List<ProductVO> selectLowRemainList() throws SQLException;

	public List<StaticVO> selectRegionStatic() throws SQLException;

	public List<StaticVO> selectVocStatic() throws SQLException;

	public List<StaticVO> selectTotalUseForYear() throws SQLException;

	public List<StoreVO> seletRankingStoreList() throws SQLException;

}
