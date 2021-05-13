package kr.co.scm.board.vo;

public class VocFormVO {
	
	private VocVO vocVO;

	private VocVO searchVocVO;

	
	public VocFormVO() {
		this.vocVO = new VocVO();
		this.searchVocVO = new VocVO();
	}
	
	
	public VocVO getVocVO() {
		return vocVO;
	}

	public void setVocVO(VocVO vocVO) {
		this.vocVO = vocVO;
	}

	public VocVO getSearchVocVO() {
		return searchVocVO;
	}

	public void setSearchVocVO(VocVO searchVocVO) {
		this.searchVocVO = searchVocVO;
	}
	
	
	
	

	
	
}
