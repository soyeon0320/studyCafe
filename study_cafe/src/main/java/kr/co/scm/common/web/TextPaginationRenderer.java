package kr.co.scm.common.web;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class TextPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public TextPaginationRenderer() {
		// no-op
	}

	/**
	* PaginationRenderer
	*
	* @see 개발프레임웍크 실행환경 개발팀
	*/
	public void initVariables() {
		
		// {0} 은 js 페이지 이동 함수, {1}은 pageNo \" 필수

		firstPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" href='#' onclick=\"{0}({1});return false;\" aria-label='Previous'> << </li>";
		previousPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" href='#' onclick=\"{0}({1});return false;\" aria-label='Previous'> < </li>";
		currentPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning active\" href=\"#\">{0}</a></li>";
		otherPageLabel = "<li class=\"\"><a href='#' class=\"btn-icon-o btn-shadow btn-outline-warning\"   onclick=\"{0}({1}); return false;\">{2}</a></li>";
		nextPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" onclick=\"{0}({1});return false;\" href='#' aria-label='Next'> > </a></li>";
		lastPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" onclick=\"{0}({1});return false;\" href='#' aria-label='Next'> >> </a></li>";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
