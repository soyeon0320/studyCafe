<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	table th {
		text-align: end;
		width: 15%;
	}
</style>

<script src="<%=request.getContextPath()%>/resources/js/pdf/html2canvas.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/pdf/jspdf.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/pdf/auto_table.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/pdf/gulim.js"></script>

<section>

<div id="pdfSection">
	<div style="text-align:center;">
		<h1>${contract.ownerName}님의 계약서</h1>
	</div>
	
	<div style="text-align: right;" id="buttonArea">
		<input type="button" id="pdfBt" value="PDF 다운로드" onclick="pdfDownloadFn()" class="btn btn-info"/>
		<c:if test="${contract.contractStatus eq 'CS02'}">
			<input type="button" id="agreeBt" name="agreeBt" onclick="approvalFn()" value="계약승인" class="btn btn-primary"/>
		</c:if>
		<c:if test="${contract.contractStatus eq 'CS04'}">
			<input type="button" id="extendsMoveBt" value="계약연장" class="btn btn-success" data-toggle="modal" data-target="#extendsModal"/>
		</c:if>
	</div>
	
	<form action="approval" name=detailForm id="detailForm" method="post">
		<input type="hidden" id="storeCode" name="storeCode" value="${contract.storeCode}"/>
		
		<table class="table table-hover mt-15">
			<tr>
				<th>아이디</th>
				<td>${contract.ownerId}</td>
				<th>이름</th>
				<td>${contract.ownerName}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${contract.ownerEmail}</td>
				<th>연락처</th>
				<td>${contract.ownerTel}</td>
			</tr>
			<tr>
				<th>계약상태</th>
					<c:if test="${contract.contractStatus eq 'CS02'}">
						<td>계약요청</td>
					</c:if>
					<c:if test="${contract.contractStatus eq 'CS03'}">
						<td>계약승인</td>
					</c:if>
					<c:if test="${contract.contractStatus eq 'CS04'}">
						<td>계약만료</td>
					</c:if>
					<c:if test="${contract.contractStatus eq 'CS03'}">
						<th>계약승인일</th>
						<td><fmt:formatDate value="${contract.contractPermitDate}" pattern="yyyy-MM-dd"/></td>
					</c:if>
					<c:if test="${contract.contractStatus ne 'CS03' }">
					<th>계약작성일</th>
						<td><fmt:formatDate value="${contract.contractRegDate}" pattern="yyyy-MM-dd"/></td>
					</c:if>
			</tr>
			<tr>
				<th>계약시작일</th>
				<td><fmt:formatDate value="${contract.affiliateRegStartDate}" pattern="yyyy-MM-dd"/></td>
				<th>계약종료일</th>
				<td><fmt:formatDate value="${contract.affiliateRegEndDate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th>매장코드</th>
				<td>${contract.storeCode}</td>
				<th>사업자번호</th>
				<td>${contract.businessNumber}</td>
			</tr>
			<tr>
				<th>매장명</th>
				<td>${contract.storeName}</td>
				<th>매장연락처</th>
				<td>${contract.storePhone}</td>
			</tr>
			<tr>
				<th>매장주소</th>
				<td colspan="4">${contract.storeAddr}</td>
			</tr>
	         <tr>
				<th>【 계약 기준 】</th>
				<td colspan="3">“을”은 “갑”의 매장을 할애하여 영업함에 있어 “을”은 항시 상품구색을 완비하고 최우수상품을  취급하며 고객의 반품요구가 있을 때에는 교환, 수리등 판매관리를 성실히 하여 “갑”의 상업규정에 따라 행하며, “을”은 책임을 진다.</td>
			</tr>
			<tr>
				<th>【 시설 관리 】</th>
				<td colspan="3">“을”이 판매장을 형성하기 위한 설비, 간판, 장치, 장식물, 진열기기 등은 “을”의 부담으로 함을 원칙으로 한다.
             		<br/>
             		전항의 경우 “갑”이 인정할만한 별도 사유가 없는 한 “을”은 “갑”이 지정한 자에게 설계 및 시공을 의뢰하여야 한다.
             		<br/>
             		내부공사에 관한 구분, 절차 및 세부지침은 “갑”이 별도로 정하는 TENANT 점포시설공사 세부지침을 의한다.
             		<br/>
            		전1항의 시설물 등은 해약, 매장명도시에는 철거하고 “갑”의 시설 등은 원상으로 회복시켜야 한다.
             		<br/>
             		“을”은 계약기간 중 구조의 변경, 일부시공, 또는 전기, 수도, 전화, 냉난방 시설, 기타  어떠한 시설을 설치하고자 할 때는 비용이 “을”의 부담이라도 반드시 “갑”의 사전승인을 득하여야 하며, 계약기간 만료 또는 해약시 집기비품 등을 제외한 시설은 “갑”이 철거를 원할 시 “을”의 비용부담으로 원상복구한다.
             	</td>
			</tr>
			<tr>
				<th>【 허가, 면허 관계 】</th>
				<td colspan="3"> “을”의 영업상 필요한 제허가 및 면허는 “을”의 책임하에 “을”의 명의로 하고, 제세  및 공과금도 “을”이 부담하여야 한다.
					<br/>		
		             “을”이 당국의 허가를 요하는 업종을 영위할 경우에는 영업허가는 “을”의 명의로 제출하고 영업상의 대외적 책임은 일체 “을”에게 있다.
					<br/>		
		             “을”이 부주의 및 허가 면허조건상의 의무불이행 등으로 “갑” 소유의 허가, 면허등이  취소되는 경우에는 “을”의 책임으로 상기의 허가 및 면허를 복구해야 한다.
		       </td>
			</tr>
			<tr>
				<th>【 입  금 】</th>
				<td colspan="3">“을”은 “갑”의 금전등록기 이용지침에 의거 입금해야 하며 매일 마감시 현금과다의 경우는 입금액을 기준해야 하며, 현금 부족의 경우는 금전등록기의 등록액을 기준으로 한다.</td>
			</tr>
			<tr>
				<th>【 사용인 】</th>
				<td colspan="3">본 계약에서 “을”의 사용인이라 함은 “을”의 업무에 종사하는 점원, 고용원 및 기타  “을”의 영업에 관련된 일체의 종사원을 칭한다.
					<br/>
                 	“을”은 “을”의 사용인을 “갑”의 장소에 파견코자 할 때는 “을”은 소정절차에 따라  “갑”의 사전 승인을 득해야 하며, 특매행사 등으로 인해 일시적으로 판매사원을 보충   할 시는 아르바이트 패찰을 가슴에 부착하고 근무케 하여야 한다.
                </td>
			</tr>
			<tr>
				<th>【 권리 이전 금지 】</th>
				<td colspan="3">“을”은 “갑”의 서면에 의한 승인없이 위임경영, 명의변경 또는 본 계약상의 권리를  양도, 전매, 전대 및 질권 기타 담보로 제공하지 못한다.
					<br/>
             		“을”이 전항을 위반하는 경우 “갑”은 본 계약을 최고없이 해지할 수 있고 “을”은 이 에 대하여 이의를 제기할 수 없다.
             	</td>
			</tr>
			<tr>
				<th>【 계약의 종료 】</th>
				<td colspan="3">책임을 “을”이 다하지 못하였거나 종사원들이 부정행위가 있을 경우</td>
			</tr>
			<tr>
				<th>【 손해배상 】</th>
				<td colspan="3">“을”은 본 계약 목적물 및 대여품에 대하여 선량한 관리자의 주의를 다하여 관리하여야 한다.
					<br/>
	             	 “을”의 사용인 및 그 고객의 고의 또는 과실로 인하여 “갑”에게 손해를 입 힌 경우에는 “을”은 지체없이 원상복구하여야 한다.
	            </td>
			</tr>
		</table>
	</form>
