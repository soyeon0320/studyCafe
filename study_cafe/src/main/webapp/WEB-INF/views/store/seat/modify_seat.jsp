<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
	td{
		padding: 0px;
		width: 50px; 
		height: 50px;
	}
	
	td.seatE, td.seatN, td.seatW, td.seatS{
		background-size: 50px;
		background-repeat: no-repeat;
		width: 50px;
		height: 50px;
		text-align: center;
		background-position: center;
	}
	
	td.seatE{ background-image: url('<c:url value="/resources/images/seat/seatE.png" />'); }
	td.seatN{ background-image: url('<c:url value="/resources/images/seat/seatN.png" />'); }
	td.seatW{ background-image: url('<c:url value="/resources/images/seat/seatW.png" />'); }
	td.seatS{ background-image: url('<c:url value="/resources/images/seat/seatS.png" />'); }
	
/* 	img{
		display: block;
		width: 100%;
	} */
	#seatMap, #unLocatedSeat{
	    display: table;
	    border-collapse: separate;
	    box-sizing: border-box;
	    text-indent: initial;
	    border-spacing: 0px;
	    -webkit-border-horizontal-spacing: 0px;
	    -webkit-border-vertical-spacing: 0px;
	    border-color: grey;
	}
	.tone-down{
		background-color: #fa625e;
	}

</style>


