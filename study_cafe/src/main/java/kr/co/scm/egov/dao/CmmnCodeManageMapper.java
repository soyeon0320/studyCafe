package kr.co.scm.egov.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.egov.vo.CmmnCodeVO;
import kr.co.scm.egov.web.CmmnCode;

/**
*
* 공통코드에 대한 데이터 접근 클래스를 정의한다
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

@Mapper("cmmnCodeManageMapper")
public interface CmmnCodeManageMapper   {

	public int selectCmmnCodeListTotCnt(CmmnCodeVO searchVO) throws Exception;

	public List<CmmnCodeVO> selectCmmnCodeList(CmmnCodeVO searchVO) throws Exception;

	public CmmnCodeVO selectCmmnCodeDetail(CmmnCodeVO cmmnCodeVO) throws Exception;

	public void updateCmmnCode(CmmnCode cmmnCode) throws Exception;

	public void insertCmmnCode(CmmnCode cmmnCode) throws Exception;

	public void deleteCmmnCode(CmmnCode cmmnCode) ;

}