</div>
	
	<div style="text-align:center;">
		<input type="button" value="닫기" onclick="window.close();" class="btn btn-secondary"/>
	</div>

	<div class="modal fade" id="extendsModal" tabindex="-1" role="dialog" aria-labelledby="extendsModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="extendsModalLabel">계약 연장</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                   	연장일 : <input type="text" id="date_timepicker_end" name="affiliateRegEndDate" value="" class="form-control text-left" autocomplete="off" readonly="readonly" style="width: 50%; display: inline-block;">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="extendsFn()">연장</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

<script>
	window.addEventListener("onload",function(){
		$('.component-datepicker.input-daterange').datepicker({
			autoclose: true
			, format: 'yyyy/m/dd' 
		});
	});
	
	function approvalFn() {
		var res = confirm("${contract.ownerName}님의 계약서를 승인처리 하시겠습니까?");
		var data = {
			"storeCode" : $("#storeCode").val()
		}
		
		if(res) {
			$.ajax({
				url:"<c:url value='/contract/approval'/>",
				type:"post",
				data:data,
				success:function(result) {
					alert("${contract.ownerName}님의 계약서를 승인하셨습니다.");
					$("form[name='detailFm']").submit();
					opener.location.reload();
					window.close();
				},
				error:function(xhr) {
					console.log(xhr);
				}
			});
		}
	}
		
		function pdfDownloadFn() {
			$("#buttonArea").hide();
			
		html2canvas($("#pdfSection")[0]).then(function(canvas) {
		// 캔버스를 이미지데이터로 변환
	    var imgData = canvas.toDataURL('image/png'); 
		    
	    // 이미지크기 지정 (A4 크기 210 * 297)
	    var imgWidth = 200; // 이미지 가로 길이(mm) A4 기준
		var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
	    var pageHeight = 297;  // 출력 페이지 세로 길이 계산 A4 기준
		var imgHeight = (canvas.height * imgWidth / canvas.width) *0.9;
	    var imgHeight = 275;
	    var heightLeft = imgHeight;
		    
 		// PDF객체 생성 (autoTable쓰려면 jspdf.jsPDF사용)
	    var doc = new jspdf.jsPDF("p", "mm", "a4");
	    var positionX = 5;
	    var positionY = 5;
		    
 		 // PDF객체에 이미지 추가
	    doc.addImage(imgData, 'PNG', positionX, positionY ,imgWidth, imgHeight);
	    heightLeft -= pageHeight;

	    doc.save("${contract.ownerId}님의 계약서.pdf");
		});
		
		$("#buttonArea").show();
	}
		
	function extendsFn() {
		//날짜 유효성 검사 : 날짜 얻기 -> 한자리일 때 월, 일 처리 -> split()을 이용하여 배열에 넣기 -> 두 날짜 비교하기
		var today = new Date();
		var year = today.getFullYear();
		var month1 = today.getMonth() + 1;
		var month2 = month1;
		if(month2 < 10) {
			month2 = "0" + month1;
		}
		var date1 = today.getDate();
		var date2 = date1;
		if(date2 < 10) {
			date2 = "0" + date1;
		}
		var sysdate = year + "/" + month2 + "/" + date2;
		var sysdateSplit = sysdate.split("/");
		var sysdateArray = new Date(sysdateSplit[0], sysdateSplit[1], sysdateSplit[2]);
		
		var regEndDate = $("#date_timepicker_end").val().trim();
		var regEndDateSplit = regEndDate.split("/");
		var regEndDateArray = new Date(regEndDateSplit[0], regEndDateSplit[1], regEndDateSplit[2]);
		
		if(sysdateArray.getTime() > regEndDateArray.getTime()) {
			alert("연장일은 현재 날짜보다 작을 수 없습니다.");
			return;
		}
		
		var data = {
			"storeCode" : $("#storeCode").val(),
			"affiliateRegEndDate" : $("#date_timepicker_end").val()
		}
		
		$.ajax({
			url:"<c:url value='/contract/extend'/>",
			type:"post",
			data:data,
			success:function(result) {
				alert("${contract.ownerName}님의 계약서를 연장하셨습니다.");
				$("form[name='detailFm']").submit();
				location.reload();
			},
			error:function(xhr) {
				console.log(xhr);
			}
		});
	}
</script>
	
</section>