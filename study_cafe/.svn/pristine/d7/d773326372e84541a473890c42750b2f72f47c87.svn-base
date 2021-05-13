package kr.co.scm.store.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.store.dao.UseageMapper;
import kr.co.scm.store.vo.EquipVO;
import kr.co.scm.store.vo.RentalEquipVO;

@Service("equipService")
public class EquipService  {
	
	@Autowired
	private UseageMapper useageMapper;
	
	public List<EquipVO> equipList(EquipVO searchEquipVO) throws SQLException{
		
		return useageMapper.equipList(searchEquipVO);
	}

	public RentalEquipVO currentEquipOccufied(RentalEquipVO rentalEquipVO) throws SQLException {
		
		return useageMapper.currentEquipOccufied(rentalEquipVO);
	}

	public int equipListCnt(EquipVO searchEquipVO) throws SQLException{
		return useageMapper.equipListCnt(searchEquipVO);
	}

	public List<RentalEquipVO> detailEquipList(RentalEquipVO rentalEquipVO) throws SQLException {
		return useageMapper.detailEquipList(rentalEquipVO);
	}

	public List<RentalEquipVO> kioskRentTabletList(RentalEquipVO searchEquipVO)throws SQLException {
		return useageMapper.kioskRentTabletList(searchEquipVO);
	}

	public List<RentalEquipVO> noteBookList(RentalEquipVO searchEquipVO) throws SQLException{
		return useageMapper.noteBookList(searchEquipVO);
	}

	public EquipVO getTablet(EquipVO equipVO) throws SQLException {
		return useageMapper.getTablet(equipVO);
	}

	public void tbRentPay(RentalEquipVO rentalEquipVO) throws SQLException{
		
		useageMapper.tbRentPay(rentalEquipVO);
	}

	public List<RentalEquipVO> currentEquipList(RentalEquipVO rentalEquipVO)throws SQLException {
		return useageMapper.currentEquipList(rentalEquipVO);
	}
	
	// 이용기기 상태수정
	public void modifyEquipUseable(RentalEquipVO rentalEquipVO) throws SQLException{
		useageMapper.modifyEquipUseable(rentalEquipVO);
	}




}
