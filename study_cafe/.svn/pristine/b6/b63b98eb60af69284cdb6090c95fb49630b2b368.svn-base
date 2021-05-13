package kr.co.scm.egov.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.scm.egov.dao.CmmnCodeManageMapper;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.egov.web.CmmnCode;

/**
*
* 공통코드에 대한 서비스 구현클래스를 정의한다
* @author 공통서비스 개발팀 이중호
* @since 2009.04.01
* @version 1.0
* @see
*
* <pre>
* << 개정이력(Modification Information) >>
*
*   수정일      수정자           수정내용
*  -------    --------    ---------------------------
*   2009.04.01  이중호          최초 생성
*
* </pre>
*/

@Service("cmmnCodeManageService")
public class EgovCcmCmmnCodeManageService extends EgovAbstractServiceImpl  {

	@Autowired
    private CmmnCodeManageMapper cmmnCodeManageMapper;
    
	/**
	 * 공통코드 총 갯수를 조회한다.
	 */
	
	public int selectCmmnCodeListTotCnt(CmmnCodeVO searchVO) throws Exception {
        return cmmnCodeManageMapper.selectCmmnCodeListTotCnt(searchVO);
	}

	/**
	 * 공통코드 목록을 조회한다.
	 */
	
	public List<CmmnCodeVO> selectCmmnCodeList(CmmnCodeVO searchVO) throws Exception {
		return cmmnCodeManageMapper.selectCmmnCodeList(searchVO);
	}

	/**
	 * 공통코드 상세항목을 조회한다.
	 */
	
	public CmmnCodeVO selectCmmnCodeDetail(CmmnCodeVO cmmnCodeVO) throws Exception{
		CmmnCodeVO ret = cmmnCodeManageMapper.selectCmmnCodeDetail(cmmnCodeVO);
    	return ret;
	}

	/**
	 * 공통코드를 수정한다.
	 */
	
	public void updateCmmnCode(CmmnCodeVO cmmnCodeVO) throws Exception {
		cmmnCodeManageMapper.updateCmmnCode(cmmnCodeVO);
	}

	/**
	 * 공통코드를 등록한다.
	 */
	
	public void insertCmmnCode(CmmnCode cmmnCode) throws Exception {
		cmmnCodeManageMapper.insertCmmnCode(cmmnCode);
		
	}

	/**
	 * 공통코드를 삭제한다.
	 */
	
	public void deleteCmmnCode(CmmnCode cmmnCode) throws Exception {
		cmmnCodeManageMapper.deleteCmmnCode(cmmnCode);
	}

}
