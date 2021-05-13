<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<style>
	
	td.td-title{
		overflow: hidden; 
		white-space: nowrap; 
		text-overflow: ellipsis;
		max-width: 200px;
	}
	
	.badge.badge-text{
		width: 60px!important;
		color: white !important;
	}
	
	#air {
        height: 230px;
        background-image: url('<%=request.getContextPath()%>/resources/images/cafe/air5.png');
        background-size: contain;
        background-repeat : no-repeat;
        background-position: right;
      }
	
	#map {
		height: 230px;
	}
	#join {
		height: 230px;
		background-image: url('<%=request.getContextPath()%>/resources/images/cafe/book2.png');
        background-size: contain;
        background-repeat : no-repeat;
        background-position: bottom;
        
	}
	
</style>
<section>
	<div class="row p-0">
		<div class="col-12 bg-gray p-0">
			<div id="storeImg" class="mb-20">
				<div id="myCarousel" class="carousel slide" data-ride="carousel" >
				
					  <!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ul>
					
					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=request.getContextPath()%>/resources/images/cafe/comcom.jpg" width="100%" height="350">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/resources/images/cafe/people.jpg"  width="100%" height="350">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/resources/images/cafe/people2.jpg"  width="100%" height="350">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/resources/images/cafe/meeting.jpg"  width="100%" height="350">
						</div>
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#myCarousel" data-slide="next">
						<span class="carousel-control-next-icon"></span>
					</a>
				</div>		
			</div>

		</div>
	</div>
	<div class="row" >
			<div id="storeReivew col-4" style="padding: 0px 15px;">
				<h4>이용후기</h4>
				<table class="table mt-20">
					<colgroup>
						<col width="30%">
						<col width="*">
						<col width="16%">
					</colgroup>
					
					<tbody>
						<c:forEach items="${reviewList}" var="review">
							<tr align="center">
								<td align="left" class="td-title" >${review.reviewContent}</td>
								<td>
									<input type="number" class="rating" value="${review.grade}" data-size="xs" data-readonly="true" readonly="readonly">
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
								
			</div>
		
			<div class="col-4 b-r b-l"  >
				<h4>공지사항</h4>
				<table class="table table-hover mt-20">
					<colgroup>
						<col width="*">
						<col width="18%">
					</colgroup>
					
					<tbody>
						<c:forEach items="${noticeList}" var="notice" varStatus="stat">
							<tr onclick="location_go('/notice/detail?noticeVO.noticeNo=${notice.noticeNo}');" style="cursor: pointer; height: 56px;" align="center">
								<td style="text-align: left;" class="td-title" >[공지] ${notice.noticeTitle}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
				
			<div class="col-4">
				<h4>소모임게시판</h4>
				<table class="table table-hover mt-20">
					<colgroup>
						<col width="8%">
						<col width="*">
						<col width="18%">
					</colgroup>
							
					<tbody>
						<c:forEach items="${studygroupList}" var="sgl">
							<tr onclick="location_go('/stb/detail?studygroupVO.studygroupNo=${sgl.studygroupNo}')" style="cursor: pointer; height: 56px;" align="center">
								<c:if test="${sgl.recruitStatus eq 'N'}">
									<td>
										<span class="badge text-danger-light badge-danger ml-1 badge-text"><c:out value="모집마감" /></span>
									</td>
								</c:if>
								<c:if test="${sgl.recruitStatus eq 'Y'}">
									<td >
										<span class="badge text-danger-light badge-success ml-1 badge-text "><c:out value="모집중" /></span>
									</td>
								</c:if>
		
								<td align="left" class="td-title">${sgl.studygroupTitle}
									<c:if test="${sgl.replyCnt != 0 }">
										<span class="badge badge-warning">${sgl.replyCnt}</span>
									</c:if>
								</td>
								<td>
									~<fmt:formatDate value="${sgl.studygroupEnd}" pattern="MM/dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>			
			</div>			
			
		</div>
		<div class=" b-t">
			<div class="row mt-15">
					<div class="col-lg-6">
						<div class="border1 bg-white p-3 mb-30 rounded" id="air" >
							<div class="row">
	                            <h4 class="font500 fs18 p-3 pt-0 col-10">창업문의</h4>
	                            <a href="<%=request.getContextPath()%>/contract/regist">가맹가입 <i class="icon-telegram-plane"></i></a>
                            </div>                
                            <div class="row pb-2mb-15 ml-2">
                            	<span>
                            		성공적인 스터디카페 운영,<br>
									<strong>스프링 스터디카페</strong>에서 시작해보세요!<br>
                            		<br>
                            		<strong>스프링스터디카페</strong>는 <br>
                            		가맹점주님들과 상생할 수 있는 같은 길을 걸어가겠습니다.
                            	</span>
                            </div>
                        </div>
					</div>
				
					<div class="col-lg-3">
						<div class="border1 bg-white p-3 mb-30 rounded" id="join">
							<div class="row">
	                            <h4 class="font500 fs18 p-3 pt-0 col-10">회원가입</h4>
	                            <a href="<%=request.getContextPath()%>/user/joinForm" class="mr-2"><i class="icon-user-plus"></i></a>
                            </div>                
                            <div class="row pb-2mb-15 ml-2 mt-2">
                            	<span>
                            		아직 회원이 아니신가요 ?<br>
									<strong>스프링 스터디카페</strong>는<br>
									여러분을 기다립니다.
                            	</span>
                            </div>
                        </div>
					</div>
					<div class="col-lg-3">
						<div class="border1 bg-white p-3 mb-30 rounded" id="map" >
							<div class="row">
	                            <h4 class="font500 fs18 p-3 pt-0 col-10">지점찾기 </h4>
	                            <img alt="" src="<%=request.getContextPath()%>/resources/images/cafe/map.png" style="height: 30px; width: 40px;">
                            </div>                
                            <div class="row pb-2mb-15 ml-2 mr-2 pb-50" style="">
                            	<span>
                            		고객님과 가까운<br> 
                            		<strong>스프링 스터디카페</strong>를 찾아보세요 ! 
                            	</span>
                            </div>
				               <a href="<%=request.getContextPath() %>/store/list" class="btn btn-rounded btn-teal mr-1mb-2 float-right">매장검색 <i class="icon-search3"></i></a>
                        </div>
					</div>
			</div>
		
		</div>



</section>


