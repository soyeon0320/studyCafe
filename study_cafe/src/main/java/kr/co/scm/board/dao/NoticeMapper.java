package kr.co.scm.board.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.NoticeVO;
import kr.co.scm.command.SearchCriteria;
@Mapper("noticeMapper")
public interface NoticeMapper {
	
	public List<NoticeVO> retrievePagingList(NoticeVO notice) throws Exception;
	
	public int retrievePagingListCount(NoticeVO notice);
	
	public List<NoticeVO> selectUpNoticeList() throws SQLException;
	
	//--------------------------------------------------------------------
	
	public NoticeVO selectNotice(NoticeVO notice) throws SQLException;
	
	public void insertNotice(NoticeVO notice) throws SQLException;

	public void updateNotice(NoticeVO notice) throws SQLException;

	public void deleteNotice(NoticeVO notice) throws SQLException;

	// viewcnt 증가
	public void increaseViewCnt(NoticeVO notice) throws SQLException;

}
