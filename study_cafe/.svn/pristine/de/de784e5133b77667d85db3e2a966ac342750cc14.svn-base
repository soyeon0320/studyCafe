package kr.co.scm.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.scm.admin.dao.ContractMapper;
import kr.co.scm.admin.vo.ContractStaticVO;
import kr.co.scm.admin.vo.ContractViewVO;
import kr.co.scm.store.service.StudyRoomService;
import kr.co.scm.store.vo.OwnerVO;

@Service("contractService")
public class ContractService {
	@Autowired
	private ContractMapper contractMapper;
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	
	public List<ContractViewVO> getContractList(ContractViewVO contractViewVO) throws SQLException {
		List<ContractViewVO> contractList = contractMapper.getContractList(contractViewVO);
		return contractList;
	}
	
	public int getContractListCount(ContractViewVO contractViewVO) throws SQLException {
		int totalCount = contractMapper.getContractListCount(contractViewVO);
		return totalCount;
	}
	
	public ContractViewVO detail(String storeCode) throws SQLException {
		ContractViewVO contract = contractMapper.detail(storeCode);
		return contract;
	}
	
	public void regist(OwnerVO ownerVO) throws SQLException {
		contractMapper.registOwner(ownerVO);
		contractMapper.registContract(ownerVO);
		contractMapper.registContractStatus(ownerVO);
	}

	public void approval(OwnerVO ownerVO) throws SQLException {
		contractMapper.updateApprovalOwner(ownerVO);
		contractMapper.updateApprovalContract(ownerVO);
		contractMapper.updateApprovalStore(ownerVO);
		
	}

	public void extend(OwnerVO ownerVO) throws SQLException {
		contractMapper.updateExtendOwner(ownerVO);
		contractMapper.updateApprovalContract(ownerVO);
		contractMapper.updateApprovalStore(ownerVO);
		//studyRoomService.tempMakeStudyroom(ownerVO.getStoreCode());
	}

	public ContractStaticVO status(Model model) throws SQLException {
		ContractStaticVO contractStatic = contractMapper.getStatic(model);
		return contractStatic;
	}
	


}
