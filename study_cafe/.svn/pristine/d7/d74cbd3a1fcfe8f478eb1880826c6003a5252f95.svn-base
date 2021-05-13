package kr.co.scm.rent.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.rent.dao.TicketMapper;
import kr.co.scm.rent.vo.RentSeatVO;
import kr.co.scm.rent.vo.TicketBuyVO;
import kr.co.scm.rent.vo.TicketVO;
import kr.co.scm.user.vo.MemberVO;

@Service("ticketService")
public class TicketService {
	
	@Autowired
	private TicketMapper ticketMapper;
	
	public int countTotalRemainTime(MemberVO member) throws SQLException{
		
		int remainTime = ticketMapper.countTotalRemainTime(member);
		
		return remainTime;
	}
	
	public List<TicketVO> getTicket() throws SQLException {
		
		List<TicketVO> ticketList = ticketMapper.getTicket();
		
		return ticketList;
	}
	
	public void buyTicket(TicketBuyVO ticketBuy) throws SQLException {
		ticketMapper.buyTicket(ticketBuy);
	}

	public int getFirstTicket(MemberVO member) throws SQLException{
		
		return ticketMapper.getFirstTicket(member);
	}
	
	public void useTicket(RentSeatVO rentSeat) throws SQLException{
		ticketMapper.useTicket(rentSeat);
	}
	
	public void useAllTicket(MemberVO member) throws SQLException{
		ticketMapper.useAllTicket(member);
	}
	
	
	public List<TicketVO> getTicketPagingList(TicketVO ticket) throws SQLException{
		return ticketMapper.selectTicketPagingList(ticket);
	}
	
	public int getTicketPagingListCount(TicketVO ticket) throws SQLException{
		return ticketMapper.selectTicketPagingListCount(ticket);
	}
	
	public TicketVO getTicketByTicketNo(TicketVO ticket)throws SQLException{
		return ticketMapper.selectTicketByTicketNo(ticket);
	}
	
	public void modifyTicket(TicketVO ticket) throws SQLException{
		ticketMapper.updateTicket(ticket);
	}
	
	public void registTicket(TicketVO ticket) throws SQLException{
		ticketMapper.insertTicket(ticket);
	}
}
