package kr.co.scm.egov.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.egov.vo.CmmnClCodeVO;
import kr.co.scm.egov.web.CmmnClCode;

/**
*
* 공통분류코드에 대한 데이터 접근 클래스를 정의한다
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
@Mapper("cmmnClCodeManageMapper")
public interface CmmnClCodeManageMapper {
	
	    public int selectCmmnClCodeListTotCnt(CmmnClCodeVO searchVO) throws Exception;
	    
	    public List<CmmnClCodeVO> selectCmmnClCodeList(CmmnClCodeVO searchVO) throws Exception;

	    public List<CmmnClCodeVO> selectAllCmmnClCode(CmmnClCodeVO searchVO) throws Exception;
	    
		public CmmnClCode selectCmmnClCodeDetail(CmmnClCode cmmnClCode) throws Exception;
		
		public void insertCmmnClCode(CmmnClCodeVO cmmnClCodeVO) throws Exception;
		
		public void deleteCmmnClCode(CmmnClCodeVO cmmnClCodeVO) throws Exception;
		
		public void updateCmmnClCode(CmmnClCodeVO cmmnClCodeVO) throws Exception;

}
