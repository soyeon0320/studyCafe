package kr.co.scm.admin.web;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.command.MakeExcel;
import kr.co.scm.common.service.CodeService;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.store.service.EquipService;
import kr.co.scm.store.service.OwnerService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.EquipFormVO;
import kr.co.scm.store.vo.EquipVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.SearchStoreVO;
import kr.co.scm.store.vo.StoreFormVO;
import kr.co.scm.store.vo.StoreSalesVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Controller
@RequestMapping("/storeEquip")
public class StoreEquipController extends BaseController{

	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private CodeService codeService;
	


	
	
	@RequestMapping("/list") 
	public ModelAndView searchForm(StoreFormVO storeFormVO, ModelAndView mav) throws SQLException, ParseException {
		String url = "admin/store/list.admin";
		
		StoreVO searchStoreVO = storeFormVO.getSearchStoreVO();
		
		searchStoreVO.setStoreContractStatus("CS03");
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchStoreVO);
		
		List<StoreVO> storeList = storeService.getStoreListByAddr(searchStoreVO);
		
		int totalCount = storeService.getStoreListTotalCnt(searchStoreVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		List<AddrVO> donmList = codeService.getAddrDonmList();
		
		mav.addObject("storeList", storeList);
		mav.addObject("paginationInfo", paginationInfo);
		mav.addObject("donmList", donmList);
		mav.setViewName(url);
		
		return mav;
	}
	
	@RequestMapping(value="/sigugun")
	public String sigugun(Model model, AddrVO addrVO) throws SQLException {
		List<AddrVO> sigugunList = codeService.getAddrSigugunList(addrVO);
		model.addAttribute("sigugunList", sigugunList);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/equip/paging")
	public String equipPaging(Model model, SearchStoreVO searchStoreVO) throws SQLException {
		searchStoreVO.setPageUnit(5);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchStoreVO);
		
		List<EquipVO> equipList = storeService.getEquipPagingList(searchStoreVO);
		
		int totalCount = storeService.getEquipPagingListCnt(searchStoreVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		model.addAttribute("equipList", equipList);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "jsonView";
	}
	
	
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public String detail(Model model, SearchStoreVO searchStoreVO, HttpSession session) throws SQLException {
		SearchStoreVO store = storeService.storeDetail(searchStoreVO);
		RentSeatVO rentseat = new RentSeatVO();
		OwnerVO owner = new OwnerVO();
		owner.setStoreCode(searchStoreVO.getStoreCode());
		rentseat.setStoreCode(searchStoreVO.getStoreCode());
		storeService.getChart(owner, model);
		List<StoreSalesVO> dailySalesByType = storeService.getDailySalesByType(rentseat);
		model.addAttribute("dailySalesByType", dailySalesByType);
		
		model.addAttribute("store", store);
		
		return "jsonView";
	}


	
}
