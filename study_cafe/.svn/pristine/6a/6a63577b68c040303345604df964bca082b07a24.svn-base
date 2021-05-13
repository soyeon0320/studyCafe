package kr.co.scm.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.scm.board.vo.VocVO;

public class VocRegistCommand {
	
	private String storeCode;
	private String vocKind;
	private String useService;
	private String visitDate;
	private String visitTime;
	private String vocTitle;
	private String vocContent;
	private String memId;
	
	
	public String getStoreCode() {
		return storeCode;
	}

	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}

	public String getVocKind() {
		return vocKind;
	}


	public void setVocKind(String vocKind) {
		this.vocKind = vocKind;
	}


	public String getUseService() {
		return useService;
	}

	public void setUseService(String useService) {
		this.useService = useService;
	}

	public String getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}

	public String getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}

	public String getVocTitle() {
		return vocTitle;
	}

	public void setVocTitle(String vocTitle) {
		this.vocTitle = vocTitle;
	}

	public String getVocContent() {
		return vocContent;
	}

	public void setVocContent(String vocContent) {
		this.vocContent = vocContent;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public VocVO toVocVO() {
		VocVO voc = new VocVO();
		
		voc.setMemId(memId);
		voc.setVocTitle(vocTitle);
		voc.setVocContent(vocContent);
		voc.setUseService(useService);
		voc.setStoreCode(storeCode);
		voc.setVocKind(vocKind);
		voc.setVocRegDate(new Date());
		try {
			voc.setVisitDate(new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(visitDate + " " + visitTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return voc;
	}
	
	
	
}
