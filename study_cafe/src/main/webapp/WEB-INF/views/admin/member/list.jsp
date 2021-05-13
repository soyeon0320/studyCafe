<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>

<style>
	table thead th {
		text-align:center;
	}
	#detailInfo tr th {
		width: 15%;
	}
</style>

<section>

	<main class="content">
	<div class="flex-column d-flex bg-white pl-3 pr-3 mt-2" style="height: auto;">

	<div class="row mt-20">
		<div class="col-md-4">
			<div class="portlet-box portlet-shadow  mb-30" >
			<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
				<div class="flex d-flex flex-column">
					<h2>성별</h2>
				</div>
			</div>
			<div class="portlet-body">
				<div id="genderDonut">
				</div>
			</div>		
		</div>
	</div>	
	<div class="col-md-4">
		<div class="portlet-box portlet-shadow  mb-30" >
		<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
			<div class="flex d-flex flex-column">
				<h2>연령대</h2>
			</div>
		</div>
		<div class="portlet-body">
			<div id="ageDonut">
			</div>
		</div>		
		</div>
	</div>	
	<div class="col-md-4">
		<div style="margin: auto;">
			<div class="portlet-box portlet-shadow  mb-30" >
			<div class="portlet-header flex-row flex d-flex align-items-center b-b ">
				<div class="flex d-flex flex-column">
					<h2>유입경로</h2>
				</div>
			</div>
			<div class="portlet-body">
				<div id="routeDonut">
				</div>
			</div>		
			</div>
		</div>
	</div>
	</div>

	<div class="row">
		<div class="col-md-7">
			<div style="text-align: center;" class="mt-20">
				<h1>이용 회원 목록</h1>
			</div>
			
			<form:form commandName="memberFormVO" id="listForm" name="listForm" method="post">
			<form:hidden path="memberVO.memId" id="detailNo"/>
		
			<div id="keyword" class="card-tools float-right mb-20" style="width:550px;">
				<div class="input-group row">	
					<form:select path="searchMemberVO.pageUnit" cssClass="form-control col-md-3" onchange="go_action('list');">
						<form:options items="${memberFormVO.searchMemberVO.pageUnitSelector}" itemValue="pageUnitValue" itemLabel="pageUnitLabel"/>
					</form:select>
					<form:select path="searchMemberVO.searchCondition" cssClass="form-control col-md-3" id="searchMemberVO.searchCondition" name="searchMemberVO.searchCondition">
						<form:options items="${codeList}" itemValue="codeId" itemLabel="codeIdNm"/>
					</form:select>
					<form:input type="text" path="searchMemberVO.searchKeyword" cssClass="form-control col-md-5" name="searchMemberVO.searchKeyword" placeholder="검색어를 입력해주세요."/>
					<span class="input-group-append">
						<button class="btn btn-success" type="button" name="searchMemberVO.searchKeyword" onclick="go_action('list');">
							<i class="fa fa-fw fa-search"></i>검색
						</button>
					</span>
				</div>
			</div>
			
			<table class="table table-hover mt-20">
				<thead>
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 20%;">아이디</th>
						<th style="width: 15%;">이름</th>
						<th style="width: 10%;">성별</th>
						<th style="width: 15%;">전화번호</th>
						<th style="width: *;">이메일</th>
					</tr>
					<c:if test="${empty memberList}">
						<tr>
							<td colspan="6">
								<strong>회원이 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>
				</thead>
				<tbody>
					<c:forEach var="list" items="${memberList}">
						<tr style="cursor: pointer; text-align: center;" onclick="getMemberFn('${list.memId}')">
							<td>${list.rnum}</td>
							<td>${list.memId}</td>
							<td>${list.memName}</td>
							<td>${list.memGen}</td>
							<td>${list.memTel}</td>
							<td>${list.memEmail}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="container clearfix" style="width: fit-content;">
				<ul class="pagination pagination-circle pagination-3d pagination-light">
					<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
				</ul>    
			</div>
			
			<form:hidden path="searchMemberVO.pageIndex" id="pageIndex"/>
			
			</form:form>
		</div>
		<div class="col-md-5">
			<div style="text-align: center;" class="mt-20">
				<h1>이용 회원 조회</h1>
			</div>
			
				<div class="container clearfix col-md-12 mt-40">
					<table class="table table-bordered mt-20" id="detailInfo" style="display: none;">
						<tr>
							<th>아이디</th>
							<td><span id="memIdPrint"></span></td>
							<th>이름</th>
							<td><span id="memNmPrint"></span></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><span id="memTelPrint"></span></td>
							<th>이메일</th>
							<td><span id="memEmailPrint"></span></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><span id="memGenPrint"></span></td>
							<th>유입경로</th>
							<td><span id="memRoutePrint"></span></td>
						</tr>
						<tr>
							<th>메모</th>
							<td colspan="3" style="height: 350px;"><span id="memMemoPrint"></span></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</main>
	<%@ include file="/WEB-INF/views/common/common.jsp" %>
		
