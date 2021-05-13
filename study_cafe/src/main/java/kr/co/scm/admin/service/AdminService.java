package kr.co.scm.admin.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.scm.admin.dao.AdminMapper;
import kr.co.scm.admin.vo.AdminHeaderVO;
import kr.co.scm.admin.vo.AdminSalesVO;
import kr.co.scm.admin.vo.AdminVO;
import kr.co.scm.common.vo.StaticVO;
import kr.co.scm.order.vo.ProductVO;
import kr.co.scm.rent.vo.TicketVO;
import kr.co.scm.store.dao.MainViewMapper;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.vo.MemberVO;

@Service("adminService")
public class AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private MainViewMapper mainViewMapper;
	
	
	public List<MemberVO> getMemberList(MemberVO memberVO) throws SQLException {
		List<MemberVO> memberList = adminMapper.getMemberList(memberVO);
		return memberList;
	}
	
	public int getMemberListCount(MemberVO memberVO) throws SQLException {
		int totalCount = adminMapper.getMemberListCount(memberVO);
		return totalCount;
	}
	
	public MemberVO detail(MemberVO memberVO) throws SQLException {
		MemberVO member = adminMapper.detail(memberVO);
		return member;
	}
	
	public AdminVO selectAdminById(AdminVO adminVO) throws SQLException {
		AdminVO admin = adminMapper.selectAdminById(adminVO);
		return admin;
	}

	public void setAdminMainAttributes(Model model) throws SQLException{
		
		AdminHeaderVO vo = mainViewMapper.getAdminMainHeader();
		model.addAttribute("adminHeader", vo);
		
		List<ProductVO> lowRemainList = mainViewMapper.selectLowRemainList();
		model.addAttribute("lowRemainList", lowRemainList);
		
		List<AdminSalesVO> monthlySales = monthlySales();
		model.addAttribute("monthlySales", monthlySales);
		
		List<StaticVO> regionStatic = mainViewMapper.selectRegionStatic();
		model.addAttribute("regionStatic", regionStatic);
		
		List<StaticVO> vocStatic = mainViewMapper.selectVocStatic();
		model.addAttribute("vocStatic", vocStatic);

		List<StaticVO> totalUseForYear = mainViewMapper.selectTotalUseForYear();
		model.addAttribute("totalUseForYear", totalUseForYear);
		
		List<StoreVO> rankingStoreList = mainViewMapper.seletRankingStoreList();
		model.addAttribute("rankingStoreList", rankingStoreList);
		
	}

	// sales
	public List<TicketVO> getSalesByTicket() throws SQLException{
		return adminMapper.getSalesByTicket();
	}
	
	public List<AdminSalesVO> dailySales() throws SQLException{
		return adminMapper.dailySales();
	}
	
	public List<AdminSalesVO> monthlySales() throws SQLException{
		return adminMapper.monthlySales();
	}
	
	public List<AdminSalesVO> dailyCntByType() throws SQLException{
		return adminMapper.dailyCntByType();
	}
	
	public void getMemberStatic(Model model) throws SQLException{
		List<MemberVO> memberGenderStatic = adminMapper.selecteMemberGenderStatic();
		model.addAttribute("memberGenderStatic", memberGenderStatic);
		
		List<MemberVO> memberAgeStatic = adminMapper.selectMemberAgeStatic();
		model.addAttribute("memberAgeStatic", memberAgeStatic);
		
		List<MemberVO> memberRouteStatic = adminMapper.selecteMemberRouteStatic();
		model.addAttribute("memberRouteStatic", memberRouteStatic);
	}
	
}
