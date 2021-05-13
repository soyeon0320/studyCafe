package kr.co.scm.admin.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import kr.co.scm.admin.dao.MailMapper;
import kr.co.scm.admin.vo.MailSendHisVO;
import kr.co.scm.command.SearchCriteria;
import kr.co.scm.store.vo.OwnerVO;

@Service("mailService")
public class MailService {

	@Resource(name="mailMapper")
	private MailMapper mailMapper;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public boolean send(MailSendHisVO mail) {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper;
		
		try {
			helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(mail.getMailTitle()); //제목
			helper.setText(mail.getMailContent(), true); //내용
			helper.setFrom(mail.getAdminEmail()); // 관리자 메일 
			
			
			InternetAddress[] addArray = new InternetAddress[mail.getOwnerEmail().length];
			for (int i = 0; i < addArray.length; i++) {
				addArray[i] = new InternetAddress(mail.getOwnerEmail()[i]);
			}
//			addArray[0] = new InternetAddress("ths4388@hanmail.net");
//			addArray[1] = new InternetAddress("ssoneunji1010@gmail.com");
//			addArray[2] = new InternetAddress("rntpwn22@hanmail.net");
			
			helper.setTo(addArray);
			javaMailSender.send(message);
			return true;
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public List<MailSendHisVO> getMailList(MailSendHisVO mailVO) throws SQLException{
		List<MailSendHisVO> mailList = mailMapper.selectSendMailPagingList(mailVO);
		
		return mailList;
	}
	
	public int getMailListCnt(MailSendHisVO mailVO) throws SQLException {
		int totalCnt = mailMapper.selectSendMailPagingListCount(mailVO);
		
		return totalCnt;
	}
	
	public List<OwnerVO> getMailAddrListByMailNo(MailSendHisVO mailVO) throws SQLException{
		List<OwnerVO> addrList = mailMapper.selectSendMailAddrByMailNo(mailVO);
		return addrList;
	}
	
	public List<OwnerVO> getMailAddrList(SearchCriteria cri) throws SQLException{
		List<OwnerVO> addrList = mailMapper.selectSearchMailAddr(cri);
		return addrList;
	}
	
	
	public MailSendHisVO getMailByMailNo(MailSendHisVO mailVO) throws SQLException{
		MailSendHisVO mail = mailMapper.selectMailByMailNo(mailVO);
		return mail;
	}
	
	public void registSendMail(MailSendHisVO mailVO) throws SQLException {
		mailMapper.insertMail(mailVO);
		String[] ownerId = mailVO.getOwnerId();
		for (int i = 0; i < ownerId.length; i++) {
			MailSendHisVO vo = new MailSendHisVO();
			
			vo.setMailNo(mailVO.getMailNo());
			vo.setOwnerIdSend(mailVO.getOwnerId()[i]);
			
			mailMapper.inserMailHis(vo);
		}
		
		
	}
}
