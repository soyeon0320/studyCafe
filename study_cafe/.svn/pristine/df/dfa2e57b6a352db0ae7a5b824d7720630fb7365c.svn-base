package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.user.vo.MemberVO;

@Mapper("useMemberMapper")
public interface UseMemberMapper {

	List<MemberVO> selectMemberPagingList(MemberVO memberVO) throws SQLException;
	
	int selectMemberPagingListCount(MemberVO memberVO) throws SQLException;
	
	MemberVO selectUseMember(MemberVO memberVO) throws SQLException;
	
	List<RentSeatVO> selectSeatHisPagingList(MemberVO memberVO) throws SQLException;
	
	int selectSeatHisPagingListCnt(MemberVO memberVO) throws SQLException;
	
	void updateMemMemo(MemberVO memberVO) throws SQLException;
	
}
