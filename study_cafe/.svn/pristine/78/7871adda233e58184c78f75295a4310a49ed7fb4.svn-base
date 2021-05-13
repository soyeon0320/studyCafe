package kr.co.scm.rent.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.common.service.KakaopayService;
import kr.co.scm.common.vo.KakaoPayCancelApprovalVO;
import kr.co.scm.common.vo.KakaoPayCancelVO;
import kr.co.scm.rent.dao.RentMapper;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.rent.vo.TimeTableVO;
import kr.co.scm.store.vo.RentalEquipVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.user.vo.MemberVO;

@Service("rentService")
public class RentService {

	@Autowired
	private RentMapper rentMapper;
	
	@Autowired
	private KakaopayService kakaopayService;

	public List<TimeTableVO> getTimeList(TimeTableVO timetableVO) throws SQLException {
		List<TimeTableVO> timeList = rentMapper.selectTimeByStudyRoomNo(timetableVO);
		return timeList;
	}

	public List<TimeTableVO> getTimeListOnKiosk(TimeTableVO timetableVO) throws SQLException {
		List<TimeTableVO> timeList = rentMapper.selectTimeOnKioskByStudyRoomNo(timetableVO);
		return timeList;
	}
	
	public void registStudyRoomRent(RentStudyRoomVO rentVO) throws SQLException{
		rentMapper.insertStudyRoomRent(rentVO);
	}

	public void registStudyRoomRentOnKiosk(RentStudyRoomVO rentVO) throws SQLException{
		rentMapper.insertStudyRoomRentOnKiosk(rentVO);
	}
	
	public KakaoPayCancelApprovalVO cancelRoomRent(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		RentStudyRoomVO rentVO = rentMapper.selectRentStudyRoomDetail(rentStudyRoomVO);
		KakaoPayCancelVO cancelVO =  new KakaoPayCancelVO(rentVO);
		KakaoPayCancelApprovalVO vo = kakaopayService.kakaoPayCancel(cancelVO);
		rentMapper.deleteStudyRoomRent(rentVO);
		
		return vo;
	}
	
	/**
	 * tid로 예약번호 가져오기
	 * @param rentStudyRoomVO
	 * @return
	 * @throws SQLException
	 */
	public RentStudyRoomVO getStudyRoomReserveNo(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		return rentMapper.getStudyRoomReserveNo(rentStudyRoomVO);
	}
	
	/**
	 * 예약번호 유효성 체크
	 * @param rentStudyRoomVO
	 * @return 유효한 예약번호 true, 유효하지 않은 예약번호 false
	 * @throws SQLException
	 */
	public boolean checkStudyRoomAvailable(RentStudyRoomVO rentStudyRoomVO) throws SQLException {
		return !"0".equals(rentMapper.checkStudyRoomAvailable(rentStudyRoomVO));
	}
	
