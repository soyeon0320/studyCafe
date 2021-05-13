package kr.co.scm.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.board.dao.InfoMapper;
import kr.co.scm.board.vo.AttachVO;
import kr.co.scm.board.vo.InfoScrapVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.common.dao.AttachMapper;

@Service("infoService")
public class InfoService {
	@Autowired
	private InfoMapper infoMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	public List<InfoVO> retrievePagingList(InfoVO vo) throws Exception{
		return infoMapper.retrievePagingList(vo);
	}
	
	public int retrievePagingListCount(InfoVO vo) throws Exception{
		return infoMapper.retrievePagingListCount(vo);
	}
	
	
	////////////////////////////////////////////////////////////////////
	



	public void registInfo(InfoVO info) throws SQLException {
		
		if(info.getAttachList() != null && info.getAttachList().size() > 0) {
			info.setAttachNo(insertAttach(0,info.getAttachList()));
		}
		
		infoMapper.insertInfoBoard(info);
	}


	public void modifyInfo(InfoVO info) throws SQLException {
		infoMapper.updateInfoBoard(info);
	}

	public void remove(InfoVO info) throws SQLException {
		info = infoMapper.selectInfoBoardByInfoNo(info);
		infoMapper.deleteInfoBoard(info);
		if (info.getAttachNo() != 0) {
			AttachVO attachVO = new AttachVO();
			attachVO.setAttachNo(info.getAttachNo());
			attachMapper.deleteFiles(attachVO);
		}
	}

	public InfoVO getInfoBoardForModify(InfoVO infoVO) throws SQLException {
		InfoVO info = infoMapper.selectInfoBoardByInfoNo(infoVO);
		return info;
	}


	public InfoVO getInfoBoard(InfoVO infoVO) throws SQLException {
		boolean isModified = infoVO.isModified();
		infoVO = infoMapper.selectInfoBoardByInfoNo(infoVO);
		
		if(infoVO.getAttachNo() != 0) {
			AttachVO attach=new AttachVO();
			attach.setAttachNo(infoVO.getAttachNo());
			infoVO.setAttachList(attachMapper.selectFileList(attach));
		}
		if (!isModified) {
			infoMapper.increaseViewCount(infoVO);
			infoVO.setInfoCnt(infoVO.getInfoCnt()+1);
		}
		
		return infoVO;
	}
	
	public void increaseViewCount(InfoVO infoVO) throws SQLException {
		infoMapper.increaseViewCount(infoVO);
	}
	
	
	public int insertAttach(int attachNo,List<AttachVO> attachList) throws SQLException{
		if(attachNo == 0) attachNo = attachMapper.selectAttachSeq();
		for (AttachVO attach : attachList) {
			attach.setAttachNo(attachNo);
			attachMapper.insertAttach(attach);
		}
		return attachNo;
	}

	public int getInfoScrapCount(InfoScrapVO infoScrapVO) throws SQLException {
		int infoScrapCount = infoMapper.selectInfoScrapCount(infoScrapVO);
		return infoScrapCount;
	}

	public void scrapRegist(InfoScrapVO infoScrapVO) throws SQLException {
		infoMapper.insertInfoScrap(infoScrapVO);
	}

	public void scrapRemove(InfoScrapVO infoScrapVO) throws SQLException {
		infoMapper.removeInfoScrap(infoScrapVO);
	}
}
