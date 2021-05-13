package kr.co.scm.exception.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.exception.dao.ErrorLogMapper;
import kr.co.scm.exception.vo.ErrorLogVO;

@Service("errorLogService")
public class ErrorLogService {

	@Autowired
	private ErrorLogMapper errorLogMapper;
	
	public void insertErrorLog(ErrorLogVO logVO) {
		errorLogMapper.insertErrorLog(logVO);
	}

	public List<ErrorLogVO> selectLogList(ErrorLogVO logVO) {
		return errorLogMapper.selectLogList(logVO);
	}

	public int selectLogListCnt(ErrorLogVO logVO) {
		return errorLogMapper.selectLogListCnt(logVO);
	}

	public ErrorLogVO getErrorDetail(ErrorLogVO errorLogVO) {
		return errorLogMapper.selectErrorLog(errorLogVO);
	}
}
