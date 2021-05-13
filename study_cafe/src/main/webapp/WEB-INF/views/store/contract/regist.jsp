<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	table th {
		text-align: end;
		width: 20%;
	}
	.spanColor {
		color: red;
	}
</style>

<section class="content flex" style="background-color: #F2F2F2;">
	<div class="content">
		<div class="container" style="margin-top: 30px;">
			<div class="tabs mx-auto mb-0" id="tab-login-register" style="max-width: 850px;">
				<ul class="tab-nav tab-nav2 center clearfix">
				</ul>
			<div class="tab-container mb-30">
			<div class="tab-content" id="tab-register">
				<div class="card mb-0">
					<div class="card-body">
					<div style="text-align: center;">
						<h1 class="pt-10" onclick="get_test_data()">가맹점 가입</h1>
						<h3>가맹 계약서</h3>
					</div>
					<form action="regist" name="registFm" method="post">
						<table class="table table-hover mt-20">
							<tr>
								<th><span class="spanColor">*</span>가맹점명</th>
								<td>
									<div class="input-group row m-0">
										<input type="text" id="storeName" class="form-control" readonly="readonly"/>
										<input type="hidden" id="storeCode" name="storeCode" value=""/>
										<button class="btn btn-warning" type="button" name="searchBoardVO.searchKeyword" onclick="storeSearchFn();">
											<i class="fa fa-fw fa-search"></i><span>검색</span>
										</button>
										<span class="error_next_box"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>사업자번호</th>
								<td>
									<input type="text" id="businessNumber" name="businessNumber" class="form-control" placeholder="사업자번호를 입력해주세요." maxlength="12"/>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>가맹점주명</th>
								<td>
									<input type="text" id="ownerName" name="ownerName" class="form-control" placeholder="가맹점주명을 입력해주세요."/>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>아이디</th>
								<td>
									<div class="input-group row m-0">
										<input type="text" id="ownerId" name="ownerId" class="form-control" placeholder="아이디를 입력해주세요."/>
									</div>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>비밀번호</th>
								<td>
									<input type="password" id="ownerPass1" class="form-control" placeholder="비밀번호를 입력해주세요."/>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>비밀번호 확인</th>
								<td>
									<input type="password" id="ownerPass2" name="ownerPass" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요."/>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>연락처</th>
								<td>
									<input type="text" id="ownerTel" name="ownerTel" class="form-control" placeholder="연락처를 입력해주세요." maxlength="13"/>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>이메일</th>
								<td>
									<div class="input-group row m-0">
										<input type="email" id="ownerEmail" name="ownerEmail" class="form-control" placeholder="이메일을 입력해주세요."/>
									</div>
									<span class="error_next_box"></span>
								</td>
							</tr>
							<tr>
								<th><span class="spanColor">*</span>계약기간</th>
								<td>
									<div class="input-daterange component-datepicker input-group">
										<input type="text" id="date_timepicker_start" name="affiliateRegStartDate" value="" autocomplete="off" class="form-control" placeholder="시작기간" autocomplete="off" readonly="readonly">
										<div class="input-group-prepend"><div class="input-group-text">~</div></div>
										<input type="text" id="date_timepicker_end" name="affiliateRegEndDate" value="" class="form-control text-left" placeholder="종료기간" autocomplete="off" readonly="readonly">
									</div>
								</td>
							</tr>
							<tr>
								<th>【 계약기준 】</th>
								<td>“을”은 “갑”의 매장을 할애하여 영업함에 있어 “을”은 항시 상품구색을 완비하고 최우수상품을  취급하며 고객의 반품요구가 있을 때에는 교환, 수리등 판매관리를 성실히 하여 “갑”의 상업규정에 따라 행하며, “을”은 책임을 진다.</td>
							</tr>
							<tr>
								<th>【 시설 관리 】</th>
								<td>“을”이 판매장을 형성하기 위한 설비, 간판, 장치, 장식물, 진열기기 등은 “을”의 부담으로 함을 원칙으로 한다.
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
								<td> “을”의 영업상 필요한 제허가 및 면허는 “을”의 책임하에 “을”의 명의로 하고, 제세  및 공과금도 “을”이 부담하여야 한다.
									<br/>		
						             “을”이 당국의 허가를 요하는 업종을 영위할 경우에는 영업허가는 “을”의 명의로 제출하고 영업상의 대외적 책임은 일체 “을”에게 있다.
									<br/>		
						             “을”이 부주의 및 허가 면허조건상의 의무불이행 등으로 “갑” 소유의 허가, 면허등이  취소되는 경우에는 “을”의 책임으로 상기의 허가 및 면허를 복구해야 한다.
						       </td>
							</tr>
							<tr>
								<th>【 입  금 】</th>
								<td>“을”은 “갑”의 금전등록기 이용지침에 의거 입금해야 하며 매일 마감시 현금과다의 경우는 입금액을 기준해야 하며, 현금 부족의 경우는 금전등록기의 등록액을 기준으로 한다.</td>
							</tr>
							<tr>
								<th>【 사용인 】</th>
								<td>본 계약에서 “을”의 사용인이라 함은 “을”의 업무에 종사하는 점원, 고용원 및 기타  “을”의 영업에 관련된 일체의 종사원을 칭한다.
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
								<td>책임을 “을”이 다하지 못하였거나 종사원들이 부정행위가 있을 경우</td>
							</tr>
							<tr>
								<th>【 손해배상 】</th>
								<td>“을”은 본 계약 목적물 및 대여품에 대하여 선량한 관리자의 주의를 다하여 관리하여야 한다.
									<br/>
					             	 “을”의 사용인 및 그 고객의 고의 또는 과실로 인하여 “갑”에게 손해를 입 힌 경우에는 “을”은 지체없이 원상복구하여야 한다.
									<br/>
					            	손해액의 산출은 배상당시의 시가에 따라 “갑”이 결정하는 바에 따른다.
					            </td>
							<tr>
								<td colspan="2" style="text-align: center;">
									<span>본인은 가맹점 약관에 동의하며 위 사항과 같이 가맹점 가입 신청서를 제출합니다.</span>
									<br/>
									<div class="customUi-checkbox checkboxUi-primary pb-2">
                                         <input id="chk2" type="checkbox" name="agree">
                                         <label for="chk2">
                                             <span class="label-checkbox"></span>
                                             <span class="label-helper">동의함</span>
                                         </label>
                                     </div>
								</td>
							</tr>
						</table>
					</form>
					<div style="text-align: center;" class="mb-20">
						<button class="btn btn-info" id="registBt" name="registBt" onclick="registFn()"><i class="icon-pencil2"></i> 등록</button>
						<button class="btn btn-secondary" onclick="javascript:history.go(-1)"><i class="icon-line-corner-up-left"></i> 뒤로가기</button>
						<br/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>

