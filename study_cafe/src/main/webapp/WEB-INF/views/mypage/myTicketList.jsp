<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
/**
 * Owl Carousel v2.2.1
 * Copyright 2013-2017 David Deutsch
 * Licensed under  ()
 */

.owl-carousel,
.owl-carousel .owl-item {
  -webkit-tap-highlight-color: transparent;
  position: relative;
}

.owl-carousel {
  display: none;
  width: 100%;
  z-index: 1;
}

.owl-carousel .owl-stage {
  position: relative;
  -ms-touch-action: pan-Y;
  -moz-backface-visibility: hidden;
}

.owl-carousel .owl-stage:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}

.owl-carousel .owl-stage-outer {
  position: relative;
  overflow: hidden;
  -webkit-transform: translate3d(0,0,0);
}

.owl-carousel .owl-item,
.owl-carousel .owl-wrapper {
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  -ms-backface-visibility: hidden;
  -webkit-transform: translate3d(0,0,0);
  -moz-transform: translate3d(0,0,0);
  -ms-transform: translate3d(0,0,0);
}

.owl-carousel .owl-item {
  min-height: 1px;
  float: left;
  -webkit-backface-visibility: hidden;
  -webkit-touch-callout: none;
}

.owl-carousel .owl-item img {
  display: block;
  width: 100%;
}

.owl-carousel .owl-dots.disabled,
.owl-carousel .owl-nav.disabled {
  display: none;
}

.no-js .owl-carousel,
.owl-carousel.owl-loaded {
  display: block;
}

