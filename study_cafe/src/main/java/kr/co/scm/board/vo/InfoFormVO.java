package kr.co.scm.board.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class InfoFormVO {

	private InfoVO infoVO;
	private InfoVO searchInfoVO;
	
	private MultipartFile[] multipartFiles;

	private MultipartFile[] addFromModifyFiles;
	
	private int[] deleteAttachCount;
	
	public InfoFormVO() {
		this.infoVO = new InfoVO();
		this.searchInfoVO = new InfoVO();
	}

	public InfoVO getInfoVO() {
		return infoVO;
	}

	public void setInfoVO(InfoVO infoVO) {
		this.infoVO = infoVO;
	}

	public InfoVO getSearchInfoVO() {
		return searchInfoVO;
	}

	public void setSearchInfoVO(InfoVO searchInfoVO) {
		this.searchInfoVO = searchInfoVO;
	}

	public MultipartFile[] getMultipartFiles() {
		return multipartFiles;
	}

	public void setMultipartFiles(MultipartFile[] multipartFiles) {
		this.multipartFiles = multipartFiles;
	}

	public MultipartFile[] getAddFromModifyFiles() {
		return addFromModifyFiles;
	}

	public void setAddFromModifyFiles(MultipartFile[] addFromModifyFiles) {
		this.addFromModifyFiles = addFromModifyFiles;
	}

	public int[] getDeleteAttachCount() {
		return deleteAttachCount;
	}

	public void setDeleteAttachCount(int[] deleteAttachCount) {
		this.deleteAttachCount = deleteAttachCount;
	}


	public List<AttachVO> getDeleteAttachList(int[] deleteAttachCount,int attachNo){
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		for (int attachCount : deleteAttachCount) {
			AttachVO attachVO = new AttachVO();
			attachVO.setAttachNo(attachNo);
			attachVO.setAttachCount(attachCount);
			attachList.add(attachVO);
		}
		return attachList;
	}
	
}
