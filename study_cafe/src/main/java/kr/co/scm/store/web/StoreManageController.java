package kr.co.scm.store.web;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.command.SeatModifyCommand;
import kr.co.scm.order.service.ProductService;
import kr.co.scm.store.service.SeatService;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StockVO;
import kr.co.scm.store.vo.StoreVO;

@Controller
@RequestMapping("/store/manage")
public class StoreManageController extends BaseController{
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/seat",method=RequestMethod.GET)
	public String modfiy_seatForm(Model model, HttpServletRequest request,HttpSession session) throws SQLException{
		String url = "store/seat/modify_seat.store";
		  
		/*HttpSession session = request.getSession();
		StoreVO store = (StoreVO)session.getAttribute("store");*/
		
		StoreVO store = storeService.selectStoreByCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
		String[] seatMap = seatService.getStoreSeatMap(store);
		Map<String,List<SeatVO>> seatList = seatService.getSeatListByStoreCode(store);
		model.addAllAttributes(seatList);
		model.addAttribute("seatMap",seatMap);
		model.addAttribute("store",store);
		
		return url;
	}
	
	@RequestMapping(value="/seat",method=RequestMethod.POST,produces = "application/json;charset=utf-8;")
	public String modfiy_seat(@RequestBody SeatModifyCommand seatList,HttpSession session) throws SQLException{
		String url = "jsonView";
		
		StoreVO storeVO = storeService.selectStoreByCode(((OwnerVO)session.getAttribute("loginOwner")).getStoreCode());
		String seatMap ="";
		StringBuffer sb = new StringBuffer();
		
		List<SeatVO> locatedSeatList = seatList.getLocatedSeatList();
		
		int[] settingMap = new int[StoreVO.STORE_WIDTH*StoreVO.STORE_HEIGHT];
		for (SeatVO seat : locatedSeatList) {
			settingMap[seat.getSeatLocation()-1] = seat.getSeatNo();
		}
		
		for (int i : settingMap) {
			sb.append(i +",");
		}
		
		sb.setLength(sb.length()-1);
 		seatMap = sb.toString();
		storeVO.setStoreSeatMap(seatMap);
		storeService.modifySeatMap(storeVO);
		seatService.updateSeat(seatList.getModifiedSeatList());
		
		return url;
	}
	
	@RequestMapping(value="/stock")
	public String stockList(Model model,HttpSession session, StockVO stockVO) throws SQLException{
		String url = "store/stock/list.store";

		PaginationInfo paginationInfo = new PaginationInfo();
		
		String storeCode = ((OwnerVO)session.getAttribute("loginOwner")).getStoreCode();
		stockVO.setStoreCode(storeCode);
		setUpPaginationInfo(paginationInfo, stockVO);

		List<StockVO> stockList = storeService.getStockListByStoreCode(stockVO);
		
		int totalCount = storeService.getStockListCnt(stockVO);
		paginationInfo.setTotalRecordCount(totalCount);
		
		model.addAttribute("paginationInfo",paginationInfo);
		model.addAttribute("stockList",stockList);
		model.addAttribute("lprodList", productService.getLProdCntListByStore(storeCode));
		
		return url;
	}

	@RequestMapping(value="/modifyCnt")
	public String modiftyCnt(StockVO stockVO) throws SQLException{
		String url = "jsonView";
		storeService.modifyProductCnt(stockVO);
		return url;
	}
	
	
	
	
}
