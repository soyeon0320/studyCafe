package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StoreVO;

@Mapper("seatMapper")
public interface SeatMapper {
	
	
	
	public void insertSeat(SeatVO seatVO);

	public List<SeatVO> selectSeatByStoreCode(StoreVO store);

	public int selectSeatCntByStoreCode(StoreVO store);

	public void updateSeat(SeatVO seatVO) throws SQLException;

	public List<SeatVO> selectLocatedSeatByStoreCode(StoreVO store) throws SQLException;

	public List<SeatVO> selectUnLocatedSeatByStoreCode(StoreVO store) throws SQLException;
	
}
