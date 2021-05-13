package kr.co.scm.rent.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.rent.vo.TimeTableVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.vo.MemberVO;

@Mapper("rentMapper")
public interface RentMapper {


	public List<TimeTableVO> selectTimeByStudyRoomNo(TimeTableVO timetableVO) throws SQLException;

	public void insertStudyRoomRent(RentStudyRoomVO rentVO) throws SQLException;

	public void deleteStudyRoomRent(RentStudyRoomVO rentStudyRoomVO) throws SQLException;

	public RentStudyRoomVO selectRentStudyRoomDetail(RentStudyRoomVO rentStudyRoomVO) throws SQLException;
	
	/** 스터디룸 예약, 입실, 퇴실, 외출	 */
	public RentStudyRoomVO getStudyRoomReserveNo(RentStudyRoomVO rentStudyRoomVO) throws SQLException; 
	
	public String checkStudyRoomAvailable(RentStudyRoomVO rentStudyRoomVO) throws SQLException;
	

	public void insertStudyRoomRentOnKiosk(RentStudyRoomVO rentVO) throws SQLException;
	
	public List<TimeTableVO> selectTimeOnKioskByStudyRoomNo(TimeTableVO timetableVO) throws SQLException;
	
	public void checkInStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException;

	public void checkOutStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException;
	
	public void goingInStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException;

	public void goingOutStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException;
	
	public List<RentStudyRoomVO> selectRecentReservStudyroom(OwnerVO owner)throws SQLException;
	
	
	/** 좌석	예약 및 좌석 입실,퇴실,외출 */
	public void rentSeat(RentSeatVO rentSeat) throws SQLException;
	
	public String checkSeatAvailable(RentSeatVO rentSeat) throws SQLException;
	
	public void checkInSeat(RentSeatVO rentSeat) throws SQLException;
	
	public void checkOutSeat(RentSeatVO rentSeat) throws SQLException;
	
	public String getCheckedOut(RentSeatVO rentSeat) throws SQLException;
	
	public RentSeatVO getRentSeat(RentSeatVO rentSeat) throws SQLException;
	
	public void goingOut(RentSeatVO rentSeat) throws SQLException;

	public void goingIn(RentSeatVO rentSeat) throws SQLException;
	
	public RentSeatVO getSeat(MemberVO member) throws SQLException;

	public RentSeatVO getSeatIn(MemberVO loginUser)throws SQLException;

	public List<RentStudyRoomVO> getStudyroomIn(MemberVO loginUser)throws SQLException;

	public String getRentEquip(RentalEquipVO rentalEquipVO)throws SQLException;

	public RentalEquipVO nowUseEquip(RentalEquipVO rentalEquipVO)throws SQLException;

	public void rentEquipOut(RentalEquipVO rentalEquipVO) throws SQLException;

	public RentSeatVO currentMemSeat(RentSeatVO rentSeatVO)throws SQLException;

	public int curSeatTime(RentSeatVO rentSeatVO)throws SQLException;

	public RentStudyRoomVO currentMemStudyRoom(MemberVO member)throws SQLException;

	public RentSeatVO checkSeatIn(MemberVO member)throws SQLException;
	
	public List<RentalEquipVO> checkRentEquipOutByMemId(MemberVO member) throws SQLException;

	public void rentEquipEnd(RentalEquipVO rentalEquipVO)throws SQLException;

	public int overRentTime(RentalEquipVO rentalEquipVO) throws SQLException;

	public RentalEquipVO myEquip(RentalEquipVO rentalEquipVO)throws SQLException;

	public void overPayCharge(RentalEquipVO rentalEquipVO)throws SQLException;

	public RentalEquipVO overUseEquip(RentalEquipVO rentalEquipVO)throws SQLException;

	public List<RentStudyRoomVO> selectReservedList(RentStudyRoomVO rentStudyRoomVO) throws SQLException;

	public int selectReservedListCnt(RentStudyRoomVO rentStudyRoomVO) throws SQLException;

	
}
