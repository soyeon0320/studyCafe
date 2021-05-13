package kr.co.scm.rent.vo;

public class TicketFormVO {

	private TicketVO ticketVO;
	private TicketVO searchTicketVO;
	
	public TicketFormVO() {
		this.ticketVO = new TicketVO();
		this.searchTicketVO = new TicketVO();
	}

	public TicketVO getTicketVO() {
		return ticketVO;
	}

	public void setTicketVO(TicketVO ticketVO) {
		this.ticketVO = ticketVO;
	}

	public TicketVO getSearchTicketVO() {
		return searchTicketVO;
	}

	public void setSearchTicketVO(TicketVO searchTicketVO) {
		this.searchTicketVO = searchTicketVO;
	}
	
	
	
	
	
}
