<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	table th {
		text-align: left;
		
	}
	table thead th {
		text-align:center;
	}
	
	span.history-span{
	    width: auto !important;
	    height: auto !important;
	    line-height: 1 !important;
	    padding: .35rem .35rem;
	    border-radius: 4px;
	    font-size: .8rem;
	    position: relative;
	    display: inline-block !important;
	    background-color: #ccf5e36b !important;
	    color: #147831e3;
	    border-color: rgb(113 218 85 / 20%);
}

	    
	}
</style>

<section>
	<form:form commandName="storeFormVO" id="listForm" name="listForm" method="post" action="list">
	<form:hidden path="searchStoreVO.pageUnit"/>
	<input type="hidden" id="memId" name="memId" value="${loginUser.memId}"/>
	
	<div class="row">
		<div class="col-4">
			<h1>매장 검색</h1>
		</div>
		<div class="col-8 pt-10">
			<div class="row">
				<form:select path="searchStoreVO.addrDonmCode" cssClass="form-control col-md-3" onchange="getSigugunFn(this.value);">
					<option value="">시/도</option>
					<form:options items="${donmList}" itemValue="addrDonmCode" itemLabel="addrDonmName"/>
				</form:select>
				<form:select path="searchStoreVO.addrSigugunCode" cssClass="form-control col-md-3" id="sigugunList">
					<option value="">시/구/군</option>
				</form:select>
				<div class="input-group row col-md-6">
					<form:input path="searchStoreVO.searchKeyword" type="text" name="searchStoreVO.searchKeyword" cssClass="form-control col-md-8" placeholder="가맹점명을 입력해주세요."/>
					<span class="input-group-append">
						<button class="btn btn-icon btn-info" type="button" onclick="searchFn()">
							<i class="fa fa-fw fa-search"></i><span>검색</span>
						</button>
					</span>
				</div>
			</div>
			<div id="historyBar" style="text-align: right;margin: 10px;padding-right: 24px;">
				
			</div>
		</div>
	</div>
	<c:set var="getDate" value="<%= new Date() %>"/>
	<fmt:formatDate value="${getDate}" pattern="yyyyMMdd" var="date"/>
	<fmt:parseNumber value="${date}" integerOnly="true" var="sysdate"/>

	<div class="input-group row mb-20" style="margin-left: inherit;">
		<table class="table table-hover col-md-12" >
			<thead>
	 			<tr>
	 				<th style="width:8%;">순번</th>
	 				<th style="width:25%;">가맹점명</th>
	 				<th style="width:*;">주소</th>
	 				<th style="width:15%;">연락처</th>
	 				<th style="width:10%;">평점</th>
	 			</tr>
	 			<c:if test="${empty storeList}">
	 				<tr>
	 					<td colspan="5" style="text-align: center;">
	 						<strong>결과가 존재하지 않습니다.</strong>
	 					</td>
	 				</tr>
	 			</c:if>
			</thead>
			<tbody>
				<c:forEach items="${storeList}" var="list">
					<fmt:formatDate value="${list.contractPermitDate}" pattern="yyyyMMdd" var="getConPerDt"/>
					<fmt:parseNumber value="${getConPerDt}" integerOnly="true" var="contractPermitDate"/>
					<tr style="cursor: pointer;" onclick="getStoreInfoFn('${list.storeCode}')">
						<td style="text-align: center;">${list.rnum}</td>
						<td>
							<c:if test="${sysdate - contractPermitDate < 30}">
								<span class="badge text-danger-light badge-warning ml-1 badge-text anibadge"><c:out value="NEW"/></span>
							</c:if>
							${list.storeName}
						</td>
						<td style="text-align: left;">${list.storeAddr}</td>
						<td style="text-align: center;">${list.storePhone}</td>
						<td><input type="number" class="rating" value="${list.storeGrade }" data-size="xs" data-readonly="true" readonly="readonly"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="container clearfix" style="width: fit-content;">
			<ul class="pagination pagination-circle pagination-3d pagination-light">
				<ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="go_page" />
			</ul>  
		</div>
		<form:hidden path="searchStoreVO.pageIndex" id="pageIndex"/>
	</div>
	</form:form>
	
 <div class="col-md-12" id="detailDiv" style="display:none">
     <div class="portlet-box portlet-gutter  mb-30">
          <div class="portlet-body">
             <p class="mb-0 text-muted">
				<div class="input-group row">
				<div class="col-md-4">
					<img src="" id="storeImgPrint" style="width: 100%; height: 100%;"/>
				</div>
				<div class="col-md-8">
				<div style="text-align: center;" class="mb-10">
					<span class="badge text-danger-light badge-success badge-text anibadge"><c:out value="영업중"/></span>
					<span id="storeNamePrint" style="font-size: x-large;"></span>
			        <div class="table table-hover table-mails mb-0 mail-new" style="display: contents;">
		                 <span data-toggle="tooltip" title="" id="scrapTotalCountPrint" data-placement="top" class="btn no-padding bg-trans d-inline-block" data-original-title="">
		                 <button type="button" id="scrapBt" onclick="storeScrapFn()" data-toggle="button" class="btn no-padding bg-trans d-inline-block">
				              <i class="far fa-heart text-muted text-danger" style="font-size: x-large;"></i>
				              <span id="scrapCnt" style="font-size: x-large;"></span>
				         </button>
					     </span>
			        </div>
		        </div>
				<table class="table">
					<colgroup>
						<col style="width: 20%;" />
						<col style="width: *;" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="col">주소</th>
							<td colspan="3"><span id="storeAddrPrint"></span></td>
						</tr>
						<tr>
							<th scope="col">평점</th>
							<td id="storeGrade"></td>
							<th scope="col">가맹점주명</th>
							<td><span id="ownerNamePrint"></span></td>
						</tr>
						<tr>
							<th scope="col">연락처</th>
							<td><span id="storePhonePrint"></span></td>
							<th scope="col">이메일</th>
							<td><span id="ownerEmailPrint"></span></td>
						</tr>
						<tr>
							<th scope="col">좌석수</th>
							<td><span id="storeTotalSeatPrint"></span>개</td>
							<th scope="col">스터디룸수</th>
							<td><span id="studyroomCapaPrint"></span>개</td>
						</tr>
					</tbody>
				</table>
	        </div>
    	</div>
    	
		<div class="input-group row mb-20">
		<div class="col-md-12">
			 <div class="rounded p-3 mt-20" style="text-align: center;">
			    <ul class="nav nav-pills" role="tablist" style="width: fit-content; margin: auto;">
			        <li role="presentation" class="nav-item"><a class="nav-link active show" href="#tb1" aria-controls="tb1" role="tab" data-toggle="tab" style="font-size: medium;"><i class="far fa-question-circle"></i>&emsp;이용 안내</a></li>
			        <li role="presentation" class="nav-item"><a class="nav-link" href="#tb2" aria-controls="tb2" role="tab" data-toggle="tab" style="font-size: medium;"><i class="icon-clipboard-list"></i>&emsp;이용후기</a></li>
			    </ul>
			    <div class="tab-content pt-3">
			        <div role="tabpanel" class="tab-pane show active" id="tb1">
		              <div class="col-lg-12">
                          <div class="portlet-box portlet-gutter  mb-30">
                              <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                  <div class="flex d-flex flex-column">
                                       <h3 style="color: #8BB2F5;font-size: larger;"><i class="icon-line2-info"></i>&emsp;이용 수칙</h3> 
                                  </div>
                              </div>
                              <div class="portlet-body">
                                  <p class="mb-0 text-muted">
                                  	<span id="infoPrint"></span>
                                  </p>
                              </div>
                          </div>
                      </div>
                      
                      <div class="col-lg-12">
                          <div class="portlet-box portlet-gutter  mb-30">
                              <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                  <div class="flex d-flex flex-column">
                                       <h3 style="color: #8BB2F5;font-size: larger;"><i class="icon-hands"></i>&emsp;제공중인 서비스</h3> 
                                  </div>
                              </div>
                              <div class="portlet-body" style="width: fit-content; margin: auto;">
                                  <p class="mb-0 text-muted">
									<img src="<%=request.getContextPath()%>/resources/images/search/service1.JPG" style="width:60px;"/>&emsp;
									<img src="<%=request.getContextPath()%>/resources/images/search/service2.JPG" style="width:60px;"/>&emsp;
									<img src="<%=request.getContextPath()%>/resources/images/search/service3.JPG" style="width:60px;"/>&emsp;
									<img src="<%=request.getContextPath()%>/resources/images/search/service4.JPG" style="width:60px;"/>&emsp;
									<img src="<%=request.getContextPath()%>/resources/images/search/service5.JPG" style="width:60px;"/>&emsp;
									<img src="<%=request.getContextPath()%>/resources/images/search/service7.JPG" style="width:60px;"/>&emsp;
								</div>
                          </div>
                      </div>
                      
                      <div class="col-lg-12">
                          <div class="portlet-box portlet-gutter  mb-30">
                              <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                  <div class="flex d-flex flex-column">
                                       <h3 style="color: #8BB2F5;font-size: larger;"><i class="fas fa-laptop"></i>&emsp;렌탈 기기 현황</h3> 
                                  </div>
                              </div>
                              <div id="storeEquipPrint">
									
                              </div>
                          </div>
                      </div>
			
                      <div class="col-lg-12">
                          <div class="portlet-box portlet-gutter  mb-30">
                              <div class="portlet-header flex-row flex d-flex align-items-center b-b">
                                  <div class="flex d-flex flex-column">
                                       <h3 style="color: #8BB2F5;font-size: larger;"><i class="fas fa-map"></i>&emsp;위치</h3> 
                                  </div>
                              </div>
                              <div class="portlet-body" style="margin-left: inherit;">
                              		<div id="map" style="width:100%;height:400px;"></div>
                              </div>
                          </div>
                      </div>
			   		</div>
 		     
		        <div role="tabpanel" class="tab-pane" id="tb2">
			         <table class="table table-hover col-md-12">
				 		<thead>
				  			<tr>
				  				<td style="width:10%;">NO</td>
				  				<th style="width:*;">후기</th>
				  				<th style="width:15%;">평점</th>
				  				<th style="width:15%;">작성자</th>
				  				<th style="width:15%;">작성일</th>
				  			</tr>
				 		</thead>
				 		<tbody id="storeReviewPrint">
				 		</tbody>
					</table>
					<div class="container clearfix" style="width: fit-content;" id="storeReviewPaging">
						<ul class="pagination pagination-circle pagination-3d pagination-light" id="reviewPagination">
						</ul> 
					</div>
					<input type="hidden" name="pageIndex" value="1" id="reviewPageIndex">
		        </div>
			    </div>
			</div>
		</div>
	</div>
