package kr.co.scm.store.web;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.scm.base.web.BaseController;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.OwnerVO;
import kr.co.scm.store.vo.StoreImageVO;
import kr.co.scm.store.vo.StoreVO;

@Controller
public class StoreInfoModifyController extends BaseController{
	
	@Autowired
	private StoreService storeService;
	
	
	@Resource(name="storeFrontImgPath")
	private String storeFrontImgPath;
	
	
	@RequestMapping("/store/info/profile")
	public String modifyMain(Model model, HttpSession session)  throws SQLException{
		
		OwnerVO loginOwner = (OwnerVO)session.getAttribute("loginOwner");
		StoreVO storeDetail = storeService.selectStoreByCode(loginOwner.getStoreCode());
		List<StoreImageVO> imgList = storeService.getStoreImgList(storeDetail);
		model.addAttribute("storeVO", storeDetail);
		model.addAttribute("imgList", imgList);
		
		return "store/modify/store_profile.store";
	}
	
	@RequestMapping("/store/modify/frontImg")
	public ResponseEntity<String> uploadImg(MultipartFile file, HttpServletRequest request,HttpSession session) throws Exception{
		ResponseEntity<String> result = null;
		int fileSize = 5 * 1024 *1024;
		if(file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다.",HttpStatus.BAD_REQUEST); 
		}
		String savePath = storeFrontImgPath.replace("/", File.separator);
		String fileName = RandomStringUtils.randomAlphanumeric(20);
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		fileName = fileName + fileFormat;
		File saveFile = new File(savePath,fileName);
		saveFile.mkdirs();
		
		
		try {
			file.transferTo(saveFile);
			String imgUrl = request.getContextPath()+"/store/getImg?fileName=" + fileName;
			
			OwnerVO loginOwner = (OwnerVO)session.getAttribute("loginOwner");
			StoreVO storeVO = storeService.selectStoreByCode(loginOwner.getStoreCode());
			
			if(storeVO.getStoreImageUrl() != null)
			deleteFile(storeFrontImgPath+File.separator+storeVO.getStoreImageUrl().split("fileName=")[1]);
			
			storeVO.setStoreImageUrl(imgUrl);
			storeService.updateStore(storeVO);
			session.setAttribute("loginStore", storeVO);
			result = new ResponseEntity<String>(imgUrl,HttpStatus.OK);
		}catch (IOException e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping("/store/getImg")
	public ResponseEntity<byte[]> getImg(String fileName, HttpServletRequest request) throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		File sendFile = new File(FilenameUtils.separatorsToSystem(storeFrontImgPath),fileName);
		if(FileUtil.canReadFile(sendFile)) entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(sendFile),HttpStatus.CREATED);
		
		return entity;
	}
	
	@RequestMapping("/store/img/insert")
	public String insertImg(MultipartFile file, HttpServletRequest request,HttpSession session, Model model) throws Exception{
		String url = "jsonView";
		
		int fileSize = 5 * 1024 *1024;
		if(file.getSize() > fileSize) {
			model.addAttribute("msg", "용량 초과");
		}
		String savePath = storeFrontImgPath.replace("/", File.separator);
		String fileName = RandomStringUtils.randomAlphanumeric(20);
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		fileName = fileName + fileFormat;
		File saveFile = new File(savePath,fileName);
		saveFile.mkdirs();
		
		
		try {
			file.transferTo(saveFile);
			String imgUrl = request.getContextPath()+"/store/getImg?fileName=" + fileName;
			OwnerVO loginOwner = (OwnerVO)session.getAttribute("loginOwner");
			
			StoreImageVO imageVO = new StoreImageVO();
			imageVO.setStoreCode(loginOwner.getStoreCode());
			imageVO.setStoreImageExtsn(FilenameUtils.getExtension(file.getOriginalFilename()));
			imageVO.setStoreImageCreat(new Date());
			imageVO.setStoreImageCours(storeFrontImgPath);
			imageVO.setStoreImageName(imgUrl);
			imageVO.setStoreImageOrigin(file.getOriginalFilename());
			storeService.insertStoreImage(imageVO);
		
			model.addAttribute("imageVO",imageVO);

		}catch (IOException e) {
			model.addAttribute("msg", "업로드 오류");
		}
		return url;
	}
	
	
	@RequestMapping("/store/img/delete")
	public String deleteImg(StoreImageVO storeImageVO) throws SQLException{
		storeImageVO = storeService.getStoreImage(storeImageVO);
		File file = new File(storeImageVO.getStoreImageCours());
		file.delete();
		storeService.deleteStoreImage(storeImageVO);
		return "jsonView";
	}

}
