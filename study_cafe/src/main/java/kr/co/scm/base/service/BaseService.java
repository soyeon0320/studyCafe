package kr.co.scm.base.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.co.scm.common.dao.CodeMapper;

@Service("baseService")
public class BaseService {
	protected Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Resource(name="codeMapper")
	private CodeMapper codeMapper;
	
}
	