</div>
</div>
</div>

</section>

<script>
window.addEventListener("load",function(){
	get_store_history();
});
</script>

<script>
	var storeCodeParam = "";
	var scrapCnt = "";
	
	function getSigugunFn(param) {
		var data = {
			"addrDonmCode" : param
		};
		
		$.ajax({
			url:"<c:url value='/store/sigugun'/>",
			type:"post",
			data:data,
			success:function(data) {
				setSigugunFn(data.sigugunList);
			}
		});
	}
	
	function setSigugunFn(sigugunList) {
		var str = "<option value=''>시/구/군</option>";
		$.each(sigugunList, function(idx, item) {
			
			str += "<option value=" + item.addrSigugunCode + ">" + item.addrSigugunName + "</option>";
		});
		
		$("#sigugunList").html(str);
	}
	
	function searchFn() {
		$("#pageIndex").val(1);
		$("form[name='listForm']").submit();
	}
	
	function getStoreInfoFn(storeCode) {
		var data = {
			"memId" : $("#memId").val(),
			"storeCode" : storeCode,
			"pageIndex" : $("#reviewPageIndex").val()
		}
		
		$.ajax({
			url:"<c:url value='/store/detail'/>",
			type:"post",
			data:data,
			success:function(data) {
				$("#detailDiv").css("display", "");
				setStoreInfoFn(data.store);
				storeCodeParam = data.store.storeCode;
				setStoreEquipInfoFn(data.store.equipList);
				getStoreReviewInfoFn();
				set_store_history(data.store);
				if($("#memId").val() == "") {
					$("#scrapTotalCountPrint").attr("data-original-title", "로그인이 필요합니다.");
				}else {
					if(data.scrapFlag == 1) {
						$("#scrapBt").attr("aria-pressed", "true").attr("class", "btn no-padding bg-trans d-inline-block active");
					}else if(data.scrapFlag == 0) {
						$("#scrapBt").attr("aria-pressed", "false").attr("class", "btn no-padding bg-trans d-inline-block");
					}
				}
			}
		})
	}
	
	function setStoreInfoFn(store) {
		$("#storeNamePrint").html(store.storeName);
		$("#storeAddrPrint").html(store.storeAddr);
		$("#ownerNamePrint").html(store.ownerName);
		$("#storePhonePrint").html(store.storePhone);
		$("#ownerEmailPrint").html(store.ownerEmail);
		$("#storeTotalSeatPrint").html(store.storeTotalSeat);
		$("#studyroomCapaPrint").html(store.studyroomCapa);
		$("#infoPrint").html(store.usingGuide);
		scrapCnt = store.storeScrapCnt;
		$("#scrapCnt").text(scrapCnt);
		var star = $("<input type='number' class='rating rating-input' data-size='xs' data-readonly='true' readonly='readonly' />");
		star.val(store.storeGrade);
		$("#storeGrade").html(star);
		$("#storeGrade input[type=number]").rating();
		set_store_map(store.storeMapX,store.storeMapY);
		if(store.storeImageUrl != null) {
			$("#storeImgPrint").attr("src", store.storeImageUrl);
		}else {
			$("#storeImgPrint").attr("src", "<%=request.getContextPath()%>/resources/images/store/noImage.jpg");
		}
	}
	
	function setStoreEquipInfoFn(equipList) {
		if(equipList.length > 0) {
			var str = "";
			$.each(equipList, function(idx, item) {
				if(idx % 3 == 0) {
					str += "</div><div class='row mt-10 mb-10' style='margin: auto;'>";
				}
					str += "<div class='col-xl-4'>";
					str += "<div class='iCard border1 p-2 rounded bg-white'>";
					str += "<div class='iCard-content p-1'>";
					str += "<h3 class='fs16 text-dark text-capitalize'>" + item.equipName + "</h3>";
					str += "<span class='iCard-meta d-block'>" + item.equipCnt + "개 </span>";
					str += "</div>";
					str += "</div>";
				if(idx % 3 == 0) {
					str += "</div>";
				}
				if(idx % 3 != 0) {
					str += "</div>";
				}
			});
			$("#storeEquipPrint").html(str);
		}else {
			$("#storeEquipPrint").html("<div style='text-align:center;' class='mt-10 mb-10'>대여 가능한 기기가 없습니다.</div>");
		}
	}
	
	function storeScrapFn() {
		var updateScrapCnt = "";
		
		if($(".icon-line2-logout").length == 0){
			event.stopPropagation();
		}
		
		var data = {
			"memId" : $("#memId").val(),
			"storeCode" : storeCodeParam
		}
		
		if($("#scrapBt").attr("aria-pressed", "true") && $("#scrapBt").hasClass("active")) {
			$.ajax({
	 			url:"<c:url value='/scrap/store/remove'/>",
	 			type:"post",
	 			data:data,
	 			success:function(data) {
	 				updateScrapCnt = parseInt(scrapCnt);
	 				$("#scrapCnt").text(updateScrapCnt);
	 			}
	 		});
			return;
		}
		
		if($("#scrapBt").attr("aria-pressed", "false")) {
			$.ajax({
				url:"<c:url value='/scrap/store/regist'/>",
				type:"post",
				data:data,
				success:function(data) {
					updateScrapCnt = parseInt(scrapCnt) + parseInt(1);
					$("#scrapCnt").text(updateScrapCnt);
				}
			});
			return;
		}
	}
	
	function setStoreReviewInfoFn(reviewList) {
		$("#storeReviewPrint").empty();
		
		if(reviewList.length > 0) {
			$.each(reviewList, function(idx, item) {
				var table = $("<tr></tr>");
				$(table).append("<td>" + item.rnum + "</td>");
				var star = $("<td role='star'><input type='number' class='rating rating-input'  data-size='xs' data-readonly='true' readonly='readonly'/></td>");
				star.children('input').val(item.grade);
				$(table).append("<td style='text-align: left;'>"+ item.reviewContent + "</td>");
				$(table).append(star);
				$(table).find("td[role=star] input").rating();
				$(table).append("<td>"+ item.memId + "</td>");
				$(table).append("<td>"+ getTimeStamp(item.reivewRegDate).substr(0,10) + "</td>");
				$("#storeReviewPrint").append(table);
				$("#storeReviewPaging").css("display", "");
			});
		}else {
			$("#storeReviewPrint").html("<tr> <td colspan='5'> 이용 후기가 존재하지 않습니다. </td> </tr>");
			$("#storeReviewPaging").css("display", "none");
		}
	}
	
	function getStoreReviewInfoFn() {
		var data = {
			"storeCode" : storeCodeParam,
			"pageIndex" : $("#reviewPageIndex").val(),
		};
		
		$.ajax({
			url:"<c:url value='/store/review/paging'/>",
			type:"post",
			data:data,
			success:function(data) {
				setStoreReviewInfoFn(data.reviewList);
				set_paging(data.paginationInfo, "page_store", "#reviewPagination");
			}
		});
	}
	
	function page_store(pageIndex) {
		$("#reviewPageIndex").val(pageIndex);
		getStoreReviewInfoFn();
	}
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbea63cb822289d85b4dad46b5958150&libraries=services"></script>
<%@ include file="map.jsp" %>


