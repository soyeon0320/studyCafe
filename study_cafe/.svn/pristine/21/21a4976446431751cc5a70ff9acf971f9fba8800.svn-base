package kr.co.scm.board.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.scm.base.service.BaseService;
import kr.co.scm.board.dao.VocMapper;
import kr.co.scm.board.vo.VocVO;

@Service("vocService")
public class VocService  extends BaseService{
	
	@Resource(name="vocMapper")
	private VocMapper vocMapper;

	public List<VocVO> getVocList(VocVO searchVocVO) throws SQLException{
		List<VocVO> vocList = vocMapper.selectVocList(searchVocVO);
		return vocList;
	}

	public void regist(VocVO voc) throws SQLException {
		voc.setVocRegDate(new Date());
		vocMapper.insertVoc(voc);
	}

	public VocVO getVoc(VocVO vocVO) throws SQLException {
		VocVO voc = vocMapper.selectVocByVocNo(vocVO);
		return voc;
	}

	public int getVocListTotalCnt(VocVO searchVocVO) throws SQLException {
		int totalCnt = vocMapper.selectSearchListCnt(searchVocVO);
		return totalCnt;
	}
	
	public List<VocVO> getAllVocList(VocVO vocVO) throws SQLException{
		return vocMapper.selectAllVocPagingList(vocVO);
	}
	public List<VocVO> getStatusCntList(VocVO vocVO) throws SQLException{
		return vocMapper.selectStatusCnt(vocVO);
	}
	
	public int getAllVocListCount(VocVO vocVO) throws SQLException{
		return vocMapper.selectAllVocPagingListCount(vocVO);
	}

	
}
