package kr.co.scm.store.web;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.scm.store.service.InspectionService;

@Controller
@RequestMapping(value="/store/inspection")
public class InspectionController {
	@Autowired
	private InspectionService inspectionService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(ModelAndView mav) throws SQLException {
		String url = "store/inspection/list.store";
		mav.setViewName(url);
		return mav;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detail(ModelAndView mav) throws SQLException {
		String url = "store/inspection/detail.store";
		mav.setViewName(url);
		return mav;
	}
}
