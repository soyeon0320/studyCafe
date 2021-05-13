package kr.co.scm.common.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.board.vo.AttachVO;
import kr.co.scm.board.vo.InfoVO;

@Mapper("attachMapper")
public interface AttachMapper {

	public List<AttachVO> selectFile(InfoVO infoVO) throws SQLException;
	
	public List<AttachVO> selectFileList(AttachVO attachVO) throws SQLException;
	
	public void insertAttach(AttachVO attach) throws SQLException;
	
	public int selectAttachSeq() throws SQLException;

	public void deleteFiles(AttachVO attachVO) throws SQLException;

	public AttachVO selectFileByAttachVO(AttachVO attachVO) throws SQLException;

	public void deleteFileByAttachCount(AttachVO attachVO) throws SQLException;
}
