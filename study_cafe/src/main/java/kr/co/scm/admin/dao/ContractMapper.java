package kr.co.scm.admin.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.admin.vo.ContractStaticVO;
import kr.co.scm.admin.vo.ContractViewVO;
import kr.co.scm.store.vo.OwnerVO;

@Mapper("contractMapper")
public interface ContractMapper {
	public List<ContractViewVO> getContractList(ContractViewVO contractViewVO) throws SQLException;
	
	public int getContractListCount(ContractViewVO contractViewVO) throws SQLException;
	
	public ContractViewVO detail(String storeCode) throws SQLException;
	
	public void registOwner(OwnerVO ownerVO) throws SQLException;
	public void registContract(OwnerVO ownerVO) throws SQLException;
	public void registContractStatus(OwnerVO ownerVO) throws SQLException;

	public void updateApprovalOwner(OwnerVO ownerVO) throws SQLException;
	public void updateApprovalContract(OwnerVO ownerVO) throws SQLException;
	public void updateApprovalStore(OwnerVO ownerVO) throws SQLException;

	public void updateExtendOwner(OwnerVO ownerVO) throws SQLException;

	public ContractStaticVO getStatic(Model model) throws SQLException;
	
}