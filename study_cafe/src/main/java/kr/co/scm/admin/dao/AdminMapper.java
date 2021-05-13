package kr.co.scm.admin.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.admin.vo.AdminSalesVO;
import kr.co.scm.admin.vo.AdminVO;
import kr.co.scm.rent.vo.TicketVO;
import kr.co.scm.user.vo.MemberVO;

@Mapper("adminMapper")
public interface AdminMapper {
	public List<MemberVO> getMemberList(MemberVO memberVO) throws SQLException; 
	
	public int getMemberListCount(MemberVO memberVO) throws SQLException;
	
	public MemberVO detail(MemberVO memberVO) throws SQLException;
	
	public AdminVO selectAdminById(AdminVO adminVO) throws SQLException;
	
	// sales
	public List<TicketVO> getSalesByTicket() throws SQLException;
	
	public List<AdminSalesVO> dailySales() throws SQLException;
	
	public List<AdminSalesVO> monthlySales() throws SQLException;
	
	public List<AdminSalesVO> dailyCntByType() throws SQLException;
	
	public List<MemberVO> selecteMemberGenderStatic() throws SQLException;

	public List<MemberVO> selecteMemberRouteStatic() throws SQLException;

	public List<MemberVO> selectMemberAgeStatic() throws SQLException;

}
