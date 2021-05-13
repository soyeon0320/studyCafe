package kr.co.scm.command;

import java.util.List;

import kr.co.scm.store.vo.SeatVO;

public class SeatModifyCommand {
	
	private List<SeatVO> locatedSeatList;
	
	private List<SeatVO> unLocatedSeatList;

	private List<SeatVO> modifiedSeatList;
	

	public List<SeatVO> getLocatedSeatList() {
		return locatedSeatList;
	}

	public void setLocatedSeatList(List<SeatVO> locatedSeatList) {
		this.locatedSeatList = locatedSeatList;
	}

	public List<SeatVO> getUnLocatedSeatList() {
		return unLocatedSeatList;
	}

	public void setUnLocatedSeatList(List<SeatVO> unLocatedSeatList) {
		this.unLocatedSeatList = unLocatedSeatList;
	}

	public List<SeatVO> getModifiedSeatList() {
		return modifiedSeatList;
	}

	public void setModifiedSeatList(List<SeatVO> modifiedSeatList) {
		this.modifiedSeatList = modifiedSeatList;
	}
	
	
}
