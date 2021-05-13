package kr.co.scm.board.vo;

public class ReplyInfoFormVO extends InfoFormVO{

	private ReplyVO replyVO;
	private ReplyVO searchReplyVO;
	
	private String[] tableName;
	
	public ReplyInfoFormVO() {
		this.replyVO = new ReplyVO();
		this.searchReplyVO = new ReplyVO();
	}
	
	public ReplyVO getReplyVO() {
		return replyVO;
	}
	public void setReplyVO(ReplyVO replyVO) {
		this.replyVO = replyVO;
	}
	public ReplyVO getSearchReplyVO() {
		return searchReplyVO;
	}
	public void setSearchReplyVO(ReplyVO searchReplyVO) {
		this.searchReplyVO = searchReplyVO;
	}

	public String[] getTableName() {
		return tableName;
	}

	public void setTableName(String[] tableName) {
		this.tableName = tableName;
	}
	
	
}