</section>

<script src="<%=request.getContextPath() %>/resources/regist.js"></script>

<script type="text/javascript">
	function registFn() {
		var storeName = $("#storeName").val();
		if(storeName == "") {
			alert("매장을 검색해주세요.");
			return;
		}
		
		checkBusinessNumber();
		checkOwnerName();
		checkOwnerId();
		checkOwnerPass();
		checkCompareOwnerPass();
		checkOwnerTel();
		checkOwnerEmail();
		
		if($("input:checkbox[name='agree']").is(":checked")==false) {
			alert("동의함을 체크해주세요.");
			return;
		}
		
		alert("가맹점 가입 신청에 성공하셨습니다!");
		
		$("form[name='registFm']").submit();
	}
</script>

<script>
window.addEventListener("onload",function(){
	$('.component-datepicker.input-daterange').datepicker({
		autoclose: true
		, format: 'yyyy/m/dd' 
	});
});

function storeSearchFn() {
	OpenWindow("<c:url value='/common/saerchStore?searchStoreVO.storeContractStatus=CS01'/>", '매장 검색', 700, 600);
}

function setStoreCode(storeCode, storeName) {
	$("#storeCode").val(storeCode);
	$("#storeName").val(storeName);
}

function get_test_data(){	
	$("#businessNumber").val("138-22-51412").trigger("focus");
	$("#ownerName").val("김현수").trigger("focus");
	$("#ownerId").val("hyys1234").trigger("focus");
	$("#ownerPass1").val("testpass").trigger("focus");
	$("#ownerPass2").val("testpass").trigger("focus");
	$("#ownerTel").val("010-5512-2314").trigger("focus");
	$("#ownerEmail").val("hy1234@naver.com").trigger("focus");
	$("input[name=affiliateRegStartDate]").val("2021/05/08");
	$("input[name=affiliateRegEndDate]").val("2022/11/23");
	$("body").click();
}
</script>
