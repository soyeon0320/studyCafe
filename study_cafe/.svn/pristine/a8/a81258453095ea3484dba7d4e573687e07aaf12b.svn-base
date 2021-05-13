package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.mypage.vo.ReviewVO;
import kr.co.scm.mypage.vo.SeatReviewsVO;
import kr.co.scm.mypage.vo.StudyRoomReviewsVO;
import kr.co.scm.order.vo.OrderVO;
import kr.co.scm.rent.vo.RentCommandVO;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.vo.EquipVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.SearchStoreVO;
import kr.co.scm.store.vo.StockVO;
import kr.co.scm.store.vo.StoreImageVO;
import kr.co.scm.store.vo.StoreVO;

@Mapper("storeMapper")
public interface StoreMapper {
	public StoreVO getStore(String storeCode) throws SQLException;
	
	public StockVO findProductInStoreByProductCode(String productCode) throws SQLException;

	public void addStoreStock(StockVO stock) throws SQLException;

	public void insertProductToStore(StockVO stock) throws SQLException;

	public void insertRentalEquip(RentalEquipVO rentalEquipVO) throws SQLException;

	public StoreVO selectStoreByOrderNo(OrderVO orderVO) throws SQLException;
	
	public StockVO findProductInStoreByProductCode(Map<String, String> search) throws SQLException;

	public void updateStoreSeatMap(StoreVO storeVO) throws SQLException;

	public List<StockVO> selectStockListByStoreCode(StockVO stockVO) throws SQLException;

	public void updateProductCnt(StockVO stockVO)  throws SQLException;

	public List<StoreVO> selectSearchStoreList(StoreVO storeVO) throws SQLException;
	
	public int selectSearchStoreListCount(StoreVO storeVO) throws SQLException;
	
	public SearchStoreVO getSearchStore(SearchStoreVO searchStoreVO) throws SQLException;

	public List<StoreVO> selectSearchStoreListBySigugun(AddrVO addrVO) throws SQLException;

	public List<EquipVO> getSearchStoreEquipmentList(SearchStoreVO searchStoreVO) throws SQLException;
	
	public List<SeatReviewsVO> getSearchStoreSeatReviewsList(SearchStoreVO searchStoreVO) throws SQLException;
	
	public List<StudyRoomReviewsVO> getSearchStoreRoomReviewsList(SearchStoreVO searchStoreVO) throws SQLException;
	
	public List<ReviewVO> selectReivewListByStore(SearchStoreVO searchStoreVO) throws SQLException;

	public int selectReivewListByStoreCount(SearchStoreVO searchStoreVO) throws SQLException;
	
	public List<RentSeatVO> getDailySalesListBySeat(RentSeatVO rentseat) throws SQLException;
	
	public List<RentSeatVO> getMonthlySalesListBySeat(RentSeatVO rentseat) throws SQLException;
	
	public List<RentCommandVO> getHourlyInOutList(RentSeatVO rentseat) throws SQLException;
	
	public List<RentStudyRoomVO> getDailySalesListByStudyRoom(RentSeatVO rentseat) throws SQLException;
	
	public List<RentStudyRoomVO> getMonthlySalesListByStudyRoom(RentSeatVO rentseat) throws SQLException;
	
	public List<RentalEquipVO> getDailySalesListByEquip(RentSeatVO rentseat) throws SQLException;
	
	public int getTotalRentSeat(RentSeatVO rentseat) throws SQLException;
	
	public int getTotalRentStudyRoom(RentSeatVO rentseat) throws SQLException;
	
	public int getTotalRentEqiup(RentSeatVO rentseat) throws SQLException;

	public int selectEquipListByStoreCount(SearchStoreVO searchStoreVO) throws SQLException;
	
	public void updateStoreFrontImg(StoreVO storeVO) throws SQLException;

	public void updateStore(StoreVO storeVO) throws SQLException;

	public List<StoreImageVO> selectStoreImgList(StoreVO storeDetail) throws SQLException;

	public void insertStoreImage(StoreImageVO imageVO) throws SQLException;

	public void deleteStoreImage(StoreImageVO storeImageVO) throws SQLException;

	public StoreImageVO getStoreImage(StoreImageVO storeImageVO) throws SQLException;
	
	public List<EquipVO> selectEquipPagingList(SearchStoreVO searchStoreVO) throws SQLException;
	
	public int selectEquipPagingListCnt(SearchStoreVO searchStoreVO) throws SQLException;

	public int getStockListCnt(StockVO stockVO) throws SQLException;

	public int getSeatExgistFlag(String storeCode) throws SQLException;
	
	public StoreVO getUseInfo(StoreVO storeVO) throws SQLException;
	
}
