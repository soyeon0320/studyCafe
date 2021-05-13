<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<style>

	#vocBG{
		background-image: url('<c:url value="/resources/images/voc.jpg" />');
		background-size: 100% 100%;
		padding-top: 20px;
		padding-bottom: 20px;
		background-repeat: no-repeat;
	}
	#vocBG p, #vocBG h1, #vocBG hr{
		color: white;
	}
</style>

<section>
	<form:form commandName="vocFormVO" id="listForm" name="listForm" method="post">
		<form:hidden path="vocVO.vocNo" id="detailNo" />
		<div class="container clearfix">
			
			<div id="vocBG" align="center" class="mb-40">
				<p >Spring Study</p>
				<h1 >고객의 소리</h1>
				<hr width="40px;">
				<p >Spring Study Cafe에 전하고 싶은 불만, 칭찬을 보내주세요.</p>
				<p> 항상 고객의 소리에 귀 기울이며 고객만족 향상을 위해 노력하겠습니다.</p>
			</div>
			
			<div style="display: inline-block; float: right; margin-bottom: 30px;">
				<a class="btn btn-success" href="javascript:go_action('registView');"><span>고객의 소리 등록</span></a>
			</div>		
			
			<table class="table table-hover">
				<colgroup>
					<col>
					<col width="60%">
					<col>
					<col>
				</colgroup>	
			
			
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vocList}" var="voc">
						<tr onclick="go_detail(${voc.vocNo})" style="cursor: pointer;" align="center">
							<td>${voc.rnum }</td>
							<td align="left">${voc.vocTitle }</td>
							<td><fmt:formatDate value="${voc.vocRegDate }" pattern="yyyy-MM-dd" /></td>
							<c:if test="">
								<c:set></c:set>
							</c:if>
							<c:choose>
								<c:when test="${voc.vocStatus eq '답변완료'}">
									<c:set value="badge badge-text text-white badge-success" var="answerBadge" />
								</c:when>
								<c:otherwise>
									<c:set value="badge badge-text text-black  badge-light" var="answerBadge" />
								</c:otherwise>
							</c:choose>
							<td><span style="width: 62px !important" class="${answerBadge }" >${voc.vocStatus }</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>    
		</div>    
		<form:hidden path="searchVocVO.pageIndex" id="pageIndex"/>
	</form:form>
</section>
<script>

</script>
