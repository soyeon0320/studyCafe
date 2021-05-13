package kr.co.scm.common.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.board.vo.AttachVO;
import kr.co.scm.board.vo.InfoVO;
import kr.co.scm.common.dao.AttachMapper;

@Service("attachSerivce")
public class AttachService {
	
	@Autowired
	private AttachMapper attachMapper;

	public List<AttachVO> getFile(InfoVO infoVO) throws SQLException{
		return attachMapper.selectFile(infoVO);
	}

	public AttachVO getFile(AttachVO attachVO) throws SQLException{
		return attachMapper.selectFileByAttachVO(attachVO);
	}
	
	
	public int insertAttach(int attachNo,List<AttachVO> attachList) throws SQLException{
		if(attachNo == 0) attachNo = attachMapper.selectAttachSeq();
		for (AttachVO attach : attachList) {
			attach.setAttachNo(attachNo);
			attachMapper.insertAttach(attach);
		}
		return attachNo;
	}
	
	public void deleteFiles(List<AttachVO> deleteList) throws SQLException{
		for (AttachVO attachVO : deleteList) {
			if (attachVO != null) {
				File file = new File(FilenameUtils.concat(attachVO.getAttachCours(), attachVO.getAttachName()+"."+attachVO.getAttachExtsn() ));
				file.delete();
				attachMapper.deleteFileByAttachCount(attachVO);
			}
		}
	}
}