<section>
	<div style="padding: 10px;">
		<fmt:parseNumber var="x" type="number" value="${store.STORE_WIDTH }"/>
		<fmt:parseNumber var="y" type="number" value="${store.STORE_HEIGHT }"/>
	
		<div class="row mt-30">
			<div class="col-6">
				<div class="portlet-box portlet-shadow" style="text-align: -webkit-center;">
					<h3 class="pt-20" >좌석 배치</h3>
					<button style="margin: 20px;font-weight:bolder; position: relative;left: 310px; bottom: 67px;" class="btn btn-info" onclick="modifySeatMap();">수정</button>
					<div class="portlet-body" style="clear: both;position: relative;bottom: 60px;">
						<form action="modify_seat" style="clear: both;clear: both;" id="locatedSeat" >
							<table class="table table-bordered"  id="seatMap" style="display: contents;">
								<c:set var="location" value="1"/>
								<c:set var="listCnt" value="0" />
								<c:set var="seat" value="${locatedList[listCnt] }" />
									
								<c:forEach begin="0" end="${y-1 }" varStatus="col">
									<tr>
										<c:forEach begin="${(col.count-1)*x }" end="${(col.count*x -1) }" varStatus="row" >
											<c:if test="${seatMap[location-1] == '0' }">
												<td ondrop="dropSeat(event)" ondragover="allowDrop(event);">
													<input type="hidden" name="seatLocation" value="${location }">
												</td>						
											</c:if>
										
											<c:if test="${seatMap[location-1] != '0' }">
												<c:if test="${seat.seatUseable eq 'N'}">
													<c:set var="unuseableStyle" value="tone-down" />
												</c:if>
												<td id="seat${seat.seatNo }" onclick="goModal(this);"  class="seat${seat.seatDirection } ${unuseableStyle}" ondrop="dropToExchange(event);" ondragover="allowDrop(event);" ondragstart="drag(event);" draggable="true">
													<input type="hidden" name="seatLocation" value="${location }">
													<input type="hidden" name="seatNo" value="${seat.seatNo }">
													<input type="hidden" name="seatUseable" value="${seat.seatUseable }">
													<input type="hidden" name="seatInfo" value="${seat.seatInfo }">
													<input type="hidden" name="isModified" value="">
													<input type="hidden" name="seatDirection" value="${seat.seatDirection }">
													<strong>${seat.seatNo }</strong>
													<c:set var="listCnt" value="${listCnt + 1 }"  /> 
													<c:set var="seat" value="${locatedList[listCnt] }"  />
												</td>
												<c:set var="unuseableStyle" value="" />
											</c:if>
												<c:set var="location" value="${location + 1 }"  />
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="col-6" >
				<div class="portlet-box portlet-shadow" style="text-align: -webkit-center;">
					<h3 class="pt-20">미배치 좌석</h3>
					<div class="portlet-body">
						<form action="modify_seat" style="margin: 10px;">
							<table class="table table-bordered" style="clear: both;display: contents;" id="unLocatedSeat">
								<c:forEach begin="0" end="${y-1 }" varStatus="status">
									<tr>
										<c:forEach items="${unLocatedList }" begin="${(status.count-1)*x }" end="${(status.count*x -1) }" var="seat">
											<c:if test="${seat.seatUseable eq 'N'}">
												<c:set var="unuseableStyle" value="tone-down" />
											</c:if>
											<td  class="seat${seat.seatDirection } ${unuseableStyle}" id="seat${seat.seatNo }" onclick="goModal(this);" ondragstart="drag(event);" draggable="true" ondrop="dropToExchange(event)" ondragover="allowDrop(event);">
												<input type="hidden" name="seatNo" value="${seat.seatNo }">
												<input type="hidden" name="seatUseable" value="${seat.seatUseable }">
												<input type="hidden" name="seatInfo" value="${seat.seatInfo }">
												<input type="hidden" name="seatLocation" value="${seat.seatLocation }">
												<input type="hidden" name="seatDirection" value="${seat.seatDirection }">
												<input type="hidden" name="isModified" value="">
												<strong>${seat.seatNo }</strong>
											</td>
											<c:set var="unuseableStyle" value="" />
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="modal fade" id="seatModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header bg-info-light">
				<h5 class="modal-title" id="exampleModalLabel">좌석 상태 변경</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="" id="modifySeatForm">
					<input type="hidden" name="seatNo" value="" readonly="readonly">
					<h5 style="display: inline;"><span id="seat_no"></span> 번 좌석</h5>
					<span style="display: inline;float: right;" onclick="removeSeat(this);"  class="btn btn-rounded btn-danger">미배치</span>
					<div class="row" style="clear: both;">
						<h5 class="col-5">좌석 사용가능 여부 : </h5>
						<div class="col-7 customUi-switchToggle switchToggle-lg switchToggle-primary" style="display: inline;">
							<input type="hidden" name="seatUseable" value="">
							<input type="checkbox" id="useSwitch" name="group26">
							<label for="useSwitch" style="widows: 20px;">
									<span class="label-switchToggle"></span>
							</label>
						</div>
					</div>

					
					<div>
						<h5 style="display: block;">좌석 방향 : &nbsp; </h5>
						<c:forEach items="E,W,S,N"  var="direction" >
							<div class="customUi-radio radioUi-dark mr-2">
	                            <input id="seatDirection${direction }" type="radio" name="seatDirection" value="${direction }">
	                            <label for="seatDirection${direction } ">
	                                <span class="label-radio"></span>
	                                <span class="label-helper">
	                                	<img onclick="javascript:$('#seatDirection${direction }').click();" alt="" src="<c:url value='/resources/images/seat/seat${direction }.png'/>" width="70px;" height="70px;" >
	                                </span>
	                            </label>
	                        </div>
						</c:forEach>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="modifySeat();">수정</button>
			</div>
		</div>
	</div>
</div>

