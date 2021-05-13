package kr.co.scm.admin.dao;

import java.sql.SQLException;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.scm.admin.vo.NotitalkVO;

@Mapper("notitalkMapper")
public interface NotitalkMapper {

	public void insertNotitalk(NotitalkVO notitalk) throws SQLException;
	
	public List<NotitalkVO> getNotitalkList() throws SQLException;
	
	public NotitalkVO getNotitalkByNo(NotitalkVO notitalk) throws SQLException;
}
