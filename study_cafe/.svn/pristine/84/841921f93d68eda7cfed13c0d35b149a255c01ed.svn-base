package kr.co.scm.board.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.board.dao.StudygroupMapper;
import kr.co.scm.board.vo.StudygroupScrapVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.command.PageMaker;
import kr.co.scm.command.SearchCriteria;

@Service("studygroupService")
public class StudygroupService {
	
	@Autowired
	private StudygroupMapper studygroupMapper;

	public Map<String, Object> getStgList(SearchCriteria cri) throws SQLException {
		Map<String,Object> dataMap=new HashMap<String,Object>();
		
		List<StudygroupVO> stgList = studygroupMapper.selectSearchStudyList(cri);
		
		int totalCount=studygroupMapper.selectStudyCriteriaTotalCount(cri);
						
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
				
		dataMap.put("stgList", stgList);
		dataMap.put("pageMaker",pageMaker);
				
				
		return dataMap;
	}

	public List<StudygroupVO> getRecruitTime() throws SQLException {
		
		// 로그인 구현되면 ID 넘겨서 List 형식 빼야됨
		List<StudygroupVO> recruitTime = studygroupMapper.getRecruitTime();
		
		return recruitTime;
	}

	public void chRcStatus() throws SQLException {
		
		studygroupMapper.chRcStatus();
	}
	
	public void sgBoardRegist(StudygroupVO sgv) throws SQLException {
		
		studygroupMapper.insertSgb(sgv);
		
	}

	public StudygroupVO getBoard(StudygroupVO studygroupVO) throws SQLException {
		boolean isModified = studygroupVO.isModified();
		studygroupVO = studygroupMapper.getStudygroupNo(studygroupVO);
		
		if(!isModified) {
			studygroupMapper.increaseViewCnt(studygroupVO);
			studygroupVO.setStudygroupCnt(studygroupVO.getStudygroupCnt()+1);
		}
		
		return studygroupVO;
	}

	public void increaseViewCount(StudygroupVO studygroupVO) throws SQLException{
		studygroupMapper.increaseViewCnt(studygroupVO);
	}
	public StudygroupVO getModifyBoard(StudygroupVO studygroupVO) throws SQLException {
		
		StudygroupVO sgv = studygroupMapper.getStudygroupNo(studygroupVO);
		
		return sgv;
	}

	public void modifySgv(StudygroupVO studygroupVO) throws SQLException {
		
		studygroupMapper.updateModify(studygroupVO);
	}

	public void removeStudygroup(StudygroupVO studygroupVO) throws SQLException{
		studygroupMapper.deleteStudygroup(studygroupVO);
	}

	
	public List<StudygroupVO> studygroupPagingList(StudygroupVO searchStudygroupVO) {
	
		return studygroupMapper.studygroupPagingList(searchStudygroupVO);
	}

	public int searchStudygroupPagingListCount(StudygroupVO searchStudygroupVO) {
		
		return studygroupMapper.searchStudygroupPagingListCount(searchStudygroupVO);
	}

	public int getStudyGroupScrapCount(StudygroupVO studygroupVO) throws SQLException {
		int studyGroupScrapCount = studygroupMapper.selectStudyGroupScrapCount(studygroupVO);
		return studyGroupScrapCount;
	}

	public void scrapRegist(StudygroupScrapVO studygroupScrapVO) throws SQLException {
		studygroupMapper.insertStudyGroupScrap(studygroupScrapVO);
	}

	public void scrapRemove(StudygroupScrapVO studygroupScrapVO) throws SQLException {
		studygroupMapper.removeStudyGroupScrap(studygroupScrapVO);
	}


}
