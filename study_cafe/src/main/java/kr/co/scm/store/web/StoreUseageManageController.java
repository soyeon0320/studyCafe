package kr.co.scm.store.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.rent.service.RentService;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.service.EquipService;
import kr.co.scm.store.service.SeatService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.service.StudyRoomService;
import kr.co.scm.store.vo.EquipFormVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.store.vo.StudyRoomVO;
import kr.co.scm.user.vo.MemberVO;

@Controller
@RequestMapping("/store/useage")
public class StoreUseageManageController extends BaseController {
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	@Autowired
	private EquipService equipService;
	
	@Autowired
	private RentService rentService;
	
	
	@RequestMapping(value="/studyRoomList", method=RequestMethod.GET)
	public ModelAndView studyRoomList(ModelAndView mnv, StudyRoomVO studyRoomVO) throws Exception{
		
		String url = "store/useageManage/useageStudyRoom/studyRoomList.store";
		
		StoreVO store = storeService.selectStoreByCode("test");
//		List<StudyRoomVO> studyRoom = studyRoomService.getStudyRoomListByStoreCode(studyRoomVO);
		
//		mnv.addObject("studyRoom", studyRoom);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/studyRoomDetail")
	public ModelAndView studyRoomDetail(ModelAndView mnv) throws Exception{
		String url = "store/useageManage/useageStudyRoom/studyRoomDetail.open";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/equipList")
	public ModelAndView equipList(HttpSession session, ModelAndView mnv, EquipFormVO equipFormVO, RentalEquipVO rentalEquipVO)throws Exception{
		
		String url = "store/useageManage/useageEquip/equipList.store";
		RentalEquipVO searchRentalEquipVO = new RentalEquipVO();
		rentalEquipVO.setStoreCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
//		PaginationInfo equipPaginationInfo = new PaginationInfo();
//		setUpPaginationInfo(equipPaginationInfo, searchEquipVO);
//		List<EquipVO> equipList = equipService.equipList(searchEquipVO);
		List<RentalEquipVO> currentEquipList = equipService.currentEquipList(rentalEquipVO);
		

		//		int totalCount = equipService.equipListCnt(searchEquipVO);
//		equipPaginationInfo.setTotalRecordCount(totalCount);
		mnv.addObject("currentEquipList", currentEquipList);
//		mnv.addObject("equipPaginationInfo", equipPaginationInfo);
		
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/equipDetail")
	public ModelAndView equipDetail(ModelAndView mnv, RentalEquipVO rentalEquipVO
			)throws Exception{
		
		String url = "jsonView";
		List<RentalEquipVO> detailEquipList = equipService.detailEquipList(rentalEquipVO);
		RentalEquipVO currentEquipOccufied = equipService.currentEquipOccufied(rentalEquipVO);
		
		mnv.addObject("detailEquipList", detailEquipList);
		mnv.addObject("currentEquipOccufied", currentEquipOccufied);
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/seatList", method=RequestMethod.GET)
	public String seatList(Model model, HttpServletRequest request,RentStudyRoomVO rentStudyRoomVO,HttpSession session)throws SQLException{
		
		String url = "store/useageManage/useageSeat/seatList.store";
		
		StoreVO store = storeService.selectStoreByCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
		String[] seatMap = seatService.getStoreSeatMap(store);
		
		Map<String,List<SeatVO>> seatList = seatService.currentSeatOccufied(store);
		
		StudyRoomVO studyRoomVO = new StudyRoomVO();
		studyRoomVO.setStoreCode(store.getStoreCode());
		
		List<StudyRoomVO> studyRoom = studyRoomService.getStudyRoomListByStoreCode(studyRoomVO);
		rentStudyRoomVO.setStoreCode(store.getStoreCode());
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, rentStudyRoomVO);
		List<RentStudyRoomVO> reservList = rentService.selectReservedList(rentStudyRoomVO);
		
		int totalCnt  = rentService.selectReservedListCnt(rentStudyRoomVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		
		model.addAllAttributes(seatList);
		model.addAttribute("seatMap",seatMap);
		model.addAttribute("store",store);
		model.addAttribute("studyRoom", studyRoom);
		model.addAttribute("reservList", reservList);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return url;
	}
	
	@RequestMapping(value="/seatList", method=RequestMethod.POST)
	public String seatDetail(Model model, RentStudyRoomVO rentStudyRoomVO, RentSeatVO rentSeatVO, HttpSession session) throws SQLException{
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		PaginationInfo paginationInfo = new PaginationInfo();
		setUpPaginationInfo(paginationInfo, rentSeatVO);
		rentSeatVO.setRecordCountPerPage(5);
		List<RentSeatVO> seatList = seatService.detailSeatList(rentSeatVO);
		RentSeatVO currentDetailSeat = seatService.currentDetailSeat(rentSeatVO);
		
		int totalCount = seatService.seatPagingList(rentSeatVO);
		paginationInfo.setRecordCountPerPage(5);
		paginationInfo.setTotalRecordCount(totalCount);
		model.addAttribute("seatList", seatList);
		model.addAttribute("currentDetailSeat", currentDetailSeat);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "jsonView";
	}
	
	@RequestMapping("/modifyEquipUseable")
	public void modifyEquipUseable(RentalEquipVO rentalEquipVO)throws SQLException{
		
		equipService.modifyEquipUseable(rentalEquipVO);
		
	}
}
