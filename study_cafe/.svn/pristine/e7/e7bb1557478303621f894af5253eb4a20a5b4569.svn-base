package kr.co.scm.store.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.store.vo.OwnerVO;

@Mapper("ownerMapper")
public interface OwnerMapper {
	public OwnerVO selectOwnerById(OwnerVO ownerVO) throws SQLException;
	
	public List<OwnerVO> findOwnerById(OwnerVO ownerVO) throws SQLException;
	
	public void findOwnerByPass(OwnerVO ownerVO) throws SQLException;
	
	public void updatePw(OwnerVO ownerVO) throws SQLException;

	public OwnerVO selectOwnerByTel(OwnerVO ownerVO) throws SQLException;

	public OwnerVO selectOwnerByEamil(OwnerVO ownerVO) throws SQLException;

	public OwnerVO selectOwnerByStoreCode(OwnerVO ownerVO) throws SQLException;
}
