package kr.co.scm.store.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.store.dao.UseMemberMapper;
import kr.co.scm.user.vo.MemberVO;

@Service("useMemberService")
public class UseMemberService {

	@Resource(name="useMemberMapper")
	private UseMemberMapper useMemberMapper;
	
	public List<MemberVO> getUserMemberList(MemberVO memberVO) throws SQLException{
		return useMemberMapper.selectMemberPagingList(memberVO);
	}
	
	public int getUserMemberListCnt(MemberVO memberVO) throws SQLException{
		return useMemberMapper.selectMemberPagingListCount(memberVO);
	}
	

	public MemberVO getUseMemberByMS(MemberVO memberVO) throws SQLException{
		return useMemberMapper.selectUseMember(memberVO);
	}
	
	public List<RentSeatVO> getSeatHisList(MemberVO memberVO) throws SQLException{
		return useMemberMapper.selectSeatHisPagingList(memberVO);
	}
	
	public int getSeatHisListCnt(MemberVO memberVO) throws SQLException{
		return useMemberMapper.selectSeatHisPagingListCnt(memberVO);
	}
	
	public void modifyMemMemo(MemberVO memberVO) throws SQLException{
		useMemberMapper.updateMemMemo(memberVO);
	}
	
	
}