.owl-carousel .owl-dot,
.owl-carousel .owl-nav .owl-next,
.owl-carousel .owl-nav .owl-prev {
  cursor: pointer;
  cursor: hand;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.owl-carousel.owl-loading {
  opacity: 0;
  display: block;
}

.owl-carousel.owl-hidden {
  opacity: 0;
}

.owl-carousel.owl-refresh .owl-item {
  visibility: hidden;
}

.owl-carousel.owl-drag .owl-item {
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.owl-carousel.owl-grab {
  cursor: move;
  cursor: grab;
}

.owl-carousel.owl-rtl {
  direction: rtl;
}

.owl-carousel.owl-rtl .owl-item {
  float: right;
}

.owl-carousel .animated {
  animation-duration: 1s;
  animation-fill-mode: both;
}

.owl-carousel .owl-animated-in {
  z-index: 0;
}

.owl-carousel .owl-animated-out {
  z-index: 1;
}

.owl-carousel .fadeOut {
  animation-name: fadeOut;
}

@keyframes fadeOut {
  0% {
    opacity: 1;
  }

  100% {
    opacity: 0;
  }
}

.owl-height {
  transition: height .5s ease-in-out;
}

.owl-carousel .owl-item .owl-lazy {
  opacity: 0;
  transition: opacity .4s ease;
}

.owl-carousel .owl-item img.owl-lazy {
  transform-style: preserve-3d;
}

.owl-carousel .owl-video-wrapper {
  position: relative;
  height: 100%;
  background: #000;
}

.owl-carousel .owl-video-play-icon {
  position: absolute;
  height: 80px;
  width: 80px;
  left: 50%;
  top: 50%;
  margin-left: -40px;
  margin-top: -40px;
  background: url("../../../owl.carousel/dist/assets/owl.video.play.png") no-repeat;
  cursor: pointer;
  z-index: 1;
  -webkit-backface-visibility: hidden;
  transition: transform .1s ease;
}

.owl-carousel .owl-video-play-icon:hover {
  -ms-transform: scale(1.3,1.3);
  transform: scale(1.3,1.3);
}

.owl-carousel .owl-video-playing .owl-video-play-icon,
.owl-carousel .owl-video-playing .owl-video-tn {
  display: none;
}

.owl-carousel .owl-video-tn {
  opacity: 0;
  height: 100%;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: contain;
  transition: opacity .4s ease;
}

.owl-carousel .owl-video-frame {
  position: relative;
  z-index: 1;
  height: 100%;
  width: 100%;
}
/**
 * Owl Carousel v2.2.1
 * Copyright 2013-2017 David Deutsch
 * Licensed under  ()
 */

.owl-theme .owl-dots,
.owl-theme .owl-nav {
  text-align: center;
  -webkit-tap-highlight-color: transparent;
}

.owl-theme .owl-nav {
  margin-top: 10px;
}

.owl-theme .owl-nav [class*=owl-] {
  color: #FFF;
  font-size: 14px;
  margin: 5px;
  padding: 4px 7px;
  background: #D6D6D6;
  display: inline-block;
  cursor: pointer;
  border-radius: 3px;
}

.owl-theme .owl-nav [class*=owl-]:hover {
  background: #869791;
  color: #FFF;
  text-decoration: none;
}

.owl-theme .owl-nav .disabled {
  opacity: .5;
  cursor: default;
}

.owl-theme .owl-nav.disabled+.owl-dots {
  margin-top: 10px;
}

.owl-theme .owl-dots .owl-dot {
  display: inline-block;
  zoom: 1;
}

.owl-theme .owl-dots .owl-dot span {
  width: 10px;
  height: 10px;
  margin: 5px 7px;
  background: #D6D6D6;
  display: block;
  -webkit-backface-visibility: visible;
  transition: opacity .2s ease;
  border-radius: 30px;
}

.owl-theme .owl-dots .owl-dot.active span,
.owl-theme .owl-dots .owl-dot:hover span {
  background: #869791;
}

.attorny-card {
  border: 1px solid rgba(255, 255, 255, 0.1);
  margin-bottom: 10px; }
.attorny-card .content-box {
  padding-top: 25px; }
.attorny-card .content-box h5 {
  color: #fff;
  text-transform: uppercase;
  font-weight: 700; }
.attorny-card .content-box span {
  color: #a78859;
  font-weight: 600;
  text-transform: uppercase;
  display: block;
  margin-bottom: 15px; }
.attorny-card .content-box p {
  color: rgba(255, 255, 255, 0.7); }
.attorny-card .attorny-footer {
  text-align: center;
  margin: 0;
  padding: 0; }
.attorny-card .attorny-footer li {
  padding: 8px 0;
  color: rgba(255, 255, 255, 0.8); }
.attorny-card .attorny-footer li:last-child {
  padding-bottom: 4px; }
.attorny-card .attorny-footer span {
  display: inline-block; }
.attorny-card .attorny-footer span .social-icon {
   margin: 0px; 
   margin-right: 3px; }

.pt60 {
  padding-top: 60px !important; 
  }
.pb50 {
  padding-bottom: 50px !important; }
.mb40 {
  margin-bottom: 40px !important; }
div.container{
	padding-right: 50px !important;
}
</style>

<section id="content">
 			<div class="bg-dark pt60 pb50" style="max-width: 92%;">
                <div class="container">
                    <div class="section-title title-on-dark mb40">
                        <h3 class="text-center">
                           	나의 이용권 조회
                        </h3>
                    </div>
                    <c:if test="${empty myTicketList }">
                    	<strong>보유중인 이용권이 없습니다.</strong>
                    </c:if>
                    <div class="row">
                        <div class="col mb40">
                            <div class="col owl-carousel owl-attorney owl-theme">
	                   		 <c:forEach items="${myTicketList}" var="ticket">
                      	         <div class="item">
                                    <div class="attorny-card text-center">
                                        <img src="<%=request.getContextPath()%>/resources/images/${ticket.ticketCode}.PNG" alt="" class="img-fluid">
                                        <div class="content-box">
                                            <h5>${loginUser.memName} 님!</h5>
                                            <span>열심회원</span>
                                        </div>
                                        <ul class="attorny-footer list-unstyled">
                                            <li class="clearfix">
                                               <fmt:parseNumber var="time" value="${ticket.ticketTimeRemain/60}" integerOnly="true"/>
												남은 이용시간 : ${time} 시간
                                            </li>
                                            <li class="clearfix">
                                                ScmCafe@cafe.com
                                            </li>
                                            <li class="clearfix">
                                                <span>
                                                    <a href="#" class="social-icon si-dark si-facebook si-dark-round">
                                                        <i class="fa fa-facebook"></i>
                                                        <i class="fa fa-facebook"></i>
                                                    </a>
                                                    <a href="#" class="social-icon si-dark si-twitter si-dark-round">
                                                        <i class="fa fa-twitter"></i>
                                                        <i class="fa fa-twitter"></i>
                                                    </a>
                                                    <a href="#" class="social-icon si-dark si-g-plus si-dark-round">
                                                        <i class="fa fa-google-plus"></i>
                                                        <i class="fa fa-google-plus"></i>
                                                    </a>
                                                    <a href="#" class="social-icon si-dark si-skype si-dark-round">
                                                        <i class="fa fa-skype"></i>
                                                        <i class="fa fa-skype"></i>
                                                    </a>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div><!--item-->
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>		
</section>
<script>

</script>