package kr.co.scm.user.dao;

import java.sql.SQLException;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.common.vo.UseInfoVO;
import kr.co.scm.user.vo.MemberVO;

@Mapper("memberMapper")
public interface MemberMapper {
	
	void insertMember(MemberVO member) throws SQLException;
	
	MemberVO selectMember(MemberVO member) throws SQLException;
	
	MemberVO selectMemberByTel(MemberVO member) throws SQLException;
	
	MemberVO selectMemberByEmail(MemberVO member) throws SQLException;

	MemberVO selectMemberbyNTG(MemberVO member) throws SQLException;
	
	MemberVO selectMemberbyIN(MemberVO member) throws SQLException;
	
	MemberVO selectMemberbyPI(MemberVO member) throws SQLException;
	
	void updatePass(MemberVO member) throws SQLException;

	UseInfoVO getStoreInInfo(MemberVO loginUser) throws SQLException;

}
