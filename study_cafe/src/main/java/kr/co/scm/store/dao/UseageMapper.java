package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.store.vo.EquipVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.SeatVO;
import kr.co.scm.store.vo.StoreVO;

@Mapper("useageMapper")
public interface UseageMapper {

	List<EquipVO> equipList(EquipVO searchEquipVO) throws SQLException;

	List<SeatVO> currentSeatOccufied(StoreVO store)throws SQLException;

	List<RentSeatVO> detailSeatList(RentSeatVO rentSeatVO) throws SQLException;

	RentSeatVO currentDetailSeat(RentSeatVO rentSeatVO)throws SQLException;

	RentalEquipVO currentEquipOccufied(RentalEquipVO rentalEquipVO) throws SQLException;

	int equipListCnt(EquipVO searchEquipVO) throws SQLException;

	List<RentalEquipVO> detailEquipList(RentalEquipVO rentalEquipVO)throws SQLException;

	List<RentalEquipVO> kioskRentTabletList(RentalEquipVO searchEquipVO);

	int rentEquipListCnt(RentalEquipVO searchEquipVO)throws SQLException;

	List<RentalEquipVO> noteBookList(RentalEquipVO searchEquipVO) throws SQLException;

	EquipVO getTablet(EquipVO equipVO) throws SQLException;

	void tbRentPay(RentalEquipVO rentalEquipVO) throws SQLException;

	List<RentalEquipVO> currentEquipList(RentalEquipVO rentalEquipVO)throws SQLException;

	int[] rentTime(RentalEquipVO rentalEquipVO)throws SQLException;

	void modifyEquipUseable(RentalEquipVO rentalEquipVO)throws SQLException;

	int seatPagingList(RentSeatVO rentSeatVO)throws SQLException;

}
