<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div role="tabpanel" class="tab-pane" id="tb3">
	<div class="bg-white p-3 border1 rounded ">
		<div role="form">
			<div class="title-sep sep-white text-left text-primary mb-10">
				<span class="rounded">가맹주 정보 수정</span>
			</div>
			
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
					<label for="fname">ID</label>
					<input id="fname" type="text" class="form-control" readonly="readonly" placeholder="가맹주 ID">
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="form-group">
					<label for="lname">이름</label>
					<input id="lname" type="text" class="form-control" placeholder="박대덕">
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label for="username">전화번호</label>
						<input id="username" type="tel" class="form-control" placeholder="10 9960 5957">
					</div>
				</div>
				
				<div class="col-sm-6">
					<div class="form-group">
						<label for="email">이메일 주소</label>
						<input id="email" type="email" class="form-control" placeholder="s856@gmail.com">
					</div>
				</div>
			</div>
		</div>
			
		<div class="title-sep sep-white text-left text-primary  mt-30 mb-10">
			<span class="rounded">비밀번호 변경</span>
		</div>
			
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<label for="ps1">현재 비밀번호</label>
					<input id="ps1" type="password" class="form-control" placeholder=".......">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="form-group">
					<label for="ps2">새 비밀번호</label>
					<input id="ps2" type="password" class="form-control" placeholder="........">
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label for="ps3">비밀번호 확인</label>
					<input id="ps3" type="password" class="form-control" placeholder="........">
				</div>
			</div>
		</div>
	
		<div class="pt-3 text-right">
			<button type="button" class="btn btn-icon btn-gradient-primary">
				<i class="fa fa-cog"></i> 변경
			</button>
		</div>
		
		<div class="title-sep sep-white text-left text-primary  mt-30 mb-10">
			<span class="rounded">매장 정보 변경</span>
		</div>
		
		<div class="row">
			<div class="col-sm-12">
				<div class="form-group">
					<form action="">
						<label for="add">매장 주소</label>
						<input id="add" type="text" class="form-control" name="storeAddr" placeholder="" readonly="readonly" onclick="">
						<input type="hidden" name="addrDonmName">
						<input type="hidden" name="addrSigugunName">
						<input type="hidden" name="storeMapX">
						<input type="hidden" name="storeMapY">
					</form>
				</div>
			</div>
		</div>
		<div class="pt-3 text-right">
			<button type="button" class="btn btn-icon btn-gradient-primary">
				<i class="fa fa-cog"></i> 주소 변경
			</button>
		</div>
	</div>
</div>