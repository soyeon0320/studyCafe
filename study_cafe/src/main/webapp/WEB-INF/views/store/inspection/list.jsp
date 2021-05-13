<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	table thead th {
		text-align:center;
	}
</style>
    
<section>
	<div style="text-align: center;" class="mt-20">
		<h1>일일 점검 목록</h1>
	</div>

	<div class="input-group row mt-20">
		<div class="col-md-2" style="text-align: center;">
	   		일일 진행도
	   </div>
		<div class="col-md-9">
			<div class="progress bg-white shadow-sm mb-3" style="height: 15px">
		       <div style="width: 75%" class="progress-bar bg-primary progress-bar-animated progress-bar-striped">
		       </div>
		   </div>
	   </div>
	   <div class="col-md-1">
	   		75%
	   </div>
	</div>
	
	<div class="col-9">
		<div class="row">
			<select  class="form-control col-md-2">
				<option value="">날짜 선택</option>
			</select>
			<div class="input-group row col-md-4">
				<input type="text" class="form-control" placeholder="가맹점명을 입력해주세요."/>
				<span class="input-group-append">
					<button class="btn btn-icon btn-info" type="button">
						<i class="fa fa-fw fa-search"></i><span>검색</span>
					</button>
		 		</span>
			</div>
		</div>
	</div>
	
	<div class="input-group row mb-20 mt-20">
		<table class="table table-hover col-md-12">
			<thead>
	 			<tr>
	 				<th style="width:10%;">순번</th>
	 				<th style="width:15%;">가맹점코드</th>
	 				<th style="width:*;">가맹점명</th>
	 				<th style="width:15%;">가맹점주명</th>
	 				<th style="width:15%;">총점</th>
	 			</tr>
			</thead>
			<tbody>
				<tr style="cursor: pointer;" onclick="javascript:location.href='<%=request.getContextPath()%>/store/inspection/detail'">
					<td>1</td>
					<td>plant</td>
					<td>플랜트 스터디카페</td>
					<td>봄</td>
					<td>0.0/5</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>