	public void checkInStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		rentMapper.checkInStudyRoom(rentStudyRoomVO);
	}
	
	public void checkOutStudyRoom(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		rentMapper.checkOutStudyRoom(rentStudyRoomVO);
	}
	
	/** ===========좌석 =================*/
	
	public void rentSeat(RentSeatVO rentSeat) throws SQLException{
		rentMapper.rentSeat(rentSeat);
	}
	
	/**
	 * 예약번호 유효성 체크
	 * @param rentSeat
	 * @return 유효한 예약번호 true, 유효하지 않은 예약번호 false
	 * @throws SQLException
	 */
	public boolean checkSeatAvailable(RentSeatVO rentSeat) throws SQLException {
		return !"0".equals(rentMapper.checkSeatAvailable(rentSeat));
	}
	
	public void checkInSeat(RentSeatVO rentSeat) throws SQLException{
		if ("N".equals(rentSeat.getGoingOut())) {
			rentMapper.checkInSeat(rentSeat);
		} else {
			rentMapper.goingIn(rentSeat);
		}
	}
	
	public void checkOutSeat(RentSeatVO rentSeat) throws SQLException{
		rentMapper.checkOutSeat(rentSeat);
	}
	
	/**
	 * 퇴실여부 체크하는 메서드 퇴실시간이 아직 없는 경우(퇴실가능)
	 * @param rentSeat
	 * @return  퇴실시간이 아직 없는 경우(퇴실시간'0') false, 이미 퇴실한 경우 true
	 * @throws SQLException
	 */
	public boolean getCheckedOut(RentSeatVO rentSeat) throws SQLException{
		String checkedOut = rentMapper.getCheckedOut(rentSeat);
		
		return !"0".equals(checkedOut);
	}
	
	/**
	 * 예약번호로 예약정보 가져오기
	 */
	public RentSeatVO getRentSeat(RentSeatVO rentSeat) throws SQLException{
		return rentMapper.getRentSeat(rentSeat);
	}
	
	// 외출
	public void goingOut(RentSeatVO rentSeat) throws SQLException{
		rentMapper.goingOut(rentSeat);
	}
	
	// 외출 복귀
	public void goingIn(RentSeatVO rentSeat) throws SQLException{
		rentMapper.goingIn(rentSeat);
	}
	
	// 아이디로 예약여부 확인
	public RentSeatVO getSeat(MemberVO member) throws SQLException{
		return rentMapper.getSeat(member);
	}
	
	// 아이디로 좌석 입실했는지 확인
	public RentSeatVO getSeatIn(MemberVO loginUser) throws SQLException{
		return rentMapper.getSeatIn(loginUser);
	}
	// 아이디로 스터디룸 입실했는지 확인
	public List<RentStudyRoomVO> getStudyroomIn(MemberVO loginUser)throws SQLException {
		return rentMapper.getStudyroomIn(loginUser);
	}
	
	public List<RentalEquipVO> checkRentEquipOutByMemId(MemberVO member) throws SQLException{
		return rentMapper.checkRentEquipOutByMemId(member);
	}
	
	/*기기 렌트 반납 여부 반납시간 없으면 0 가져오기*/
	public boolean getRentEquip(RentalEquipVO rentalEquipVO) throws SQLException{
		
		String rentOut = rentMapper.getRentEquip(rentalEquipVO);
		
		return !"0".equals(rentOut);
	}
	// 현재 대여중인 렌탈 정보가져오기
	public RentalEquipVO nowUseEquip(RentalEquipVO rentalEquipVO)throws SQLException {
		return rentMapper.nowUseEquip(rentalEquipVO);
	}

	public void rentEquipOut(RentalEquipVO rentalEquipVO)throws SQLException {
		rentMapper.rentEquipOut(rentalEquipVO);
	}
	public List<RentStudyRoomVO> getRecentReservList(OwnerVO owner) throws SQLException{
		return rentMapper.selectRecentReservStudyroom(owner);
	}

	// 입실해있는 좌석 정보 가져오기
	public RentSeatVO currentMemSeat(RentSeatVO rentSeatVO) throws SQLException{
		return rentMapper.currentMemSeat(rentSeatVO);
	}

	public RentStudyRoomVO currentMemStudyRoom(List<RentStudyRoomVO> rentStudyRoom) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 현재 사용중인 좌석 이용시간
	public int curSeatTime(RentSeatVO rentSeatVO)throws SQLException {
		return rentMapper.curSeatTime(rentSeatVO);
	}
	
	// 현재 스터디룸을 입실했는지 파악
	public RentStudyRoomVO currentMemStudyRoom(MemberVO member)throws SQLException {
		
		return rentMapper.currentMemStudyRoom(member);
	}
	
	//좌석 : 입실 후,  퇴실 전 => 입실한 상태 
	public RentSeatVO checkSeatIn(MemberVO member) throws SQLException{
		return rentMapper.checkSeatIn(member);
	}

	public void rentEquipEnd(RentalEquipVO rentalEquipVO)throws SQLException {
		rentMapper.rentEquipEnd(rentalEquipVO);
	}

	public int overRentTime(RentalEquipVO rentalEquipVO)throws SQLException {
		return rentMapper.overRentTime(rentalEquipVO);
	}

	public RentalEquipVO myEquip(RentalEquipVO rentalEquipVO) throws SQLException{
		return rentMapper.myEquip(rentalEquipVO);
	}
	//추가요금 업뎃
	public void overPayCharge(RentalEquipVO rentalEquipVO)throws SQLException {
		rentMapper.overPayCharge(rentalEquipVO);
	}
	
	// 현재시간이 빌린시간보다 초과됐을때
	public RentalEquipVO overUseEquip(RentalEquipVO rentalEquipVO)throws SQLException {
		return rentMapper.overUseEquip(rentalEquipVO);
	}

	public List<RentStudyRoomVO> selectReservedList(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		return rentMapper.selectReservedList(rentStudyRoomVO);
	}

	public int selectReservedListCnt(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		return rentMapper.selectReservedListCnt(rentStudyRoomVO);
	}

	public RentStudyRoomVO selectRentStudyRoomVO(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		return rentMapper.selectRentStudyRoomDetail(rentStudyRoomVO);
	}

}
