package kr.co.scm.egov.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.egov.service.EgovCcmCmmnClCodeManageService;
import kr.co.scm.egov.service.EgovCcmCmmnCodeManageService;
import kr.co.scm.egov.vo.CmmnClCodeVO;
import kr.co.scm.egov.vo.CmmnCodeVO;

/**
 *
 * 공통코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
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
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2017.08.16	이정은	표준프레임워크 v3.7 개선
 *
 * </pre>
 */

@Controller
public class EgovCcmCmmnCodeManageController {

	@Autowired
	private EgovCcmCmmnCodeManageService cmmnCodeManageService;

	@Autowired
	private EgovCcmCmmnClCodeManageService cmmnClCodeManageService;

	/** EgovPropertyService */
	@Autowired
	protected EgovPropertyService propertiesService;


	/**
	 * 공통분류코드 목록을 조회한다.
	 * 
	 * @param searchVO
	 * @param model
	 * @return "egov/code/EgovCcmCmmnCodeList"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sym/ccm/cca/SelectCcmCmmnCodeList.do")
	public String selectCmmnCodeList(@ModelAttribute("searchVO") CmmnCodeVO searchVO, ModelMap model)
			throws Exception {
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<CmmnCodeVO> CmmnCodeList = cmmnCodeManageService.selectCmmnCodeList(searchVO);
		model.addAttribute("resultList", CmmnCodeList);

		int totCnt = cmmnCodeManageService.selectCmmnCodeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "egov/code/EgovCcmCmmnCodeList.admin";
	}

	/**
	 * 공통코드 상세항목을 조회한다.
	 * 
	 * @param loginVO
	 * @param cmmnCodeVO
	 * @param model
	 * @return "egov/code/EgovCcmCmmnCodeDetail"
	 * @throws Exception
	 */
	@RequestMapping(value = "/sym/ccm/cca/SelectCcmCmmnCodeDetail.do")
	public String selectCmmnCodeDetail(CmmnCodeVO cmmnCodeVO, ModelMap model) throws Exception {

		CmmnCodeVO vo = cmmnCodeManageService.selectCmmnCodeDetail(cmmnCodeVO);

		model.addAttribute("result", vo);

		return "egov/code/EgovCcmCmmnCodeDetail.admin";
	}

	/**
	 * 공통코드 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param cmmnCodeVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sym/ccm/cca/RegistCcmCmmnCodeView.do")
	public String insertCmmnCodeView(@ModelAttribute("cmmnCodeVO")CmmnCodeVO cmmnCodeVO, ModelMap model) throws Exception {

		CmmnClCodeVO searchVO = new CmmnClCodeVO();
		searchVO.setFirstIndex(0);
		List<?> CmmnCodeList = cmmnClCodeManageService.selectAllCmmnClCodeList(searchVO);

		model.addAttribute("clCodeList", CmmnCodeList);

		return "egov/code/EgovCcmCmmnCodeRegist.admin";
	}

	/**
	 * 공통코드를 등록한다.
	 * 
	 * @param CmmnCodeVO
	 * @param CmmnCodeVO
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sym/ccm/cca/RegistCcmCmmnCode.do")
	public String insertCmmnCode(@ModelAttribute("searchVO") CmmnCodeVO cmmnCode, @ModelAttribute("cmmnCodeVO") CmmnCodeVO cmmnCodeVO,
			BindingResult bindingResult, ModelMap model) throws Exception {


		CmmnClCodeVO searchVO = new CmmnClCodeVO();


		if (bindingResult.hasErrors()) {

			List<?> CmmnCodeList = cmmnClCodeManageService.selectCmmnClCodeList(searchVO);
			model.addAttribute("clCodeList", CmmnCodeList);

			return "egov/code/EgovCcmCmmnCodeRegist.admin";
		}

		if(cmmnCode.getCodeId() != null){
			CmmnCode vo = cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
			if(vo != null){
/*				model.addAttribute("message", egovMessageSource.getMessage("comSymCcmCca.validate.codeCheck"));
*/
				searchVO.setFirstIndex(0);
				List<?> CmmnCodeList = cmmnClCodeManageService.selectCmmnClCodeList(searchVO);
				model.addAttribute("clCodeList", CmmnCodeList);

				return "egov/code/EgovCcmCmmnCodeRegist.admin";
			}
		}

		cmmnCodeManageService.insertCmmnCode(cmmnCodeVO);

		return "forward:/sym/ccm/cca/SelectCcmCmmnCodeList.do";
	}

	/**
	 * 공통코드를 삭제한다.
	 * 
	 * @param cmmnCodeVO
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sym/ccm/cca/RemoveCcmCmmnCode.do")
	public String deleteCmmnCode(@ModelAttribute("cmmnCodeVO") CmmnCodeVO cmmnCodeVO,
			BindingResult bindingResult, ModelMap model) throws Exception {

		cmmnCodeManageService.deleteCmmnCode(cmmnCodeVO);

		return "forward:/sym/ccm/cca/SelectCcmCmmnCodeList.do";
	}

	/**
	 * 공통코드 수정을 위한 수정페이지로 이동한다.
	 * 
	 * @param cmmnCodeVO
	 * @param model
	 * @return "egov/code/EgovCcmCmmnCodeUpdt"
	 * @throws Exception
	 */
	@RequestMapping("/sym/ccm/cca/UpdateCcmCmmnCodeView.do")
	public String updateCmmnCodeView(@ModelAttribute("cmmnCodeVO") CmmnCodeVO cmmnCodeVO, ModelMap model)
			throws Exception {

		CmmnCode result = cmmnCodeManageService.selectCmmnCodeDetail(cmmnCodeVO);

		model.addAttribute("cmmnCodeVO", result);

		return "egov/code/EgovCcmCmmnCodeUpdt.admin";  
	}

	/**
	 * 공통코드를 수정한다.
	 * 
	 * @param cmmnCodeVO
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/sym/ccm/cca/UpdateCcmCmmnCode.do")
	public String updateCmmnCode(@ModelAttribute("searchVO") CmmnCodeVO cmmnCode, @ModelAttribute("cmmnCodeVO") CmmnCodeVO cmmnCodeVO,
			BindingResult bindingResult, ModelMap model) throws Exception {

		if (bindingResult.hasErrors()) {

			CmmnCode result = cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
			model.addAttribute("cmmnCodeVO", result);

			return "egov/code/EgovCcmCmmnCodeUpdt.admin";
		}

		cmmnCodeManageService.updateCmmnCode(cmmnCodeVO);

		return "forward:/sym/ccm/cca/SelectCcmCmmnCodeList.do";
	}


}