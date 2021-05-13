<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.star-input>.input,
/* .star-input>.input>label:hover, */
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('<%=request.getContextPath()%>/resources/images/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
/* .star-input>.input>label:hover, */
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
/* .star-input>.input>label:hover~label{background-image: none;} */
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<script>
function myReview(tab){
		var data = {
				tab:tab
		}
		console.log(data);
		$.ajax({
			url : '<%=request.getContextPath()%>/myPage/reviewList',
			type : 'post',
			data : data
		}).done(function(result){
			var html = jQuery('<tr>').html(result);
			var contents = html.find("tbody#indexListAjax").html();
			if (tab == "#myStudyRoomReview"){
				$("#myStudyRoomReview").html(contents);
				$("#myStudyRoomReview").show();
				$("#studyRoom").attr('class', 'button button-border button-border-thin button-rounded button-fill fill-from-right button-red');
				$("#seat").attr('class', 'button button-border button-border-thin button-rounded button-fill fill-from-right button-blue');
				$("#mySeatReview").hide();
			}else if(tab == "#mySeatReview"){
				$("#mySeatReview").html(contents);
				$("#mySeatReview").show();
				$("#studyRoom").attr('class', 'button button-border button-border-thin button-rounded button-fill fill-from-right button-blue');
				$("#seat").attr('class', 'button button-border button-border-thin button-rounded button-fill fill-from-right button-red');
				$("#myStudyRoomReview").hide();
			}
		}).fail(function (jqXHR, textStatus, errorThrown){
			console.log("에러");
			console.log(jqXHR);
			console.log(textStatus);
			console.log(errorThrown);
		});
	}
	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.heigth - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth 
				+ ",height=" + WinHeight + ", top=" + wintop + ", left=" + winleft +
				+ ", resizable=yes, status=yes"
				);
		win.focus();
	}
</script>

<section>
	<button id="studyRoom" class="button button-border button-border-thin button-rounded button-fill fill-from-right button-blue" type="button" onclick="myReview('#myStudyRoomReview')"><span>스터디룸</span></button>
	<button id="seat" class="button button-border button-border-thin button-rounded button-fill fill-from-right button-blue" type="button" onclick="myReview('#mySeatReview')"><span>좌석</span></button>

	<table class="table table-hover mt-20">
		<thead>
			<tr>
			  <th>No</th>
			  <th>이용가맹점</th>
			  <th>별점</th>
			  <th>내용</th>
			  <th>작성일</th>
			</tr>
		</thead>
		<tbody id="myStudyRoomReview" style="display: none">
			<c:if test="${empty myStudyRoomReview}">
				<tr>
					<td colspan="5">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
		</tbody>
		<tbody id="mySeatReview" style="display: none">
			<c:if test="${empty mySeatReview }">
				<tr>
					<td colspan="5">
						<strong>해당 내용이 없습니다.</strong>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>	
</section>