<script>

function get_store_history(){
	var store_history_name = JSON.parse(localStorage.getItem("store_history_name"));
	var store_history_code = JSON.parse(localStorage.getItem("store_history_code"));
	
	if(store_history_name){
		var length = store_history_name.length;
		for (var i = 0; i < length; i++) {
			$("#historyBar").append($("<span class='history-span mr-2 mb-2'>"+store_history_name.pop()+"</span>")
										.attr("onclick","getStoreInfoFn('"+store_history_code.pop()+"')")
										.css({
											"cursor": "pointer"
										})
									);
		}
	}
}

function set_store_history(store){
 	var store_history_name = new Stack(5,JSON.parse(localStorage.getItem("store_history_name")));
	var store_history_code = new Stack(5,JSON.parse(localStorage.getItem("store_history_code")));
	if(store_history_code.data.includes(store.storeCode)){
		store_history_name.data.splice(store_history_name.data.indexOf(store.storeName),1);
		store_history_code.data.splice(store_history_code.data.indexOf(store.storeCode),1);
		
		store_history_name.push(store.storeName);
		store_history_code.push(store.storeCode);
		
		$("span[onclick*="+store.storeCode+"]").remove();
		
		$("#historyBar").prepend($("<span class='history-span mr-2 mb-2'>"+store.storeName+"</span>")
				.attr("onclick","getStoreInfoFn('"+store.storeCode+"')")
				.css({
					"cursor": "pointer"
				}));
		
		localStorage.setItem("store_history_name",JSON.stringify(store_history_name.data));
		localStorage.setItem("store_history_code",JSON.stringify(store_history_code.data));
		
	}else{
		store_history_name.push(store.storeName);
		store_history_code.push(store.storeCode);
		
		localStorage.setItem("store_history_name",JSON.stringify(store_history_name.data));
		localStorage.setItem("store_history_code",JSON.stringify(store_history_code.data));
		
		$("#historyBar").prepend($("<span class='history-span mr-2 mb-2'>"+store.storeName+"</span>")
				.attr("onclick","getStoreInfoFn('"+store.storeCode+"')")
				.css({
					"cursor": "pointer"
				}));
		if($("#historyBar span").length > 5){
			$("#historyBar span").last().remove();
		}
	}
}

</script>