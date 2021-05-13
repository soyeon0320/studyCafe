package kr.co.scm.common.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.order.vo.LProdVO;
import kr.co.scm.store.vo.StoreVO;

@Mapper("codeMapper")
public interface CodeMapper {
	
	public List<LProdVO> getLprodList() throws SQLException;

	public List<AddrVO> selectSigugunCode(AddrVO addrVO) throws SQLException;

	public List<AddrVO> selectDonmCode() throws SQLException;
	
	public List<CmmnCodeVO> selectCodeListByGroup(CmmnCodeVO cmmnCodeVO) throws SQLException;

	public String getAddrDonm(StoreVO storeVO) throws SQLException;

	public String getAddrSigugun(StoreVO storeVO) throws SQLException;
	
}
