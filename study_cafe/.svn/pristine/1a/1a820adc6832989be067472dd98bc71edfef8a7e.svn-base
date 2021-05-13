package kr.co.scm.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.base.service.BaseService;
import kr.co.scm.board.dao.NoticeMapper;
import kr.co.scm.board.vo.NoticeVO;
import kr.co.scm.command.PageMaker;
import kr.co.scm.command.SearchCriteria;

@Service("noticeService")
public class NoticeService extends BaseService{

	@Autowired
	private NoticeMapper noticeMapper;
	
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<NoticeVO> retrievePagingList(NoticeVO noticeVO) throws Exception {
		return noticeMapper.retrievePagingList(noticeVO);
	}
	
	public List<NoticeVO> upNoticeList() throws Exception {
		return noticeMapper.selectUpNoticeList();
	}
	
	public int retrievePagingListCount(NoticeVO noticeVO) throws Exception {
		return noticeMapper.retrievePagingListCount(noticeVO);
	}
	
	public NoticeVO getNotice(NoticeVO noticeVO) throws SQLException {
		boolean isModified = noticeVO.isModified();
		noticeVO = noticeMapper.selectNotice(noticeVO);
		if (!isModified) {
			noticeMapper.increaseViewCnt(noticeVO);
			noticeVO.setNoticeCnt(noticeVO.getNoticeCnt()+1);
		}
		return noticeVO;
	}
	
	
	//-----------------------------------------------------------------------


	public void regist(NoticeVO notice) throws SQLException {
		noticeMapper.insertNotice(notice);
	}

	public void modify(NoticeVO notice) throws SQLException {
		noticeMapper.updateNotice(notice);
		
	}

	public void remove(NoticeVO notice) throws SQLException {
		noticeMapper.deleteNotice(notice);
		
	}

}
