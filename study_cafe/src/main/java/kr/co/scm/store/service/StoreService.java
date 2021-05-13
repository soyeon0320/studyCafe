package kr.co.scm.store.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.scm.admin.dao.AdminMapper;
import kr.co.scm.admin.dao.MailMapper;
import kr.co.scm.admin.vo.AdminSalesVO;
import kr.co.scm.admin.vo.MailSendHisVO;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.mypage.vo.ReviewVO;
import kr.co.scm.rent.dao.RentMapper;
import kr.co.scm.rent.vo.RentCommandVO;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.dao.MainViewMapper;
import kr.co.scm.store.dao.StoreMapper;
import kr.co.scm.store.vo.EquipVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.StoreSalesVO;
import kr.co.scm.store.vo.SearchStoreVO;
import kr.co.scm.store.vo.StockVO;
import kr.co.scm.store.vo.StoreImageVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.store.vo.SummaryVO;

@Service("storeService")
public class StoreService  {
	@Autowired
	private StoreMapper storeMapper;
	
	@Autowired
	private MainViewMapper mainViewMapper;
	
	@Autowired
	private RentMapper rentMapper;
	
	@Autowired
	private MailMapper mailMapper;
	
	
	public StoreVO selectStoreByCode(String storeCode) throws SQLException {
		
		StoreVO storeVO = storeMapper.getStore(storeCode);
		
		return storeVO;
	}

	public void modifySeatMap(StoreVO storeVO) throws SQLException{
		storeMapper.updateStoreSeatMap(storeVO);
	}

	public List<StockVO> getStockListByStoreCode(StockVO stockVO) throws SQLException{
		return storeMapper.selectStockListByStoreCode(stockVO);
	}

	public void modifyProductCnt(StockVO stockVO) throws SQLException {
		storeMapper.updateProductCnt(stockVO);
	}

	public List<StoreVO> getStoreListByAddr(StoreVO storeVO) throws SQLException{
		List<StoreVO> storeList = storeMapper.selectSearchStoreList(storeVO);
		return storeList;
	}
	
	public int getStoreListTotalCnt(StoreVO storeVO) throws SQLException {
		int totalCnt = storeMapper.selectSearchStoreListCount(storeVO);
		return totalCnt;
	}
	
	public SearchStoreVO detail(SearchStoreVO searchStoreVO) throws SQLException {
		SearchStoreVO store = storeMapper.getSearchStore(searchStoreVO);
		store.setEquipList(storeMapper.getSearchStoreEquipmentList(searchStoreVO));
		store.setReviewList(storeMapper.selectReivewListByStore(searchStoreVO));
		return store;
	}
	
	public List<EquipVO> getStoreEquipList(SearchStoreVO searchStoreVO) throws SQLException {
		List<EquipVO> equipList = storeMapper.getSearchStoreEquipmentList(searchStoreVO);
		return equipList;
	}

	public List<StoreVO> getStoreListBySigugun(AddrVO addrVO) throws SQLException{
		List<StoreVO> storeList = storeMapper.selectSearchStoreListBySigugun(addrVO);
		return storeList;
	}

	public List<ReviewVO> selectReivewListByStoreCode(SearchStoreVO searchStoreVO) throws SQLException{
		return storeMapper.selectReivewListByStore(searchStoreVO);
	}
	
	public int getStoreReivewListCount(SearchStoreVO searchStoreVO) throws SQLException {
		int storeReviewTotalCount = storeMapper.selectReivewListByStoreCount(searchStoreVO);
		return storeReviewTotalCount;
	}
	
	public int getStoreEquipListCount(SearchStoreVO searchStoreVO) throws SQLException {
		int storeEquipTotalCount = storeMapper.selectEquipListByStoreCount(searchStoreVO);
		return storeEquipTotalCount;
	}

	
	public List<RentSeatVO> getDailySalesListBySeat(RentSeatVO rentseat) throws SQLException{
		List<RentSeatVO> dailySalesListBySeat = storeMapper.getDailySalesListBySeat(rentseat);
		return dailySalesListBySeat;
	}

	public List<RentSeatVO> getMonthlySalesListBySeat(RentSeatVO rentseat) throws SQLException{
		List<RentSeatVO> monthlySalesListBySeat = storeMapper.getMonthlySalesListBySeat(rentseat);
		return monthlySalesListBySeat;
	}
	
	public List<RentCommandVO> getHourlyInOutList(RentSeatVO rentseat) throws SQLException{
		List<RentCommandVO> hourlyInOutList = storeMapper.getHourlyInOutList(rentseat);
		return hourlyInOutList;
	}
	
	public List<RentStudyRoomVO> getDailySalesListByStudyRoom(RentSeatVO rentseat) throws SQLException{
		List<RentStudyRoomVO> dailySalesListByStudyRoom = storeMapper.getDailySalesListByStudyRoom(rentseat);
		return dailySalesListByStudyRoom;
	}

	public List<RentStudyRoomVO> getMonthlySalesListByStudyRoom(RentSeatVO rentseat) throws SQLException{
		List<RentStudyRoomVO> monthlySalesListByStudyRoom = storeMapper.getMonthlySalesListByStudyRoom(rentseat);
		return monthlySalesListByStudyRoom;
	}
	
