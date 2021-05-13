package kr.co.scm.user.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.store.vo.SearchStoreVO;
import kr.co.scm.user.vo.ScrapManageVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Mapper("scrapMapper")
public interface ScrapMapper {
	public int selectStoreScrapCount(StoreScrapVO storeScrapVO) throws SQLException ;
	
	public void insertStoreScrap(StoreScrapVO storeScrapVO) throws SQLException ;

	public void removeStoreScrap(StoreScrapVO storeScrapVO) throws SQLException ;

	public int selectStoreScrapTotalCount(SearchStoreVO searchStoreVO) throws SQLException ;

	public void removeMyPageStoreScrap(ScrapManageVO scrapManageVO) throws SQLException;

	public void removeMyPageFreeScrap(ScrapManageVO scrapManageVO) throws SQLException;

	public void removeMyPageInfoScrap(ScrapManageVO scrapManageVO) throws SQLException;

	public void removeMyPageStudygroupScrap(ScrapManageVO scrapManageVO) throws SQLException;
}
