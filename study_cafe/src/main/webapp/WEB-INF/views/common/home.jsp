<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i,700|Poppins:300,400,500,600,700|PT+Serif:400,400i&display=swap" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/style.css" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/dark.css" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.css" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/custom.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<!-- Document Title
	============================================= -->
	<title>Home - Portfolio Layout 3 | Canvas</title>

</head>
<body class="stretched device-xl has-plugin-easing has-plugin-bootstrap has-plugin-lightbox has-plugin-hoveranimation has-plugin-tabs has-plugin-counter has-plugin-form has-plugin-subscribeform has-plugin-flexslider">

	<!-- Document Wrapper
	============================================= -->
	<div id="wrapper" class="clearfix">

		<!-- Header
		============================================= -->
		<header id="header" class="">
			<div id="header-wrap" class="">
				<div class="container">
					<div class="header-row top-search-parent">

						<!-- Logo
						============================================= -->
						<div id="logo">로고
							<!-- <a href="index.html" class="standard-logo" data-dark-logo="images/logo-dark.png"><img src="images/logo.png" alt="Canvas Logo" style="height: 100px;"></a>
							<a href="index.html" class="retina-logo" data-dark-logo="images/logo-dark@2x.png"><img src="images/logo@2x.png" alt="Canvas Logo" style="height: 100px;"></a> -->
						</div><!-- #logo end -->

						<div class="header-misc">

							<!-- Top Search
							============================================= -->
							<div id="top-search" class="header-misc-icon">
								<a href="#" id="top-search-trigger"><i class="icon-line-search"></i><i class="icon-line-cross"></i></a>
							</div><!-- #top-search end -->

							<!-- Top Cart
							============================================= -->
							<div id="top-cart" class="header-misc-icon d-none d-sm-block">
								<a href="#" id="top-cart-trigger"><i class="icon-line-bag"></i><span class="top-cart-number">5</span></a>
								<div class="top-cart-content">
									<div class="top-cart-title">
										<h4>Shopping Cart</h4>
									</div>
									<div class="top-cart-items">
										<div class="top-cart-item">
											<div class="top-cart-item-image">
												<a href="#"><img src="images/shop/small/1.jpg" alt="Blue Round-Neck Tshirt"></a>
											</div>
											<div class="top-cart-item-desc">
												<div class="top-cart-item-desc-title">
													<a href="#">Blue Round-Neck Tshirt with a Button</a>
													<span class="top-cart-item-price d-block">$19.99</span>
												</div>
												<div class="top-cart-item-quantity">x 2</div>
											</div>
										</div>
										<div class="top-cart-item">
											<div class="top-cart-item-image">
												<a href="#"><img src="images/shop/small/6.jpg" alt="Light Blue Denim Dress"></a>
											</div>
											<div class="top-cart-item-desc">
												<div class="top-cart-item-desc-title">
													<a href="#">Light Blue Denim Dress</a>
													<span class="top-cart-item-price d-block">$24.99</span>
												</div>
												<div class="top-cart-item-quantity">x 3</div>
											</div>
										</div>
									</div>
									<div class="top-cart-action">
										<span class="top-checkout-price">$114.95</span>
										<a href="#" class="button button-3d button-small m-0">View Cart</a>
									</div>
								</div>
							</div><!-- #top-cart end -->

						</div>

						<div id="primary-menu-trigger">
							<svg class="svg-trigger" viewBox="0 0 100 100"><path d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20"></path><path d="m 30,50 h 40"></path><path d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20"></path></svg>
						</div>

						<!-- Primary Navigation
						============================================= -->
						<nav class="primary-menu">

							<ul class="menu-container">
								<li class="menu-item current sub-menu"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Home<i class="icon-angle-down"></i></div></a>
									<ul class="sub-menu-container" style="">
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-corporate.html"><div>Home - Corporate<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-corporate.html"><div>Corporate - Layout 1</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-corporate-2.html"><div>Corporate - Layout 2</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-corporate-3.html"><div>Corporate - Layout 3</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-corporate-4.html"><div>Corporate - Layout 4</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-portfolio.html"><div>Home - Portfolio<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-portfolio.html"><div>Portfolio - Layout 1</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-portfolio-2.html"><div>Portfolio - Layout 2</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-portfolio-3.html"><div>Portfolio - Masonry</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-portfolio-4.html"><div>Portfolio - AJAX</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-blog.html"><div>Home - Blog<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-blog.html"><div>Blog - Layout 1</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-blog-2.html"><div>Blog - Layout 2</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-blog-3.html"><div>Blog - Layout 3</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-shop.html"><div>Home - Shop<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-shop.html"><div>Shop - Layout 1</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-shop-2.html"><div>Shop - Layout 2</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-magazine.html"><div>Home - Magazine<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-magazine.html"><div>Magazine - Layout 1</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-magazine-2.html"><div>Magazine - Layout 2</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-magazine-3.html"><div>Magazine - Layout 3</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="landing.html"><div>Home - Landing Page<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="landing.html"><div>Landing Page - Layout 1</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="landing-2.html"><div>Landing Page - Layout 2</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="landing-3.html"><div>Landing Page - Layout 3</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="landing-4.html"><div>Landing Page - Layout 4</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="landing-5.html"><div>Landing Page - Layout 5</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-fullscreen-image.html"><div>Home - Full Screen<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-fullscreen-image.html"><div>Full Screen - Image</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-fullscreen-slider.html"><div>Full Screen - Slider</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-fullscreen-video.html"><div>Full Screen - Video</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item sub-menu" style=""><a class="menu-link" href="index-onepage.html"><div>Home - One Page<i class="icon-angle-down"></i></div></a>
											<ul class="sub-menu-container" style="">
												<li class="menu-item" style=""><a class="menu-link" href="index-onepage.html"><div>One Page - Default</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-onepage-2.html"><div>One Page - Submenu</div></a></li>
												<li class="menu-item" style=""><a class="menu-link" href="index-onepage-3.html"><div>One Page - Dots Style</div></a></li>
											</ul>
										<button class="sub-menu-trigger icon-chevron-right"></button></li>
										<li class="menu-item" style=""><a class="menu-link" href="index-wedding.html"><div>Home - Wedding</div></a></li>
										<li class="menu-item" style=""><a class="menu-link" href="index-restaurant.html"><div>Home - Restaurant</div></a></li>
										<li class="menu-item" style=""><a class="menu-link" href="index-events.html"><div>Home - Events</div></a></li>
										<li class="menu-item" style=""><a class="menu-link" href="index-parallax.html"><div>Home - Parallax</div></a></li>
										<li class="menu-item" style=""><a class="menu-link" href="index-app-showcase.html"><div>Home - App Showcase</div></a></li>
									</ul>
								<button class="sub-menu-trigger icon-chevron-right"></button></li>
								<!-- Mega Menu
								============================================= -->
								<li class="menu-item mega-menu sub-menu"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Men<i class="icon-angle-down"></i></div></a>
									<div class="mega-menu-content mega-menu-style-2" style="width: 1290px;">
										<div class="container" style="">
											<div class="row">
												<ul class="sub-menu-container mega-menu-column col-lg-3" style="">
													<li class="menu-item mega-menu-title sub-menu" style=""><a class="menu-link" href="#"><div>Footwear</div></a>
														<ul class="sub-menu-container" style="">
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Casual Shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Formal Shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sports shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Flip Flops</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Slippers</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sports Sandals</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Party Shoes</div></a></li>
														</ul>
													</li>
												</ul>
												<ul class="sub-menu-container mega-menu-column col-lg-3" style="">
													<li class="menu-item mega-menu-title sub-menu" style=""><a class="menu-link" href="#"><div>Clothing</div></a>
														<ul class="sub-menu-container" style="">
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Casual Shirts</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>T-Shirts</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Collared Tees</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Pants / Trousers</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Ethnic Wear</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Jeans</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sweamwear</div></a></li>
														</ul>
													</li>
												</ul>
												<ul class="sub-menu-container mega-menu-column col-lg-3" style="">
													<li class="menu-item mega-menu-title sub-menu" style=""><a class="menu-link" href="#"><div>Accessories</div></a>
														<ul class="sub-menu-container" style="">
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Bags &amp; Backpacks</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Watches</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sunglasses</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Wallets</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Caps &amp; Hats</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Jewellery</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Belts, Ties</div></a></li>
														</ul>
													</li>
												</ul>
												<ul class="sub-menu-container mega-menu-column col-lg-3" style="">
													<li class="menu-item mega-menu-title sub-menu" style=""><a class="menu-link" href="#"><div>New Arrivals</div></a>
														<ul class="sub-menu-container" style="">
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>T-Shirts</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Formal Shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Accessories</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Watches</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Perfumes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Belts, Ties</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Formal Shirts</div></a></li>
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</div>
								<button class="sub-menu-trigger icon-chevron-right"></button></li><!-- .mega-menu end -->
								<li class="menu-item mega-menu mega-menu-small sub-menu"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Women<i class="icon-angle-down"></i></div></a>
									<div class="mega-menu-content mega-menu-style-2" style="">
										<div class="container" style="">
											<div class="row">
												<ul class="sub-menu-container mega-menu-column col-lg-6" style="">
													<li class="menu-item mega-menu-title sub-menu" style=""><a class="menu-link" href="#"><div>Footwear</div></a>
														<ul class="sub-menu-container" style="">
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Casual Shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Formal Shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sports shoes</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Flip Flops</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Slippers</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sports Sandals</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Party Shoes</div></a></li>
														</ul>
													</li>
												</ul>
												<ul class="sub-menu-container mega-menu-column col-lg-6" style="">
													<li class="menu-item mega-menu-title sub-menu" style=""><a class="menu-link" href="#"><div>Clothing</div></a>
														<ul class="sub-menu-container" style="">
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Casual Shirts</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>T-Shirts</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Collared Tees</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Pants / Trousers</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Ethnic Wear</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Jeans</div></a></li>
															<li class="menu-item" style=""><a class="menu-link" href="#"><div>Sweamwear</div></a></li>
														</ul>
													</li>
												</ul>
											</div>
										</div>
									</div>
								<button class="sub-menu-trigger icon-chevron-right"></button></li><!-- .mega-menu end -->
								<li class="menu-item"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Accessories</div><span>Awesome Works</span></a></li>
								<li class="menu-item"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Sale</div><span>Awesome Works</span></a></li>
								<li class="menu-item"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Blog</div><span>Latest News</span></a></li>
								<li class="menu-item"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Videos</div><span>Latest News</span></a></li>
								<li class="menu-item"><a class="menu-link" href="#" style="padding-top: 39px; padding-bottom: 39px;"><div>Contact</div><span>Get In Touch</span></a></li>
							</ul>

						</nav><!-- #primary-menu end -->

						<form class="top-search-form" action="search.html" method="get" style="width: 1290px;">
							<input type="text" name="q" class="form-control" value="" placeholder="Type &amp; Hit Enter.." autocomplete="off">
						</form>

					</div>
				</div>
			</div>
			<div class="header-wrap-clone" style="height: 100px;"></div>
		</header><!-- #header end -->

		<section id="slider" class="slider-element slider-parallax revslider-wrap overflow-hidden clearfix slider-parallax-visible" style="transform: translate3d(0px, 0px, 0px);">
		<tiles:insertAttribute name="body"/>
		
		</section><!-- #content end -->

		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">
			

			<!-- Copyrights
			============================================= -->
			<div id="copyrights">
				<div class="container">

					<div class="row col-mb-30">

						<div class="col-md-6 text-center text-md-left">
							Copyrights © 2020 All Rights Reserved by Canvas Inc.<br>
							<div class="copyright-links"><a href="#">Terms of Use</a> / <a href="#">Privacy Policy</a></div>
						</div>

						<div class="col-md-6 text-center text-md-right">
							<div class="d-flex justify-content-center justify-content-md-end">
								<a href="#" class="social-icon si-small si-borderless si-facebook">
									<i class="icon-facebook"></i>
									<i class="icon-facebook"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-twitter">
									<i class="icon-twitter"></i>
									<i class="icon-twitter"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-gplus">
									<i class="icon-gplus"></i>
									<i class="icon-gplus"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-pinterest">
									<i class="icon-pinterest"></i>
									<i class="icon-pinterest"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-vimeo">
									<i class="icon-vimeo"></i>
									<i class="icon-vimeo"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-github">
									<i class="icon-github"></i>
									<i class="icon-github"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-yahoo">
									<i class="icon-yahoo"></i>
									<i class="icon-yahoo"></i>
								</a>

								<a href="#" class="social-icon si-small si-borderless si-linkedin">
									<i class="icon-linkedin"></i>
									<i class="icon-linkedin"></i>
								</a>
							</div>

							<div class="clear"></div>

							<i class="icon-envelope2"></i> info@canvas.com <span class="middot">·</span> <i class="icon-headphones"></i> +1-11-6541-6369 <span class="middot">·</span> <i class="icon-skype2"></i> CanvasOnSkype
						</div>

					</div>

				</div>
			</div><!-- #copyrights end -->
		</footer><!-- #footer end -->

	</div><!-- #wrapper end -->
	 <%@ include file="/WEB-INF/include/message.jsp" %>
	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up" style="display: none;"></div>

	<!-- JavaScripts
	============================================= -->
	<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/plugins.min.js"></script>

	<!-- Footer Scripts
	============================================= -->
	<script src="<%=request.getContextPath() %>/resources/js/functions.js"></script>

</body>


</html>