package kr.co.scm.exception.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.exception.vo.ErrorLogVO;

@Mapper("errorLogMapper")
public interface ErrorLogMapper {

	public void insertErrorLog(ErrorLogVO logVO);

	public List<ErrorLogVO> selectLogList(ErrorLogVO logVO);

	public int selectLogListCnt(ErrorLogVO logVO);

	public ErrorLogVO selectErrorLog(ErrorLogVO errorLogVO);

}
