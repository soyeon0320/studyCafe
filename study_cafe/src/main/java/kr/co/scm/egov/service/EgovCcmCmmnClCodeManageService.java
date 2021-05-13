package kr.co.scm.egov.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.co.scm.egov.dao.CmmnClCodeManageMapper;
import kr.co.scm.egov.vo.CmmnClCodeVO;
import kr.co.scm.egov.web.CmmnClCode;

/**
*
* 공통분류코드에 대한 서비스 구현클래스를 정의한다
* 
* @author 공통서비스 개발팀 이중호
* @since 2009.04.01
* @version 1.0
* @see
*
*      <pre>
* << 개정이력(Modification Information) >>
* 
*   수정일      수정자           수정내용
*  -------    --------    ---------------------------
*   2009.04.01  이중호          최초 생성
*
* </pre>
*/
@Service("cmmnClCodeManageService")
public class EgovCcmCmmnClCodeManageService extends EgovAbstractServiceImpl {
	
	@Autowired
	private CmmnClCodeManageMapper cmmnClCodeManageMapper;
	
	/**
	 * 공통분류코드 총 갯수를 조회한다.
	 */
	
	public int selectCmmnClCodeListTotCnt(CmmnClCodeVO searchVO) throws Exception {
        return cmmnClCodeManageMapper.selectCmmnClCodeListTotCnt(searchVO);
	}
	
	/**
	 * 공통분류코드 목록을 조회한다.
	 */
	
	public List<CmmnClCodeVO> selectCmmnClCodeList(CmmnClCodeVO searchVO) throws Exception {
        return cmmnClCodeManageMapper.selectCmmnClCodeList(searchVO);
	}

	/**
	 * 공통분류코드 목록을 조회한다.
	 */
	
	public List<CmmnClCodeVO> selectAllCmmnClCodeList(CmmnClCodeVO searchVO) throws Exception {
		return cmmnClCodeManageMapper.selectAllCmmnClCode(searchVO);
	}
	
	/**
	 * 공통분류코드 상세항목을 조회한다.
	 */
	
	public CmmnClCode selectCmmnClCodeDetail(CmmnClCodeVO cmmnClCodeVO) throws Exception {
    	CmmnClCode ret = cmmnClCodeManageMapper.selectCmmnClCodeDetail(cmmnClCodeVO);
    	return ret;
	}
	
	/**
	 * 공통분류코드를 등록한다.
	 */
	
	public void insertCmmnClCode(CmmnClCodeVO cmmnClCodeVO) throws Exception {
    	cmmnClCodeManageMapper.insertCmmnClCode(cmmnClCodeVO);
	}
	
	/**
	 * 공통분류코드를 삭제한다.
	 */
	
	public void deleteCmmnClCode(CmmnClCodeVO cmmnClCodeVO) throws Exception {
		cmmnClCodeManageMapper.deleteCmmnClCode(cmmnClCodeVO);
	}
	
	/**
	 * 공통분류코드를 수정한다.
	 */
	
	public void updateCmmnClCode(CmmnClCodeVO cmmnClCodeVO) throws Exception {
		cmmnClCodeManageMapper.updateCmmnClCode(cmmnClCodeVO);
		
	}

}