</section>

<script type="text/javascript">
window.onload=function() {
	DonutFn();
}

function DonutFn() {
	Morris.Donut({
		  element: 'genderDonut',
		  data: [
		    <c:forEach items="${memberGenderStatic}" var="gender">
		    	{value:"${gender.maleCount}", label : "남성"}
		    	,{value:"${gender.femaleCount}", label : "여성"}
		    </c:forEach>
		  ],
		  colors:[
				"#5542FF",
				"#E654D3"
			  ],
		  formatter: function (x) { return x + "%"}
		});
	
	Morris.Donut({
		  element: 'ageDonut',
		  data: [
		    <c:forEach items="${memberAgeStatic}" var="age">
		    {value:"${age.calcCount1}", label : "10대"}
		    ,{value:"${age.calcCount2}", label : "20대"}
		    ,{value:"${age.calcCount3}", label : "30대"}
		    ,{value:"${age.calcCount4}", label : "40대"}
		    ,{value:"${age.calcCount5}", label : "50대"}
		    ,{value:"${age.calcCount6}", label : "60대"}
		    </c:forEach>
		  ],
		  colors:[
			  "#4273ED",
			  "#43BFFA",
			  "#4BE0D6",
			  "#45F7A1",
			  "#42ED53",
			  "#FAF660"
		  ],
		  formatter: function (x) { return x + "%"}
		});
	
	Morris.Donut({
		  element: 'routeDonut',
		  data: [
			  <c:forEach items="${memberRouteStatic}" var="route">
		    	{value:"${route.snsCount}", label : "SNS"}
		    	,{value:"${route.adverCount}", label : "광고"}
		    	,{value:"${route.friendCount}", label : "지인"}
		    	,{value:"${route.etcCount}", label : "기타"}
		      </c:forEach>
		  ],
		  colors:[
				"#25DCFA",
				"#28EB76",
				"#1DD122",
				"#7FFA20"
			  ],
		  formatter: function (x) { return x + "%"}
		});
}

function getMemberFn(memId) {
	var data = {
		"memId" : memId
	}
	
	$.ajax({
		url:"<c:url value='/admin/member/detail'/>",
		type:"post",
		data:data,
		success:function(data) {
			console.log(data);
			setMemberFn(data.member);
		}
	});
}

function setMemberFn(member) {
	$("#detailInfo").css("display", "");
	$("#memIdPrint").html(member.memId);
	$("#memNmPrint").html(member.memName);
	$("#memTelPrint").html(member.memTel);
	$("#memEmailPrint").html(member.memEmail);
	if(member.memGen == "M") {
		$("#memGenPrint").html("남성");
	}else {
		$("#memGenPrint").html("여성");
	}
	$("#memRoutePrint").html(member.memRoute);
	$("#memMemoPrint").html(member.memMemo);
}

</script>