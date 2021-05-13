package kr.co.scm.store.vo;

import kr.co.scm.base.vo.BaseVO;

public class EquipFormVO extends BaseVO{
	
	private EquipVO equipVO;
	private EquipVO searchEquipVO;
	
	private RentalEquipVO rentalEquipVO;
	private RentalEquipVO searchRentalEquipVO;
	
	public EquipFormVO() {
		this.equipVO = new EquipVO();
		this.searchEquipVO = new EquipVO();
		
		this.rentalEquipVO = new RentalEquipVO();
		this.searchRentalEquipVO = new RentalEquipVO();
	}

	public EquipVO getEquipVO() {
		return equipVO;
	}

	public void setEquipVO(EquipVO equipVO) {
		this.equipVO = equipVO;
	}

	public EquipVO getSearchEquipVO() {
		return searchEquipVO;
	}

	public void setSearchEquipVO(EquipVO searchEquipVO) {
		this.searchEquipVO = searchEquipVO;
	}

	public RentalEquipVO getRentalEquipVO() {
		return rentalEquipVO;
	}

	public void setRentalEquipVO(RentalEquipVO rentalEquipVO) {
		this.rentalEquipVO = rentalEquipVO;
	}

	public RentalEquipVO getSearchRentalEquipVO() {
		return searchRentalEquipVO;
	}

	public void setSearchRentalEquipVO(RentalEquipVO searchRentalEquipVO) {
		this.searchRentalEquipVO = searchRentalEquipVO;
	}
	
}