<script>
	// drag&drop
 	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev) {
		if($(ev.target).prop('tagName') != "TD"){
		}
		ev.dataTransfer.setData('text',$(ev.target).attr("id"));
	}

	function dropSeat(ev) {
		
		ev.preventDefault();
		var data = '#'+ev.dataTransfer.getData('text');
		var data_id = $(data).attr("id");
		
		var beforeLocation = $(data).children("input[name=seatLocation]").clone();
		var afterLocation = $(ev.target).children("input[name=seatLocation]").clone();
		
		$(data).children("input[name=seatLocation]").remove();
		$(ev.target).children("input[name=seatLocation]").remove();
		
		$(data).append($(ev.target).children());
		$(ev.target).html($(data).html()); // 복사
		
		if($(data).closest("table").attr("id") == "unLocatedSeat") {
			$(data).remove(); // 삭제
		}else{
			$(data).children().remove(); // 삭제
			$(data).append(beforeLocation);
			$(data).attr("ondrop","dropSeat(event);")
			$(data).removeAttr("id")
				   .removeAttr("ondragstart")
				   .removeAttr("draggable")
				   .removeAttr("onclick")
				   .removeAttr("class");
		}
		
		
		// 후처리
		$(ev.target).children("input[name=isModified]").val("true");
		$(ev.target).addClass("seat"+$(ev.target).children("input[name=seatDirection]").val());
		$(ev.target).append(afterLocation);
		$(ev.target).attr("id",data_id)
					.attr("onclick","goModal(this);")
					.attr("ondrop","dropToExchange(event);")
					.attr("ondragstart","drag(event);")
					.attr("draggable",true);
		
	}

	function dropToExchange(ev){
		// 임시방편으로 버블링 막기 ㅠ
		//console.log($(ev.target));
		
		if($(ev.target).prop('tagName') != "TD"){
			//ev.target = $(ev.target).closest("td");
			return;
		}
		
		ev.preventDefault();
		
		var dragItem = ev.dataTransfer.getData('text');
		var positionedItem = $(ev.target).attr("id");
		
		var beforeLocation = $("#"+dragItem).children("input[name=seatLocation]").clone();
		var afterLocation = $(ev.target).children("input[name=seatLocation]").clone();
		var direction = $("#"+dragItem).children("input[name=seatDirection]").val();
		
		
		var temp = $("#"+dragItem).children().clone();
		
		$(ev.target).children("input[name=seatLocation]").val(beforeLocation.val());
		$(ev.target).children("input[name=isModified]").val("true");
		$("#"+dragItem).attr("id",positionedItem)
					   .attr("class","seat"+$("#"+positionedItem).children("input[name=seatDirection]").val())
					   .html($(ev.target).children());
		
				
		$(ev.target).attr("id",dragItem)
					.attr("class","seat"+direction)
					.html(temp);
		$(ev.target).children("input[name=seatLocation]").val(afterLocation.val());
		$(ev.target).children("input[name=isModified]").val("true");
	}
	
	
	
	function getStr(){
		var strList = $("input[name=seat]");
		var myStr="";
		for (var i = 0; i < strList.length; i++) {
			var seat = $(strList[i]);
			myStr += seat.val()+",";
		}
		myStr = myStr.substring(0,myStr.length-1);		
		
		return myStr;
	}
	
	function goPost(){
		$("#seats").val(getStr());
		$("#myForm").trigger("click");
	}
	
	
	
	
	function modifySeatMap(){
		var locatedSeatList = new Array();
		var modifiedSeatList = new Array();
		
		var locatedList = $("#locatedSeat strong").parent("td");
		var modifiedList =$("input[name=isModified][value=true]").parent("td");
		
 		var seatList = {
				locatedSeatList :setDataList(locatedList,locatedSeatList),
				modifiedSeatList : setDataList(modifiedList,modifiedSeatList)
		};
		
 		
   		$.ajax({
			url:"seat",
	        method : "post",
	    	dataType : 'json',
	    	data : JSON.stringify(seatList),
	    	processData : true,
	    	contentType : "application/json; charset=UTF-8",
	    	success : function(data) {
	    		swal({
                    title: '수정 완료',
                    text: '좌석 배치가 수정되었습니다.',
                    type: 'success',
                    confirmButtonClass: 'btn btn-confirm mt-2'
                  }).then(function () {
                        	  location.reload();
                          	}
                  		  )
	    	},
	    	error : function(xhr) {
	    	    alert("error");
	    	}
		});
	}
	
	function setDataList(tagList,setList){
		for (var i = 0; i < tagList.length; i++) {
			var item = tagList.eq(i);
			var seat = {
					seatNo : item.children("input[name=seatNo]").val(),
					storeCode : "${sessionScope.loginOwner.storeCode}",
					seatLocation : item.children("input[name=seatLocation]").val(),
					seatUseable : item.children("input[name=seatUseable]").val(),
					seatInfo : item.children("input[name=seatInfo]").val(),
					isModified: item.children("input[name=isModified]").val(),
					seatDirection: item.children("input[name=seatDirection]").val()
			}
			
			setList.push(seat);
		}
		return setList;
	}
	
	function goModal(obj){
		var seatNo = $(obj).children("input[name=seatNo]").val();
		$("#seat_no").text(seatNo);
		$("#modifySeatForm input[name=seatNo]").val(seatNo);
		$("#modifySeatForm input[name=seatUseable]").val($(obj).children("input[name=seatUseable]").val());
		
		if($(obj).children("input[name=seatUseable]").val() == "Y"){
			$("#useSwitch").prop("checked",true);
		}else{
			$("#useSwitch").prop("checked",false);
		}
		
		$("#modifySeatForm input[name=seatDirection][value="+$(obj).children("input[name=seatDirection]").val()+"]").prop("checked",true);
		$("#seatModal").modal();
	}
	
	function modifySeat(){
		var seatNo = $("#modifySeatForm input[name=seatNo]").val();
		$("#modifySeatForm input[name=seatNo]").val("");
		
		var seatUseable = $("#modifySeatForm input[name=seatUseable]:checked").val();
		var seatDirection = $("#modifySeatForm input[name=seatDirection]:checked").val();
		
		
		var modifyItem = $("input[name=seatNo][value="+seatNo+"]").parent("td");
		
		if($("#useSwitch").prop("checked")){
			modifyItem.children("input[name=seatUseable]").val("Y");
			modifyItem.attr("class","seat"+seatDirection);
		}else{
			modifyItem.children("input[name=seatUseable]").val("N");
			modifyItem.attr("class","seat"+seatDirection);
			modifyItem.addClass("tone-down");
		}
		
		modifyItem.children("input[name=seatDirection]").val(seatDirection);
		modifyItem.children("input[name=isModified]").val("true");
		
		$("#seatModal").modal("hide")
	}
	
	function removeSeat(obj){
		var minusItem = $("#modifySeatForm").find("input[name=seatNo]").val();
		if($("#unLocatedSeat").find("input[name=seatNo][value="+minusItem+"]").length != 0){
			
			alert("이미 미배치된 좌석입니다.");
			
			return;
		}
		var originItem = $("#locatedSeat").find("input[name=seatNo][value="+minusItem+"]").closest("td");
		var copyItem = originItem.clone();
		originItem.html("").append(copyItem.children("input[name=seatLocation]"));
		originItem.removeAttr("id")
				  .removeAttr("ondragstart")
				  .removeAttr("draggable")
				  .removeAttr("onclick")
				  .removeAttr("class")
				  .attr("ondrop","dropSeat(event);");
		
		
		copyItem.children("input[name=isModified]").val("true");
		copyItem.children("input[name=seatLocation]").val(0);
		
		
		
		$("#unLocatedSeat").append(copyItem);

		$("#seatModal").modal("hide");
	}
	
	function noti_success(message){
        $.notify({
            message: '<strong>'+message+'</strong>'
        }, {
            type: 'success',
            showProgressbar: false,
            newest_on_top: true,
            placement: {
                from: "top",
                align: "center"
            },
            offset: {
                x: 0,
                y: 50
            }
        });
	}
	
</script>

<c:if test="${myMessage != null }">
<script>
window.addEventListener("load",function(){
	Swal({
		  title: "${myMessage}",
		  animation: true,
		  customClass: '확인'
		})
});
</script>
<c:set var="myMessage" value="" />
</c:if>
