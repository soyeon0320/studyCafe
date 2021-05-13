package kr.co.scm.store.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.rent.vo.RentStudyRoomVO;
import kr.co.scm.store.dao.StudyRoomMapper;
import kr.co.scm.store.vo.StudyRoomVO;
import kr.co.scm.user.vo.MemberVO;

@Service("studyRoomService")
public class StudyRoomService  {

	@Autowired
	private StudyRoomMapper studyRoomMapper;

	public List<StudyRoomVO> getStudyRoomListByStoreCode(StudyRoomVO studyRoomVO) throws SQLException{
		List<StudyRoomVO> studyRoomList = studyRoomMapper.selectStudyRoomByStoreCode(studyRoomVO);
		
		return studyRoomList;
	}
	public List<RentStudyRoomVO> getStudyRoomList(RentStudyRoomVO rentStudyRoomVO) throws SQLException{
		
		return studyRoomMapper.getStudyRoomList(rentStudyRoomVO);
	}


	public List<RentStudyRoomVO> detailStudyRoomList(RentStudyRoomVO rentStudyRoomVO)throws SQLException {
		
		List<RentStudyRoomVO> detailStudyRoomList = studyRoomMapper.detailStudyRoomList(rentStudyRoomVO);
		return detailStudyRoomList;
	}


	public int rentStudyRoomCnt(RentStudyRoomVO searchRentStudyRoomVO) throws SQLException{
		
		return studyRoomMapper.rentStudyRoomCnt(searchRentStudyRoomVO);
	}


	public List<RentStudyRoomVO> getStudyRoomMemberUsed(MemberVO loginUser) throws SQLException{
		return studyRoomMapper.selectStudyRoomMemberUsed(loginUser);
	}


	public void tempMakeStudyroom(String storeCode) throws SQLException{
		List<StudyRoomVO> initList = new ArrayList<>();
		
		StudyRoomVO room1 = new StudyRoomVO();
		room1.setStoreCode(storeCode);
		room1.setStudyroomCapa(6);
		room1.setStudyroomImage("/resources/images/studyRoom/test_sr111.jpg");
		room1.setStudyroomName("스터디룸 1");
		room1.setStudyroomStatus("0");
		room1.setStudyroomUsePrice(5000);
		initList.add(room1);
		
		StudyRoomVO room2 = new StudyRoomVO();
		BeanUtils.copyProperties(room1, room2);
		room2.setStudyroomCapa(4);
		room2.setStudyroomImage("/resources/images/studyRoom/test_sr112.jpg");
		room2.setStudyroomName("스터디룸 2");
		initList.add(room2);

		StudyRoomVO room3 = new StudyRoomVO();
		BeanUtils.copyProperties(room1, room2);
		room3.setStudyroomCapa(4);
		room3.setStudyroomImage("/resources/images/studyRoom/test_sr113.jpg");
		room3.setStudyroomName("스터디룸 3");
		initList.add(room3);

		StudyRoomVO room4 = new StudyRoomVO();
		BeanUtils.copyProperties(room1, room2);
		room4.setStudyroomCapa(4);
		room4.setStudyroomImage("/resources/images/studyRoom/test_sr114.jpg");
		room4.setStudyroomName("스터디룸 4");
		initList.add(room4);
		
		for (int i = 0; i < initList.size(); i++) {
			studyRoomMapper.insertInitList(initList.get(i));
		}
	}
}