	public List<StoreSalesVO> getDailySalesByType(RentSeatVO rentseat) throws SQLException{
		List<StoreSalesVO> salesList = new ArrayList<StoreSalesVO>();
		List<RentSeatVO> dailySalesListBySeat = storeMapper.getDailySalesListBySeat(rentseat);
		List<RentStudyRoomVO> dailySalesListByStudyRoom = storeMapper.getDailySalesListByStudyRoom(rentseat);
		List<RentalEquipVO> dailySalesListByEquip = storeMapper.getDailySalesListByEquip(rentseat);
		for (int i = dailySalesListBySeat.size()-1; i > 0 ; i--) {
			StoreSalesVO sales = new StoreSalesVO();
			sales.setDay(dailySalesListBySeat.get(i).getSeatOut());
			sales.setSeatSales(dailySalesListBySeat.get(i).getSeatTotalTime());
			sales.setStudyroomSales(dailySalesListByStudyRoom.get(i).getStudyroomTotalPrice());
			sales.setEquipSales(dailySalesListByEquip.get(i).getEquipTotalPrice());
			salesList.add(sales);
		}
		
		return salesList;
	}
	
	public List<StoreSalesVO> getDailySalesByTypeDESC(RentSeatVO rentseat) throws SQLException{
		List<StoreSalesVO> salesList = new ArrayList<StoreSalesVO>();
		List<RentSeatVO> dailySalesListBySeat = storeMapper.getDailySalesListBySeat(rentseat);
		List<RentStudyRoomVO> dailySalesListByStudyRoom = storeMapper.getDailySalesListByStudyRoom(rentseat);
		List<RentalEquipVO> dailySalesListByEquip = storeMapper.getDailySalesListByEquip(rentseat);
		for (int i = 0; i < dailySalesListBySeat.size() ; i++) {
			StoreSalesVO sales = new StoreSalesVO();
			sales.setDay(dailySalesListBySeat.get(i).getSeatOut());
			sales.setSeatSales(dailySalesListBySeat.get(i).getSeatTotalTime());
			sales.setStudyroomSales(dailySalesListByStudyRoom.get(i).getStudyroomTotalPrice());
			sales.setEquipSales(dailySalesListByEquip.get(i).getEquipTotalPrice());
			salesList.add(sales);
		}
		
		return salesList;
	}
	
	public Map<String, Integer> getSalesByType(RentSeatVO rentseat) throws SQLException{
		Map<String, Integer> salesMap = new HashMap<String, Integer>();
		salesMap.put("seat", storeMapper.getTotalRentSeat(rentseat));
		salesMap.put("studyroom", storeMapper.getTotalRentStudyRoom(rentseat));
		salesMap.put("eqiup", storeMapper.getTotalRentEqiup(rentseat));
		
		return salesMap;
	}

	public void getAndSetStoreMainDashBoard(Model model, OwnerVO owner) throws SQLException{
		SearchStoreVO storeVO = new SearchStoreVO();
		BeanUtils.copyProperties(owner, storeVO); 
		
		List<HashMap<String, Object>> vocStatic = mainViewMapper.getVocStatic(owner);
		List<SummaryVO> weeklySummary = mainViewMapper.getWeeklySummary(owner);
		storeVO.setFirstIndex(0);
		List<ReviewVO> storeReivew = storeMapper.selectReivewListByStore(storeVO);
		List<MailSendHisVO> receviedMail = mailMapper.selectRecentMailList(owner);
		
		model.addAttribute("todaySale", weeklySummary.get(0).getSales());
		model.addAttribute("weeklySummary", weeklySummary);
		model.addAttribute("vocStatic", vocStatic);
		model.addAttribute("storeReivew", storeReivew);
		model.addAttribute("receviedMail", receviedMail);
		model.addAttribute("recentReservHistory", rentMapper.selectRecentReservStudyroom(owner));

	}

	public void updateStore(StoreVO storeVO) throws SQLException {
		storeMapper.updateStore(storeVO);
	}

	public List<StoreImageVO> getStoreImgList(StoreVO storeDetail) throws SQLException{
		return storeMapper.selectStoreImgList(storeDetail);
	}

	public void insertStoreImage(StoreImageVO imageVO) throws SQLException {
		storeMapper.insertStoreImage(imageVO);
	}

	public void deleteStoreImage(StoreImageVO storeImageVO) throws SQLException{
		storeMapper.deleteStoreImage(storeImageVO);
	}

	public StoreImageVO getStoreImage(StoreImageVO storeImageVO) throws SQLException{
		return storeMapper.getStoreImage(storeImageVO);
	}
	
	public void getChart(OwnerVO owner,Model model) throws SQLException{
		SearchStoreVO storeVO = new SearchStoreVO();
		BeanUtils.copyProperties(owner, storeVO); 
		List<HashMap<String, Object>> vocStatic = mainViewMapper.getVocStatic(owner);
		List<SummaryVO> weeklySummary = mainViewMapper.getWeeklySummary(owner);
		model.addAttribute("weeklySummary", weeklySummary);
		model.addAttribute("vocStatic", vocStatic);
	}
	
	
	
	public List<EquipVO> getEquipPagingList(SearchStoreVO searchStoreVO) throws SQLException {
		return storeMapper.selectEquipPagingList(searchStoreVO);
	}
	public int getEquipPagingListCnt(SearchStoreVO searchStoreVO) throws SQLException{
		return storeMapper.selectEquipPagingListCnt(searchStoreVO);
	}

	public SearchStoreVO storeDetail(SearchStoreVO searchStoreVO) throws SQLException{
		return storeMapper.getSearchStore(searchStoreVO);
	}

	public int getStockListCnt(StockVO stockVO) throws SQLException{
		return storeMapper.getStockListCnt(stockVO);
	}

	public boolean getSeatExgistFlag(String storeCode) throws SQLException{
		int cnt = storeMapper.getSeatExgistFlag(storeCode);
		if(cnt > 0) {
			return true;
		}
		return false;
	}

	public Object getStoreUseInfo(StoreVO store) throws SQLException{
		return storeMapper.getUseInfo(store);
	}
	
	
	
	
	
}

