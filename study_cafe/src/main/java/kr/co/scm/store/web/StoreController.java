package kr.co.scm.store.web;

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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.admin.service.ContractService;
import kr.co.scm.admin.vo.ContractViewVO;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.command.MakeExcel;
import kr.co.scm.common.service.CodeService;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.mypage.vo.ReviewVO;
import kr.co.scm.rent.vo.RentCommandVO;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.service.OwnerService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.SearchStoreVO;
import kr.co.scm.store.vo.StoreFormVO;
import kr.co.scm.store.vo.StoreSalesVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.service.ScrapService;
import kr.co.scm.user.vo.MemberVO;
import kr.co.scm.user.vo.StoreScrapVO;

@Controller
@RequestMapping("/store")
public class StoreController extends BaseController {
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private ScrapService scrapService;
	
	@Autowired
	private ContractService contractService;
	
	@RequestMapping("/main")
	public String main(HttpSession session, Model model,RedirectAttributes redirectAttributes) throws SQLException {
		String url = "store/main.store";
		
		
		RentSeatVO rentseat = new RentSeatVO();
		OwnerVO owner = (OwnerVO)session.getAttribute("loginOwner");
		owner = ownerService.selectOwnerById(owner);
		session.setAttribute("loginOwner", owner);
		String storeCode = (owner).getStoreCode();
		rentseat.setStoreCode(storeCode);
		if(!storeService.getSeatExgistFlag(storeCode)) {
			redirectAttributes.addFlashAttribute("myMessage", "가맹주님의 가입을 축하드립니다! \\n좌석을 배치 해주시길 바랍니다.");
			session.setAttribute("storeUseInfo", storeService.getStoreUseInfo((StoreVO)session.getAttribute("loginStore")));
			return url="redirect:/store/manage/seat";
		}
		
		List<RentSeatVO> dailySalesList = storeService.getDailySalesListBySeat(rentseat);
		int monthlySales = 0;
		for (RentSeatVO rentSeatVO : dailySalesList) {
			monthlySales += rentSeatVO.getSeatTotalTime();
		}
		model.addAttribute("monthlySales", monthlySales);
		StoreVO storeVO = new StoreVO();
		storeVO = storeService.selectStoreByCode(storeCode);
		model.addAttribute("loginStore", storeVO);
		storeService.getAndSetStoreMainDashBoard(model,owner);
		session.setAttribute("storeUseInfo", storeService.getStoreUseInfo((StoreVO)session.getAttribute("loginStore")));
		return url;
	}
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public ModelAndView loginForm(ModelAndView mav, HttpServletRequest request) {
		String url = "store/account/loginForm.open";
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(OwnerVO ownerVO, HttpSession session, RedirectAttributes redirectAttributes) throws SQLException {
		String url = "redirect:/store/main";
		String message = "";
		OwnerVO owner = ownerService.selectOwnerById(ownerVO);
		
		if(owner != null && owner.getOwnerId() != null) {
			if(owner.getOwnerPass().equals(ownerVO.getOwnerPass()) && "Y".equals(owner.getOwnerContractStatus())) {
				session.setAttribute("loginOwner", owner);
				session.setAttribute("loginStore", storeService.selectStoreByCode(owner.getStoreCode()));
			}else{
				message = "아이디 혹은 패스워드가 일치하지 않습니다.";
				url = "redirect:/store/loginForm";
			}
			if(owner.getOwnerPass().equals(ownerVO.getOwnerPass()) && "N".equals(owner.getOwnerContractStatus())) {
				message = "계약 미승인 혹은 계약 만료된 계정입니다.";
				url = "redirect:/store/loginForm";
			}
		}else {
			message = "존재하지 않는 계정입니다.";
			url = "redirect:/store/loginForm";
		}
	
		redirectAttributes.addFlashAttribute("message", message);
		
		return url;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginOwner");
		session.removeAttribute("loginStore");
		return "redirect:/store/loginForm";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findIdForm() {
		String url = "store/account/findIdForm.open";
		return url;
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String findId(OwnerVO ownerVO, HttpServletRequest request) throws SQLException{
		String url = "store/account/findIdSuccessForm.open";
		
		try {
			List<OwnerVO> ownerList = ownerService.findOwnerById(ownerVO);
			request.setAttribute("ownerId", ownerList.get(0).getOwnerId());
		}catch (Exception e) {
			e.printStackTrace();
			url = "store/account/findIdOrPassFail.open";
		}
		
		return url;
	}
	
	@RequestMapping(value="/findPass", method=RequestMethod.GET)
	public String findPassForm() {
		String url = "store/account/findPassForm.open";
		return url;
	}
	
	@RequestMapping(value="/findPass", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String findPass(OwnerVO ownerVO) throws SQLException {
		String url = "store/account/tempPassReceiveForm.open";
		
		try {
			ownerService.findOwnerByPass(ownerVO);
		}catch(Exception e) {
			e.printStackTrace();
			url = "store/account/findIdOrPassFail.open";
		}
		
		return url;
	}
	
	@RequestMapping(value="/changePass", method=RequestMethod.GET)
	public String changePassForm() {
		String url = "store/account/changePassForm.open";
		return url;
	}
	
	@RequestMapping(value="/changePass", method=RequestMethod.POST)
	public ModelAndView updatePw(OwnerVO ownerVO, ModelAndView mav) throws SQLException {
		String url = "store/account/changePassSuccess.open";
		
		ownerService.updatePw(ownerVO);
		
		mav.setViewName(url);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck")
	public ResponseEntity<String> idCheck(OwnerVO ownerVO) {
		ResponseEntity<String> entity = null;
		OwnerVO owner = null;
		
		try {
			owner = ownerService.selectOwnerById(ownerVO);
			if(owner != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("notDuplicated", HttpStatus.OK);
			}
		}catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/telCheck")
	public ResponseEntity<String> telCheck(OwnerVO ownerVO) {
		ResponseEntity<String> entity = null;
		OwnerVO owner = null;
		
		try {
			owner = ownerService.selectOwnerByTel(ownerVO);
			if(owner != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("notDuplicated", HttpStatus.OK);
			}
		}catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping("/emailCheck")
	public ResponseEntity<String> eamilCheck(OwnerVO ownerVO) {
		ResponseEntity<String> entity = null;
		OwnerVO owner = null;
		
		try {
			owner = ownerService.selectOwnerByEamil(ownerVO);
			if(owner != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			}else {
				entity = new ResponseEntity<String>("notDuplicated", HttpStatus.OK);
			}
		}catch(SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	@RequestMapping("/list") 
	public ModelAndView searchForm(StoreFormVO storeFormVO, ModelAndView mav) throws SQLException, ParseException {
		String url = "common/search.member";
		
		StoreVO searchStoreVO = storeFormVO.getSearchStoreVO();
		
		searchStoreVO.setPageUnit(5);
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
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public String detail(Model model, SearchStoreVO searchStoreVO, HttpSession session) throws SQLException {
		SearchStoreVO store = storeService.detail(searchStoreVO);
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
		int scrapFlag = 0;
		
		if(member != null) {
			StoreScrapVO storeScrapVO = new StoreScrapVO();
			storeScrapVO.setMemId(member.getMemId());
			storeScrapVO.setStoreCode(searchStoreVO.getStoreCode());
			scrapFlag = scrapService.getStoreScrapCount(storeScrapVO);
		}
		
		model.addAttribute("store", store);
		model.addAttribute("scrapFlag", scrapFlag);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/review/paging")
	public String reviewPaging(Model model, SearchStoreVO searchStoreVO) throws SQLException {
		searchStoreVO.setPageUnit(5);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, searchStoreVO);
		
		List<ReviewVO> reviewList = storeService.selectReivewListByStoreCode(searchStoreVO);
		
		int totalCount = storeService.getStoreReivewListCount(searchStoreVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paginationInfo", paginationInfo);
		
 		return "jsonView";
	}
	
	@RequestMapping(value="/sigugun")
	public String sigugun(Model model, AddrVO addrVO) throws SQLException {
		List<AddrVO> sigugunList = codeService.getAddrSigugunList(addrVO);
		model.addAttribute("sigugunList", sigugunList);
		
		return "jsonView";
	}
	
	@RequestMapping("/sales")
	public String sales(Model model, HttpSession session)throws SQLException {
		RentSeatVO rentseat = new RentSeatVO();
		String storeCode = ((OwnerVO)session.getAttribute("loginOwner")).getStoreCode();
		rentseat.setStoreCode(storeCode);
		
		List<RentSeatVO> dailySalesListBySeat = storeService.getDailySalesListBySeat(rentseat);
		model.addAttribute("dailySalesListBySeat", dailySalesListBySeat);
		
		List<RentSeatVO> monthlySalesListBySeat = storeService.getMonthlySalesListBySeat(rentseat);
		model.addAttribute("monthlySalesListBySeat", monthlySalesListBySeat);
		
		List<RentStudyRoomVO> dailySalesListByStudyRoom = storeService.getDailySalesListByStudyRoom(rentseat);
		model.addAttribute("dailySalesListByStudyRoom", dailySalesListByStudyRoom);
		
		List<RentStudyRoomVO> monthlySalesListByStudyRoom = storeService.getMonthlySalesListByStudyRoom(rentseat);
		model.addAttribute("monthlySalesListByStudyRoom", monthlySalesListByStudyRoom);
		
		List<RentCommandVO> hourlyInOutList = storeService.getHourlyInOutList(rentseat);
		model.addAttribute("hourlyInOutList", hourlyInOutList);
		
		Map<String, Integer> salesByType = storeService.getSalesByType(rentseat);
		model.addAttribute("salesByType", salesByType);
		
		List<StoreSalesVO> dailySalesByType = storeService.getDailySalesByType(rentseat);
		model.addAttribute("dailySalesByType", dailySalesByType);
		
		List<StoreSalesVO> dailySalesByTypeDesc = storeService.getDailySalesByTypeDESC(rentseat);
		model.addAttribute("dailySalesByTypeDesc", dailySalesByTypeDesc);
		
		return "store/sales/sales_morris_chart.store";
	}
	
	@RequestMapping(value = "/downExcel")
    public void listExcel(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception, Exception {

        
        // 그냥 평소에 마이바티스에서 데이터 뽑는 방법으로 데이터를 가져온다.
		RentSeatVO rentseat = new RentSeatVO();
		String storeCode = ((OwnerVO)session.getAttribute("loginOwner")).getStoreCode();
		rentseat.setStoreCode(storeCode);
		
		List<StoreSalesVO> dailySalesByType = storeService.getDailySalesByTypeDESC(rentseat);
        SimpleDateFormat format = new SimpleDateFormat("yy년 MM월 dd일 E요일");
        for (StoreSalesVO salesVO : dailySalesByType) {
			Date tempDate = salesVO.getDay();
			salesVO.setDayByFormat("20"+format.format(tempDate));
		}
        
        // 받은 데이터를 맵에 담는다.
        Map<String, Object> beans = new HashMap<String, Object>();
        beans.put("dailySalesList", dailySalesByType);
        
        // 엑셀 다운로드 메소드가 담겨 있는 객체
        MakeExcel me = new MakeExcel();

        me.download(request, response, beans, "dailySalesList", "Sales_template.xlsx");
        
    }

	@RequestMapping(value="/map")
	public String mapForm() {
		String url = "common/map.open";
		return url;
	}
	
	
}
