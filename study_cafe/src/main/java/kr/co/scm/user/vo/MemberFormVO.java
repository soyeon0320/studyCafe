package kr.co.scm.user.vo;

public class MemberFormVO {
	private MemberVO memberVO;
	private MemberVO searchMemberVO;
	
	public MemberFormVO() {
		this.memberVO = new MemberVO();
		this.searchMemberVO = new MemberVO();
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public MemberVO getSearchMemberVO() {
		return searchMemberVO;
	}

	public void setSearchMemberVO(MemberVO searchMemberVO) {
		this.searchMemberVO = searchMemberVO;
	}
	
	
}
