package kr.co.scm.store.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.store.dao.SeatMapper;
import kr.co.scm.store.dao.StoreMapper;
import kr.co.scm.store.dao.UseageMapper;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StoreVO;

@Service("seatService")
public class SeatService  {
	
	@Autowired
	private SeatMapper seatMapper;
	
	@Autowired
	private StoreMapper storeMapper;

	@Autowired
	private UseageMapper useageMapper;
	
	public Map<String, List<SeatVO>> getSeatListByStoreCode(StoreVO store) throws SQLException{
		
		Map<String, List<SeatVO>> seatList = new HashMap<>();
		
		seatList.put("locatedList", seatMapper.selectLocatedSeatByStoreCode(store));
		seatList.put("unLocatedList", seatMapper.selectUnLocatedSeatByStoreCode(store));
		
		return seatList;
	}
	
	public String[] getStoreSeatMap(StoreVO storeVO) throws SQLException{
		
		if (storeVO.getStoreSeatMap() == null || "".equals(storeVO.getStoreSeatMap())) {
			StringBuffer seatMap = new StringBuffer();
			
			for (int i = 0; i < storeVO.getStoreTotalSeat(); i++) {
				SeatVO seatVO = new SeatVO();
				seatVO.setStoreCode(storeVO.getStoreCode());
				seatMapper.insertSeat(seatVO);
			}
			
			for (int i = 0; i < StoreVO.STORE_WIDTH*StoreVO.STORE_HEIGHT; i++) {
				seatMap.append("0,");
			}
			seatMap.setLength(seatMap.length()-1);
			storeVO.setStoreSeatMap(seatMap.toString());
			storeMapper.updateStoreSeatMap(storeVO);
		}
		
		return storeVO.getStoreSeatMap().split(",");
	}


	public void updateSeat(List<SeatVO> locatedSeatList) throws SQLException {
		for (SeatVO seatVO : locatedSeatList) {
			if ( seatVO != null  && seatVO.getIsModified()) {
				seatMapper.updateSeat(seatVO);
			}
		}
	}
	
	// 매장 이용관리 -> 좌석현재현황
	public Map<String,List<SeatVO>> currentSeatOccufied(StoreVO store) throws SQLException {
		
		Map<String, List<SeatVO>> seatList = new HashMap<>();
		
		seatList.put("locatedList", useageMapper.currentSeatOccufied(store));
		
		return seatList;
	}

	public List<RentSeatVO> detailSeatList(RentSeatVO rentSeatVO) throws SQLException{
		
		List<RentSeatVO> detailSeatList = useageMapper.detailSeatList(rentSeatVO);
		
		return detailSeatList;
	}

	public RentSeatVO currentDetailSeat(RentSeatVO rentSeatVO) throws SQLException {
		
		RentSeatVO currentDetailSeat = useageMapper.currentDetailSeat(rentSeatVO);
		
		return currentDetailSeat;
	}

	public int seatPagingList(RentSeatVO rentSeatVO) throws SQLException{
		return useageMapper.seatPagingList(rentSeatVO);
	}
	
	
	
}
