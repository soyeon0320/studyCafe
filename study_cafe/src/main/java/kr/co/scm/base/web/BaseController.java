package kr.co.scm.base.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.validator.GenericValidator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.service.BaseService;
import kr.co.scm.base.vo.BaseVO;
import kr.co.scm.board.vo.AttachVO;
import kr.co.scm.common.service.AttachService;
import kr.co.scm.common.service.CodeService;

public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass().getName());
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	@Resource(name = "codeService")
	protected CodeService codeService;
	
	@Resource(name = "attachSerivce")
	protected AttachService attachService;

	@Resource(name = "fileUploadPath")
	protected String fileUploadPath;
	
	@Autowired
	protected BaseService baseService;
	

	/**
     * 중복입력방키 토큰 키
     */
	private static final String SAVE_TOKEN = "SAVE_TOKEN";
	
	protected void setUpPaginationInfo(PaginationInfo paginationInfo, BaseVO baseVO) {
		
		List<BaseVO> pageUnitSelector = new ArrayList<BaseVO>();
		
		BaseVO pageUnitVO = null;
		
		for(String unit : BaseVO.PAGE_UNITS) {
			pageUnitVO = new BaseVO();
			pageUnitVO.setPageUnitValue(unit);
			pageUnitVO.setPageUnitLabel(unit);
			pageUnitSelector.add(pageUnitVO);
		}
		
		baseVO.setPageUnitSelector(pageUnitSelector);
		
		paginationInfo.setCurrentPageNo(baseVO.getPageIndex());		
		paginationInfo.setRecordCountPerPage(baseVO.getPageUnit());
		paginationInfo.setPageSize(baseVO.getPageSize());
		
		baseVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		baseVO.setLastIndex(paginationInfo.getLastRecordIndex());
		baseVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	
	}
	
	/**중복방지를 위해 token 정보등록*/
	public static void setSaveToken(HttpSession session, BaseVO baseVO){
		/** session 정보를 통해 사용자 정보 셋팅 **/
    	String saveToken = UUID.randomUUID().toString();
		
    	baseVO.setSaveToken(saveToken);
    	
    	@SuppressWarnings("unchecked")
		List<String> saveTokenList = (List<String>)session.getAttribute(SAVE_TOKEN);
    	if(saveTokenList == null){
    		saveTokenList = new ArrayList<String>();
    		session.setAttribute(SAVE_TOKEN, saveTokenList);
    	}
    	saveTokenList.add(saveToken);    	
    	
	}
	
	/** 중복등록 방지: token 유효성 검증 */
	public static boolean isValidateSaveToken(HttpSession session, BaseVO baseVO){
		boolean isValid = false;
    	String saveToken = baseVO.getSaveToken();
    	if(!GenericValidator.isBlankOrNull(saveToken)){
    		@SuppressWarnings("unchecked")
			List<String> saveTokenList = (List<String>)session.getAttribute(SAVE_TOKEN);
    		if(saveTokenList.contains(saveToken)){
    			isValid = true;    			
    			saveTokenList.remove(saveToken);
    		}
    	}    	
    	return isValid;
	}

	public String setParameterForRedirect(HttpServletRequest request) {
		
		StringBuffer sb = new StringBuffer("?");
		
		Enumeration<?> e = request.getParameterNames();
		
		while (e.hasMoreElements()){
			String name = (String) e.nextElement();
			String value = request.getParameter(name);
			sb.append(name);
			sb.append("=");
			sb.append(value);
			sb.append("&");
		}
		sb.setLength(sb.length()-1);
		
		
		return sb.toString();
	}
	
	
	public List<AttachVO> saveFile(MultipartFile[] multipartFiles) throws Exception{
		
		String fileUploadPath = this.fileUploadPath;
		
		List<AttachVO> attachList = new ArrayList<AttachVO>();
		
		if(multipartFiles != null) {
			for (MultipartFile multi : multipartFiles) {
				if(multi.getSize() > 0) {
					String fileName = RandomStringUtils.randomAlphanumeric(20);
					File target = new File(fileUploadPath,fileName+"."+FilenameUtils.getExtension(multi.getOriginalFilename()));
					if(!target.exists()) target.mkdirs();
					multi.transferTo(target);
					
					AttachVO attach = new AttachVO();
					attach.setAttachOriginName(multi.getOriginalFilename());
					attach.setAttachName(fileName);
					attach.setAttachCours(fileUploadPath);
					attach.setAttachRegDate(new Date());
					attach.setAttachExtsn(FilenameUtils.getExtension(multi.getOriginalFilename()));
					attachList.add(attach);
				}
			}
		}
		return attachList;
	}
	
	public String getServerIp() {
		
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		}
		catch ( UnknownHostException e ) {
			e.printStackTrace();
		}
			
		if( local == null ) {
			return "localhost";
		}
		else {
			String ip = local.getHostAddress();
			return ip;
		}
	}
	
	public void deleteFile(String filePath) {
		File file = new File(filePath);
		file.delete();
	}
	
	
	public void make_qrcode(String fileName) {
	    String name = fileName + ".png";
	 
	    try {
	        File file = null;
	        // qr코드 이미지를 저장할 디렉토리 지정
	        file = new File("D:\\qr_image");
	        if(!file.exists()) {
	            file.mkdirs();
	        }
	        // qr코드 바코드 생성값
	        int qrcodeColor = 0xFF2e4e96;
	        // qr코드 배경색상값
	        int backgroundColor = 0xFFFFFFFF;
	          
	        QRCodeWriter qrCodeWriter = new QRCodeWriter();
	        // 3,4번째 parameter값 : width/height값 지정
	        BitMatrix bitMatrix = qrCodeWriter.encode(fileName, BarcodeFormat.QR_CODE,300, 300);
	        //
	        MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor);
	        BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);
	        // ImageIO를 사용한 바코드 파일쓰기
	        ImageIO.write(bufferedImage, "png", new File("D:\\qr_image\\"+name));
	          
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
