package kr.co.scm.user.service;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.co.scm.common.vo.UseInfoVO;
import kr.co.scm.user.dao.MemberMapper;
import kr.co.scm.user.vo.MemberVO;

@Service("memberService")
public class MemberService {
	
	@Resource(name="memberMapper")
	private MemberMapper memberMapper;
	

	@Autowired
	private JavaMailSender javaMailSender;

	
	public void registMember(MemberVO member) throws SQLException{
		
		memberMapper.insertMember(member);
	}

	public MemberVO getMember(MemberVO member) throws SQLException{
		MemberVO vo = memberMapper.selectMember(member);
		
		if (vo != null) {
			vo.setUseInfoVO(memberMapper.getStoreInInfo(vo));
		}
		return vo;
	}
	
	public MemberVO getMemberByTel(MemberVO member) throws SQLException{
		MemberVO vo = memberMapper.selectMemberByTel(member);
		return vo;
	}
	
	public MemberVO getMemberByEmail(MemberVO member) throws SQLException{
		MemberVO vo = memberMapper.selectMemberByEmail(member);
		return vo;
	}
	
	public MemberVO getMemberByPI(MemberVO member) throws SQLException{
		MemberVO vo = memberMapper.selectMemberbyPI(member);
		return vo;
	}
	
	public MemberVO findId(MemberVO member) throws SQLException{
		MemberVO vo = memberMapper.selectMemberbyNTG(member);
		return vo;
	}
	
	public MemberVO findPw(MemberVO member) throws SQLException{
		MemberVO vo = memberMapper.selectMemberbyIN(member);
		return vo;
	}
	
	public void modifyPass(MemberVO member) throws SQLException{
		memberMapper.updatePass(member);
	}
	
	public boolean send(String subject, String text, String from, String to) {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setFrom(from);
			helper.setTo(to);
			javaMailSender.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}

	public UseInfoVO getStoreInInfo(MemberVO loginUser) throws SQLException{
		return memberMapper.getStoreInInfo(loginUser);
	}
	
	/*--------------------------------------------------------------------------------------*/
	
	
}
