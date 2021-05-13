package kr.co.scm.rent.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.TicketBuyVO;
import kr.co.scm.rent.vo.TicketVO;
import kr.co.scm.user.vo.MemberVO;

@Mapper("TicketMapper")
public interface TicketMapper {
	
	public int countTotalRemainTime(MemberVO member) throws SQLException;
	
	public List<TicketVO> getTicket() throws SQLException;
	
	public void buyTicket(TicketBuyVO ticketBuy) throws SQLException;
	
	public int getFirstTicket(MemberVO member) throws SQLException;

	public void useTicket(RentSeatVO rentSeat) throws SQLException;
	
	public void useAllTicket(MemberVO member) throws SQLException;
	
	public List<TicketVO> selectTicketPagingList(TicketVO ticketVO) throws SQLException;
	
	public int selectTicketPagingListCount(TicketVO ticketVO) throws SQLException;
	
	public TicketVO selectTicketByTicketNo(TicketVO ticketVO) throws SQLException;
	
	public void updateTicket(TicketVO ticketVO) throws SQLException;
	
	public void insertTicket(TicketVO ticketVO) throws SQLException;
	
}
