<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>SampleShop for Learning Coding</title> 
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" /> 
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
		<body class="homepage">
        <form id="form1" runat="server">
   		<div id="page-wrapper">
			<!-- Header -->
			<div id="header-wrapper">
				<div id="header" class="container">
					<!-- Logo -->
					<h1 id="logo"><a href="index.aspx">SAMPLE SHOP</a></h1>
					<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#">新品上市</a>
								<ul>
									<li><a href="PDlist.aspx">每周新品</a></li>
									<li><a href="PDlist.aspx">夏季新品</a></li>
								</ul>
							</li>
							<li><a href="PDlist.aspx">暢銷排行</a></li>
							<li><a href="PDlist.aspx">全館商品</a></li>
							<li><a href="PDlist.aspx">精選活動</a></li>
						</ul>
					</nav>
				</div>
				<!-- Hero -->
				<section id="hero" class="container">
					<header>
						<h2>範例購物平台</h2>
					</header>
						<p>僅供教學使用</p>
						<ul class="actions">
							<li><a href="PDlist.aspx" class="button">See More</a></li>
						</ul>
				</section>
			</div>


			<!-- Features 1 -->
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<section class="12u 12u(narrower) feature">
							<div class="image-wrapper first">
								<a href="#" class="image featured first"><img src="images/caroupic01.jpg" alt="" /></a>
							</div>
							<div class="image-wrapper first">
								<a href="#" class="image featured first"><img src="images/caroupic02.jpg" alt="" /></a>
							</div>
                            <div class="image-wrapper first">
								<a href="#" class="image featured first"><img src="images/caroupic03.jpg" alt="" /></a>
							</div>
						</section>
					</div>
				</div>
			</div>
            
			<!-- Promo -->
				<div id="promo-wrapper">
					<section id="promo">
						<h2>現在即可加入會員，享有會員好禮</h2>
						<a href="#" class="button">訂閱 Let's Go</a>
					</section>
				</div>

			<!-- Features 2 -->
				<div class="wrapper">
					<section class="container">
						<header class="major">
							<h2>最新活動</h2>
						</header>
						<div class="row features">
							<section class="4u 12u(narrower) feature">
								<div class="image-wrapper first">
									<a href="#" class="image featured"><img src="images/pic1.jpg" alt="" /></a>
								</div>
								<p>SUMMER RESTOCK</p>
							</section>
							<section class="4u 12u(narrower) feature">
								<div class="image-wrapper">
									<a href="#" class="image featured"><img src="images/pic2.jpg" alt="" /></a>
								</div>
								<p>EARLY SUMMER SALE</p>
							</section>
							<section class="4u 12u(narrower) feature">
								<div class="image-wrapper">
									<a href="#" class="image featured"><img src="images/pic3.jpg" alt="" /></a>
								</div>
								<p>SWEET DRESSES</p>
							</section>
						</div>
					</section>
				</div>

			<!-- Footer -->
				<div id="footer-wrapper">
					<div id="footer" class="container">
						<header class="major">
							<h2>歡迎訂閱我們</h2>
							<p>訂閱可以享受每月優惠及熱門促銷資訊</p>
						</header>
						<div class="row">
							<section class="6u 12u(narrower)">
								
									<div class="row 50%">
										<div class="6u 12u(mobile)">
											<input name="name" placeholder="姓名 Name" type="text" />
										</div>
										<div class="6u 12u(mobile)">
											<input name="email" placeholder="信箱 Email" type="text" />
										</div>
									</div>
									<div class="row 50%">
										<div class="12u">
											<textarea name="message" placeholder="想對我們說 Message"></textarea>
										</div>
									</div>
									<div class="row 50%">
										<div class="12u">
											<ul class="actions">
												<li><asp:Button type="submit" ID="BT_Subcript" runat="server" Text="訂閱" /></li>
											</ul>
										</div>
									</div>
								
							</section>
							<section class="6u 12u(narrower)">
								<div class="row 0%">
									<ul class="divided icons 12u 12u(mobile)">
                                        <li class="icon fa-facebook"><a href="#"><span class="extra">facebook.com/</span>untitled</a></li>
										<li class="icon fa-instagram"><a href="#"><span class="extra">instagram.com/</span>untitled</a></li>
									</ul>
									
								</div>
							</section>
						</div>
					</div>
					<div id="copyright" class="container">
						<ul class="menu">
							<li>&copy; Untitled. All rights reserved.</li>
						</ul>
					</div>
				</div>

		</div>
        </form>
		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

            <script src="assets/js/scripts.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
	</body>
</html>
