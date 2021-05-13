package kr.co.scm.common.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.scm.base.web.BaseController;
import kr.co.scm.board.service.NoticeService;
import kr.co.scm.board.service.StudygroupService;
import kr.co.scm.board.vo.AttachVO;
import kr.co.scm.board.vo.NoticeVO;
import kr.co.scm.board.vo.StudygroupVO;
import kr.co.scm.common.vo.AddrVO;
import kr.co.scm.mypage.service.MyPageService;
import kr.co.scm.mypage.vo.ReviewVO;
import kr.co.scm.store.service.StoreService;
import kr.co.scm.store.vo.StoreFormVO;
import kr.co.scm.store.vo.StoreVO;
import kr.co.scm.user.service.MemberService;

@Controller
public class CommonController extends BaseController{
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private StudygroupService studygroupService;
	
	@Autowired
	private MyPageService mypageService;
	
	@Resource(name="imgPath")
	private String imgPath;
	
	@Resource(name="fileUploadPath")
	private String fileUploadPath;
	
	@RequestMapping(value= {"/home","/"})
	public String home(Model model,HttpSession session) throws Exception {
	
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setRecordCountPerPage(5);
		noticeVO.setFirstIndex(0);
		List<NoticeVO> noticeList = noticeService.retrievePagingList(noticeVO);
		model.addAttribute("noticeList", noticeList);
		session.setAttribute("onNotice", new ObjectMapper().writeValueAsString(noticeList));
		
		StudygroupVO studygroupVO = new StudygroupVO();
		studygroupVO.setRecordCountPerPage(5);
		studygroupVO.setFirstIndex(0);
		model.addAttribute("studygroupList", studygroupService.studygroupPagingList(studygroupVO));
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setRecordCountPerPage(5);
		reviewVO.setFirstIndex(0);
		model.addAttribute("reviewList",mypageService.getReivewList(reviewVO));
		
		return "user/home.member";
		
	}
	

	@RequestMapping("/common/saerchStore")
	public String searchStore(StoreFormVO storeFormVO, Model model) throws SQLException{
		String url = "common/store_search.open";
		
		StoreVO searchStoreVO = storeFormVO.getSearchStoreVO();
		PaginationInfo paginationInfo = new PaginationInfo();

		searchStoreVO.setPageUnit(5);
		setUpPaginationInfo(paginationInfo, searchStoreVO);
		
		List<StoreVO> storeList = storeService.getStoreListByAddr(searchStoreVO);
		
		int totalCnt = storeService.getStoreListTotalCnt(searchStoreVO);
		paginationInfo.setTotalRecordCount(totalCnt);
		model.addAttribute("storeList",storeList);
		model.addAttribute("paginationInfo",paginationInfo);
		model.addAttribute("storeFormVO",storeFormVO);
		model.addAttribute("donmCodeList", codeService.getAddrDonmList());
		return url;
	}
	
	@RequestMapping("/common/sigugun")
	public String getSigugun(Model model,AddrVO addrVO) throws SQLException {
		model.addAttribute("sigugunCodeList", codeService.getAddrSigugunList(addrVO));
		return "jsonView";
	}
	
	
	@RequestMapping("/common/uploadImg")
	public ResponseEntity<String> uploadImg(MultipartFile file, HttpServletRequest request) throws Exception{
		ResponseEntity<String> result = null;
		int fileSize = 5 * 1024 *1024;
		if(file.getSize() > fileSize) {
			return new ResponseEntity<String>("용량 초과입니다.",HttpStatus.BAD_REQUEST); 
		}
		String savePath = imgPath.replace("/", File.separator);
		String fileName = RandomStringUtils.randomAlphanumeric(20);
		String fileFormat = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		fileName = fileName + fileFormat;
		
		File saveFile = new File(savePath,fileName);
		
		saveFile.mkdirs();
		
		try {
			file.transferTo(saveFile);
			result = new ResponseEntity<String>(request.getContextPath()+"/common/getImg?fileName=" + fileName,HttpStatus.OK);
		}catch (IOException e) {
			result = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping("/common/getImg")
	public ResponseEntity<byte[]> getImg(String fileName, HttpServletRequest request) throws Exception{
		
		ResponseEntity<byte[]> entity = null;
		File sendFile = new File(FilenameUtils.separatorsToSystem(imgPath),fileName);
		if(FileUtil.canReadFile(sendFile)) entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(sendFile),HttpStatus.CREATED);
		
		return entity;
	}
	
	@RequestMapping("/getFile")
	@ResponseBody 
	public FileSystemResource fileDownload(AttachVO attachVO, HttpServletResponse response) throws Exception{
		
		attachVO = attachService.getFile(attachVO);
		File file = new File(FilenameUtils.separatorsToSystem(fileUploadPath),attachVO.getAttachName()+"."+attachVO.getAttachExtsn());
		response.setContentType(MediaType.MULTIPART_FORM_DATA.toString());
		response.setHeader("Content-Disposition", "attachment; filename="+attachVO.getAttachName()+"."+attachVO.getAttachExtsn());	
		
		return new FileSystemResource(file);
	}
	
	@RequestMapping("/common/errorPage")
	public String errorPage() {
		
		return "common/errorPage";
	}

	@RequestMapping("/common/store_dummy")
	public String for_dummy(StoreVO storeVO) throws Exception{
		
		storeVO.setStorePhone("010-"+RandomStringUtils.randomNumeric(4)+"-"+RandomStringUtils.randomNumeric(4));
		storeVO.setStoreCode(RandomStringUtils.randomAlphabetic(2).toUpperCase()+RandomStringUtils.randomNumeric(4));
		
		
		String savePath = "c:\\sql";
		File sql = new File(savePath,"store_insert_sql.txt");
		
		
		String[] addr = codeService.getAddrCode(storeVO);
		storeVO.setAddrDonmCode(addr[0]);
		storeVO.setAddrSigugunCode(addr[1]);
		
		
		BufferedWriter out = new BufferedWriter(new FileWriter(sql,true));
		StringBuffer sb = new StringBuffer("INSERT INTO tb_store (store_code, store_name, store_width \r\n" + 
				"							  ,addr_donm_code ,addr_sigugun_code ,store_total_seat\r\n" + 
				"							  ,store_addr ,store_map_x ,store_map_y ,store_phone\r\n" + 
				"							  ,store_height\r\n" + 
				"							) VALUES (");
		
		sb.append("'"+storeVO.getStoreCode()+"',");
		sb.append("'"+storeVO.getStoreName()+"',");
		sb.append(storeVO.getStoreWidth()+",");
		sb.append("'"+storeVO.getAddrDonmCode()+"',");
		sb.append("'"+storeVO.getAddrSigugunCode()+"',");
		sb.append(storeVO.getStoreTotalSeat()+",");
		sb.append("'"+storeVO.getStoreAddr()+"',");
		sb.append(storeVO.getStoreMapX()+",");
		sb.append(storeVO.getStoreMapY()+",");
		sb.append("'"+storeVO.getStorePhone()+"',");
		sb.append(storeVO.getStoreHeight()+")");
	
		
		
		out.write(sb.toString());
		out.newLine();
		out.close();
		return "jsonView";
	}
	
	
}
