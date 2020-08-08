<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PD.aspx.vb" Inherits="PDlist" enableEventValidation="false" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>SampleShop for Learning Coding</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="left-sidebar">
        <form id="form2" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		    <div id="page-wrapper">

			    <!-- Header -->
				    <div id="header-wrapper">
					    <div id="header" class="container">

						    <!-- Logo -->
							    <h1 id="logo"><a href="index.aspx">SAMPLE SHOP</a></h1>

						    <!-- Nav -->
							    <nav id="nav">
								    <ul>
									    <li>
										    <a href="#">新品上市</a>
										    <ul>
											    <li><a href="PDlist.aspx">每周新品</a></li>
											    <li><a href="PDlist.aspx">夏季新品</a></li>
										    </ul>
									    </li>
									    <li><a href="PDlist.aspx">暢銷排行</a></li>
									    <li class="break"><a href="PDlist.aspx">全館商品</a></li>
									    <li><a href="PDlist.aspx">精選活動</a></li>
								    </ul>
							    </nav>

					    </div>
				    </div>

			    <!-- Main -->
				    <div class="wrapper">
					    <div class="container" id="main">
						    <div class="row">
							    <div class="4u 12u(narrower)">

								    <!-- Sidebar -->
									    <section id="sidebar">
                                            <asp:Panel ID="Panel_Signing" runat="server">
                                                <section>
											        <header>
												        <h3>會員登入</h3>
											        </header>
											        <p><asp:TextBox ID="TB_User_Acc" runat="server" placeholder="帳號 ID"></asp:TextBox></p>
                                                    <p><asp:TextBox ID="TB_User_Pwd" Type="Password" runat="server" placeholder="密碼 Password"></asp:TextBox></p>
											        <ul class="actions">
												        <li>
                                                            <asp:Button ID="BT_Login" runat="server" Text="登入" /> <asp:Button ID="BT_toRegist" runat="server" Text="加入會員" PostBackUrl="~/service.aspx?app=regist" />
                                                        </li>
											        </ul>
										        </section>
                                            </asp:Panel>
										    <asp:Panel ID="Panel_Signed" runat="server" Visible="false">
                                                <section>
											        <header>
												        <h3>歡迎 <asp:Label ID="LB_User_Name" runat="server" Text=""></asp:Label> 回來</h3>
											        </header>

											        <p>會員狀態：<asp:Label ID="LB_User_isCertification" runat="server" Text=""></asp:Label></p>
                                                    <p><asp:Label ID="LB_User_Dividend" runat="server" Text=""></asp:Label></p>
                                                    <p>
                                                        <asp:LinkButton ID="LKB_ShopList_Num" runat="server"><asp:Label ID="LB_Shoplist_Num" runat="server" Text="目前購物車有 (0) 件商品"></asp:Label></asp:LinkButton>
                                                    </p>
											        <p><asp:Button ID="BT_Logout" runat="server" Text="登出" /></p>
										        </section>
                                            </asp:Panel>
                                            <section>
											    <a href="#" class="image featured"><img src="images/caroupic02.jpg" alt=""/></a>
										    </section>
									    </section>

							    </div>
                                    <!-- Content -->
                                

							    
                                    <div class="4u 12u(narrower) important(narrower)">
                                        <article id="content1">
                                            <asp:Panel ID="Panel_PDInfor" runat="server" Visible="false">
                                            <section>
											    <header>
												    <h3><asp:Label ID="LB_PDlist_Name" runat="server" Text=""></asp:Label></h3>
											    </header>
                                                
                                                <p><asp:Image ID="Image_PDlist_Photo" runat="server" /></p>
                                                
										    </section>
                                            </asp:Panel>
									    </article>
                                    </div>
                                    <div class="4u 12u(narrower) important(narrower)">
                                        <article id="content2">
                                            <section>
                                                <p>　</p>
											    <p>$<asp:Label ID="LB_PDlist_Price" runat="server" Text=""></asp:Label></p>
                                                <p><asp:Label ID="LB_PDlist_Desc" runat="server" Text=""></asp:Label></p>
                                                <p>數量<asp:DropDownList ID="DropDown_PDlist_Quantity" runat="server"></asp:DropDownList></p>
                                                <asp:Button ID="BT_PDlist_AddShoplist" runat="server" Text="加入購物車" /> 
										    </section>
									    </article>
                                    </div>
                                
							</div>
                            
						</div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleShopConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [PD_ID] = @PD_ID" InsertCommand="INSERT INTO [Products] ([PD_Name], [PD_Price], [PD_Quantity], [PD_Photo], [PD_Desc]) VALUES (@PD_Name, @PD_Price, @PD_Quantity, @PD_Photo, @PD_Desc)" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [PD_Name] = @PD_Name, [PD_Price] = @PD_Price, [PD_Quantity] = @PD_Quantity, [PD_Photo] = @PD_Photo, [PD_Desc] = @PD_Desc WHERE [PD_ID] = @PD_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="PD_ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="PD_Name" Type="String" />
                                <asp:Parameter Name="PD_Price" Type="Int32" />
                                <asp:Parameter Name="PD_Quantity" Type="Int32" />
                                <asp:Parameter Name="PD_Photo" Type="String" />
                                <asp:Parameter Name="PD_Desc" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="PD_Name" Type="String" />
                                <asp:Parameter Name="PD_Price" Type="Int32" />
                                <asp:Parameter Name="PD_Quantity" Type="Int32" />
                                <asp:Parameter Name="PD_Photo" Type="String" />
                                <asp:Parameter Name="PD_Desc" Type="String" />
                                <asp:Parameter Name="PD_ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        </div>
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

		    
        </form>
        
		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
