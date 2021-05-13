package kr.co.scm.admin.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.admin.vo.MailSendHisVO;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.store.vo.OwnerVO;

@Mapper("mailMapper")
public interface MailMapper {

	void insertMail(MailSendHisVO mail) throws SQLException;
	
	void inserMailHis(MailSendHisVO mail) throws SQLException;
	
	List<MailSendHisVO> selectSendMailPagingList(MailSendHisVO mail) throws SQLException;
	
	int selectSendMailPagingListCount(MailSendHisVO mail) throws SQLException;
	
	List<OwnerVO> selectSendMailAddrByMailNo(MailSendHisVO mail) throws SQLException;
	
	List<OwnerVO> selectSearchMailAddr(SearchCriteria cri) throws SQLException;
	
	MailSendHisVO selectMailByMailNo(MailSendHisVO mail) throws SQLException;

	List<MailSendHisVO> selectRecentMailList(OwnerVO owner)throws SQLException;
	
	
}
