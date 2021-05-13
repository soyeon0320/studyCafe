<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<div style="text-align: center;" class="mt-20">
		<h1>일일 점검 상세조회</h1>
	</div>

	<div class="input-group row col-md-6">
		<div class="col-md-6" style="text-align: left;">
			<h5>2021-04-22 &emsp; 점검자 : 박감자</h5>
		</div>
		<div class="col-md-6" style="text-align: right;">
			<button class="btn btn-secondary" onclick="javascript:location.href='<%=request.getContextPath()%>/store/inspection/list'"><i class="icon-list"></i> 목록</button>
		</div>
	</div>

	<div class="input-group row">
		<div class="col-md-6 mb-30 mt-20">
			<table class="table table-bordered mb-0" style="text-align: center;">
		           <thead>
		           <tr>
		               <th>NO</th>
		               <th>항목</th>
		               <th>매우나쁨</th>
		               <th>나쁨</th>
		               <th>보통</th>
		               <th>좋음</th>
		               <th>매우좋음</th>
		           </tr>
		           </thead>
		           <tbody>
		           <tr>
		           		<td>1</td>
		           		<td>책상, 의자, 탁자 등 소독을 완료하였는가?</td>
		           		<td><input type="radio" name="radio1"></td>
		           		<td><input type="radio" name="radio1"></td>
		           		<td><input type="radio" name="radio1"></td>
		           		<td><input type="radio" name="radio1"></td>
		           		<td><input type="radio" name="radio1"></td>
		           </tr>
		           <tr>
		           		<td>2</td>
		           		<td>거리 두기 관련 푯말을 세워두었는가?</td>
		           		<td><input type="radio" name="radio2"></td>
		           		<td><input type="radio" name="radio2"></td>
		           		<td><input type="radio" name="radio2"></td>
		           		<td><input type="radio" name="radio2"></td>
		           		<td><input type="radio" name="radio2"></td>
		           </tr>
		           <tr>
		           		<td>3</td>
		           		<td>보건복지부에서 배포한 포스터를 매장안에 부착하였는가?</td>
		           		<td><input type="radio" name="radio3"></td>
		           		<td><input type="radio" name="radio3"></td>
		           		<td><input type="radio" name="radio3"></td>
		           		<td><input type="radio" name="radio3"></td>
		           		<td><input type="radio" name="radio3"></td>
		           </tr>
		           <tr>
		           		<td>4</td>
		           		<td>파손된 의자, 책상 등이 있는지 확인하였는가?</td>
		           		<td><input type="radio" name="radio4"></td>
		           		<td><input type="radio" name="radio4"></td>
		           		<td><input type="radio" name="radio4"></td>
		           		<td><input type="radio" name="radio4"></td>
		           		<td><input type="radio" name="radio4"></td>
		           </tr>
		           <tr>
		           		<td>5</td>
		           		<td>키오스크가 문제없이 작동 하는지 확인하였는가?</td>
		           		<td><input type="radio" name="radio5"></td>
		           		<td><input type="radio" name="radio5"></td>
		           		<td><input type="radio" name="radio5"></td>
		           		<td><input type="radio" name="radio5"></td>
		           		<td><input type="radio" name="radio5"></td>
		           </tr>
		           <tr>
		           		<td>6</td>
		           		<td>공기 청정기, 백색 소음기 등이 잘 동작하는가?</td>
		           		<td><input type="radio" name="radio6"></td>
		           		<td><input type="radio" name="radio6"></td>
		           		<td><input type="radio" name="radio6"></td>
		           		<td><input type="radio" name="radio6"></td>
		           		<td><input type="radio" name="radio6"></td>
		           </tr>
		           <tr>
		           		<td>7</td>
		           		<td>음료, 다과 등 유통기한을 잘 준수하고 있는가?</td>
		           		<td><input type="radio" name="radio7"></td>
		           		<td><input type="radio" name="radio7"></td>
		           		<td><input type="radio" name="radio7"></td>
		           		<td><input type="radio" name="radio7"></td>
		           		<td><input type="radio" name="radio7"></td>
		           </tr>
		           <tr>
		           		<td>8</td>
		           		<td>근무자, 이용자 등 마스크를 잘 착용하고 있는가?</td>
		           		<td><input type="radio" name="radio8"></td>
		           		<td><input type="radio" name="radio8"></td>
		           		<td><input type="radio" name="radio8"></td>
		           		<td><input type="radio" name="radio8"></td>
		           		<td><input type="radio" name="radio8"></td>
		           </tr>
		           </tbody>
	       		</table>
		</div>
		<div class="col-md-6 mb-30">
			<div id="calendar-area">
				<div id="calendar" class="fc fc-unthemed fc-ltr">
				</div>
			</div>
	   </div>
	</div>
   
</section>

<script type="text/javascript">
	window.onload = function(){
	// 		$("#donmList").trigger("change");
		myCalendar();
	}
		
   function myCalendar(){
	     $('#calendar').fullCalendar({
	        header: {
	            left: 'title',
	            center: '',
	            right: 'prev,next'
	        },
	        editable: true,
	        eventLimit: true, // allow "more" link when too many events
	        locale : "ko",
	        lang:"ko",
	        dayClick:function(date,jsFunction,view){
// 	        	var date1 = new Date();
// 	        	var today = Date.UTC(date1.getFullYear(), date1.getMonth(), date1.getDate());
// 				var date_reg  = 0 <= date._i - today && date._i - today < 2678400000; // 오늘 ~ 한달 까지만 선택 가능
// 				if(date_reg){
// 			    	$(".fc-active").removeClass('fc-active');
// 			    	$(this).addClass('fc-active');
// 			    	selectDate(date._i);
// 				}else{
// 					alert("선택 불가");
// 				}
	        }
	    }); 
	}
</script>