package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.store.vo.StudyRoomVO;
import kr.co.scm.user.vo.MemberVO;

@Mapper("studyRoomMapper")
public interface StudyRoomMapper {

	public List<RentStudyRoomVO> detailStudyRoomList(RentStudyRoomVO rentStudyRoomVO);

	public int rentStudyRoomCnt(RentStudyRoomVO searchRentStudyRoomVO)throws SQLException;

	public List<RentStudyRoomVO> selectStudyRoomMemberUsed(MemberVO loginUser) throws SQLException;

	public List<StoreVO> selectBookMarkStore(MemberVO loginUser) throws SQLException;

	public List<RentStudyRoomVO> getStudyRoomList(RentStudyRoomVO rentStudyRoomVO);

	public List<StudyRoomVO> selectStudyRoomByStoreCode(StudyRoomVO studyRoomVO)throws SQLException;

	public void insertInitList(StudyRoomVO studyRoomVO) throws SQLException;

}
