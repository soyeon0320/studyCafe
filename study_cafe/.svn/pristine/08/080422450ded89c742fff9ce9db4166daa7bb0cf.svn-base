package kr.co.scm.user.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.store.vo.SearchStoreVO;
import kr.co.scm.user.dao.ScrapMapper;
import kr.co.scm.user.vo.ScrapManageVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Service("scrapService")
public class ScrapService {
	@Autowired
	private ScrapMapper scrapMapper;
	
	public int getStoreScrapCount(StoreScrapVO storeScrapVO) throws SQLException {
		int storeScrapCount = scrapMapper.selectStoreScrapCount(storeScrapVO);
		return storeScrapCount;
	}
	
	public void storeScrapRegist(StoreScrapVO storeScrapVO) throws SQLException {
		scrapMapper.insertStoreScrap(storeScrapVO);
	}

	public void storeScrapRemove(StoreScrapVO storeScrapVO) throws SQLException {
		scrapMapper.removeStoreScrap(storeScrapVO);
	}

	public int getStoreScrapTotalCount(SearchStoreVO searchStoreVO) throws SQLException {
		int storeScrapTotalCount = scrapMapper.selectStoreScrapTotalCount(searchStoreVO);
		return storeScrapTotalCount;
	}

	public void myPageStoreScrapRemove(ScrapManageVO scrapManageVO) throws SQLException {
		scrapMapper.removeMyPageStoreScrap(scrapManageVO);
	}

	public void myPageFreeScrapRemove(ScrapManageVO scrapManageVO) throws SQLException {
		scrapMapper.removeMyPageFreeScrap(scrapManageVO);
	}

	public void myPageInfoScrapRemove(ScrapManageVO scrapManageVO) throws SQLException {
		scrapMapper.removeMyPageInfoScrap(scrapManageVO);
	}

	public void myPageStudygroupScrapRemove(ScrapManageVO scrapManageVO) throws SQLException {
		scrapMapper.removeMyPageStudygroupScrap(scrapManageVO);
	}

	
}
