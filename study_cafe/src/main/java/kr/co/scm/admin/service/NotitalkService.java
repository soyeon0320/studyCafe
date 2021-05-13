package kr.co.scm.admin.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.scm.admin.dao.NotitalkMapper;
import kr.co.scm.admin.vo.NotitalkVO;

@Service("notitalkService")
public class NotitalkService {
	
	@Resource(name="notitalkMapper")
	NotitalkMapper notitalkMapper;
	
	public void insertNotitalk(NotitalkVO notitalk) throws SQLException{
		notitalkMapper.insertNotitalk(notitalk);
	}

	public List<NotitalkVO> getNotitalkList() throws SQLException{
		return notitalkMapper.getNotitalkList();
	}
	
	public NotitalkVO getNotitalkByNo(NotitalkVO notitalk) throws SQLException{
		return notitalkMapper.getNotitalkByNo(notitalk);
	}
}
