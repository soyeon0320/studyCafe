package kr.co.scm.base.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class BaseVO{


	public static final String[] PAGE_UNITS= {"1","2","10","20","30","50"};
		
	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	
	/** 목록 개수 닶 */
	private String pageUnitValue;
	
	/** 목록 개수 라벨 */
	private String pageUnitLabel;
	
	/** 목록 개수 셀렉트 박스 item */
	private List<BaseVO> pageUnitSelector;
	
	/** 중복등록방지용 토큰 */
	private String saveToken;

	/** 수정시 조회수 중복카운트 방지용 수정여부 */
	private boolean isModified;
	
	/** 게시글 순번 */
	private int rnum;
	
	private String addrDonmCode;
	
	private String addrSigugunCode;
	
	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageUnitValue() {
		return pageUnitValue;
	}

	public void setPageUnitValue(String pageUnitValue) {
		this.pageUnitValue = pageUnitValue;
	}

	public String getPageUnitLabel() {
		return pageUnitLabel;
	}

	public void setPageUnitLabel(String pageUnitLabel) {
		this.pageUnitLabel = pageUnitLabel + "개씩 보기";
	}
	
	public List<BaseVO> getPageUnitSelector() {
		return pageUnitSelector;
	}

	public void setPageUnitSelector(List<BaseVO> pageUnitSelector) {
		this.pageUnitSelector = pageUnitSelector;
	}
	
	public String getSaveToken() {
		return saveToken;
	}

	public void setSaveToken(String saveToken) {
		this.saveToken = saveToken;
	}

	public boolean isModified() {
		return isModified;
	}

	public void setModified(boolean isModified) {
		this.isModified = isModified;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public void setIsModified(boolean isModified) {
		this.isModified = isModified;
	}
	
	public boolean getIsModified() {
		return this.isModified;
	}
	
	public String getAddrDonmCode() {
		return addrDonmCode;
	}

	public String getAddrSigugunCode() {
		return addrSigugunCode;
	}

	public void setAddrDonmCode(String addrDonmCode) {
		this.addrDonmCode = addrDonmCode;
	}

	public void setAddrSigugunCode(String addrSigugunCode) {
		this.addrSigugunCode = addrSigugunCode;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
