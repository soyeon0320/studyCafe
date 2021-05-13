package kr.co.scm.common.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.common.dao.CodeMapper;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.store.vo.StoreVO;

@Service("codeService")
public class CodeService {
	
	@Autowired
	private CodeMapper codeMapper;

	public List<AddrVO> getAddrDonmList() throws SQLException{
		List<AddrVO> donm = codeMapper.selectDonmCode();
		return donm;
	}

	public List<AddrVO> getAddrSigugunList(AddrVO addrVO) throws SQLException{
		List<AddrVO> sigugun = codeMapper.selectSigugunCode(addrVO);
		return sigugun;
	}

	public List<CmmnCodeVO> getCodeListByLCode(CmmnCodeVO cmmnCodeVO) throws SQLException{
		List<CmmnCodeVO> codeList = codeMapper.selectCodeListByGroup(cmmnCodeVO);
		return codeList;
	}


	public String[] getAddrCode(StoreVO storeVO) throws SQLException {
		String donm = codeMapper.getAddrDonm(storeVO);
		String sigugun = codeMapper.getAddrSigugun(storeVO);
		String[] addrCode = new String[2];
		addrCode[0] = donm;
		addrCode[1] = sigugun;
		return addrCode;
	}
}
