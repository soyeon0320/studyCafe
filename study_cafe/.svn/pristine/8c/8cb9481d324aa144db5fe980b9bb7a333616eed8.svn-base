package kr.co.scm.store.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.scm.store.dao.OwnerMapper;
import kr.co.scm.store.vo.OwnerVO;

@Service("ownerService")
public class OwnerService  {
	@Autowired
	private OwnerMapper ownerMapper;
	
	public OwnerVO selectOwnerByStoreCode(OwnerVO ownerVO) throws SQLException {
		OwnerVO owner = ownerMapper.selectOwnerByStoreCode(ownerVO);
		return owner;
	}
	
	public OwnerVO selectOwnerById(OwnerVO ownerVO) throws SQLException {
		OwnerVO owner = ownerMapper.selectOwnerById(ownerVO);
		return owner;
	}
	
	public List<OwnerVO> findOwnerById(OwnerVO ownerVO) throws Exception {
		List<OwnerVO> ownerList = ownerMapper.findOwnerById(ownerVO);
		return ownerList;
	}
	
	public String findOwnerByPass(OwnerVO ownerVO) throws Exception {
		String url = "sc_store/account/tempPassReceiveForm.open";
		
		OwnerVO owner = ownerMapper.selectOwnerById(ownerVO);
		String ownerId = owner.getOwnerId();
		
		if(ownerId == null || owner.getOwnerEmail() == null) {
			url = "sc_store/account/findIdOrPassFail";
		}else {
			String ownerTempPw = "";
			
			for(int i=0; i<10; i++) {
				ownerTempPw = UUID.randomUUID().toString().replaceAll("-", "");
				ownerTempPw = ownerTempPw.substring(0, 10);
			}
			
			owner.setOwnerPass(ownerTempPw);
			
			ownerMapper.updatePw(owner);
			
			sendEmail(owner, "ownerFindPw");
		}
		
		return url;
	}

	private void sendEmail(OwnerVO owner, String str) {
		Properties props = System.getProperties();
		
		String host = "smtp.naver.com";
		String ownerId = owner.getOwnerId();
		String ownerPw = owner.getOwnerPass();
		String ownerEmail = owner.getOwnerEmail();
		String subject = "스터디 카페 임시 비밀번호";
		String msg = "";
		
		if(str.equals("ownerFindPw")) {
			msg += ownerId + "님의 임시 비밀번호는 " + ownerPw + "입니다.";
		}
		
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host);

		try {
			Session session = Session.getDefaultInstance(props, new Authenticator() { 
				protected PasswordAuthentication getPasswordAuthentication() { 
					return new PasswordAuthentication("gugusystem", "gugujava1!"); 
				} 
			});
			
			Message mimeMessage = new MimeMessage(session);
			
			mimeMessage.setFrom(new InternetAddress("gugusystem@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(ownerEmail));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(msg);
			
			Transport.send(mimeMessage);
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	public void updatePw(OwnerVO ownerVO) throws SQLException {
		ownerMapper.updatePw(ownerVO);
	}

	public OwnerVO selectOwnerByTel(OwnerVO ownerVO) throws SQLException {
		OwnerVO owner = ownerMapper.selectOwnerByTel(ownerVO);
		return owner;
	}

	public OwnerVO selectOwnerByEamil(OwnerVO ownerVO) throws SQLException {
		OwnerVO owner = ownerMapper.selectOwnerByEamil(ownerVO);
		return owner;
	}
}
