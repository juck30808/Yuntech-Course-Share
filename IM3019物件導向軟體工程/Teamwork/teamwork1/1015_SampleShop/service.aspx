<%@ Page Language="VB" AutoEventWireup="false" CodeFile="service.aspx.vb" Inherits="index" %>

<!DOCTYPE HTML>

<html>
	<head>
		<title>SampleShop for Learning Coding</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" /> 
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="no-sidebar">
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
						<!-- Content -->
                        <asp:Panel ID="Panel_Regist" runat="server" Visible="false">
                            <div class="row">
                                <section class="3u 12u(narrower)"></section>
                                <section class="6u 12u(narrower)">
                                    <article id="content">
								        <header>
									        <h2>會員註冊</h2>
								        </header>
								        <p><asp:TextBox ID="TB_Regist_Acc" runat="server" placeholder="帳號 ID"></asp:TextBox></p>
                                        <p><asp:TextBox ID="TB_Regist_Pwd" runat="server" placeholder="密碼 Password" TextMode="Password"></asp:TextBox></p>
                                        <p><asp:TextBox ID="TB_Regist_rePwd" runat="server" placeholder="再次密碼 RePassword" TextMode="Password"></asp:TextBox></p>
                                        <p><asp:TextBox ID="TB_Regist_Name" runat="server" placeholder="姓名 Name"></asp:TextBox></p>
								        <p><asp:TextBox ID="TB_Regist_Email" runat="server" placeholder="信箱 Email"></asp:TextBox></p>
                                        <p><asp:TextBox ID="TB_Regist_Address" runat="server" placeholder="地址 Address"></asp:TextBox></p>
                                        <header>
									        <h2><asp:Button ID="BT_Regist" runat="server" Text="確認註冊" /> <asp:Button ID="BT_Regist_Cancel" runat="server" Text="取消註冊" PostBackUrl="~/PDlist.aspx" /></h2>
								        </header>
							        </article>
                                </section>
                                <section class="3u 12u(narrower)"></section>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="Panel_Certification" runat="server" Visible="false">
                            <div class="row">
                                <section class="3u 12u(narrower)"></section>
                                <section class="6u 12u(narrower)">
                                    <article id="content1">
								        <header>
									        <h2><asp:Label ID="LB_Certification_Infor" runat="server" Text="恭喜成功加入會員"></asp:Label></h2>
                                            <p><asp:Label ID="LB_Certificaion_Email" runat="server" Text="請至所填寫的信箱進行驗證"></asp:Label></p>
								        </header>
							        </article>
                                </section>
                                <section class="3u 12u(narrower)"></section>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="Panel_Shoplist" runat="server" Visible="false">
                            <div class="row">
                                <section class="3u 12u(narrower)"></section>
                                <section class="6u 12u(narrower)">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" CommandArgument='<%# Eval("Shop_ID") %>' />
                                                
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                            <asp:TemplateField HeaderText="產品名稱" SortExpression="PD_Name">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PD_Name") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PD_Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="價格" SortExpression="PD_Price">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PD_Price") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PD_Price") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="數量" SortExpression="Shop_Quantity">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Shop_Quantity") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Shop_Quantity") %>' Visible="False"></asp:Label>
                                                    <asp:DropDownList ID="DDL1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL1_SelectedIndexChanged" >
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PD_Quantity" SortExpression="PD_Quantity" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PD_Quantity") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PD_Quantity") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Shop_ID" SortExpression="Shop_ID" Visible="False">
                                                <EditItemTemplate>
                                                    <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="Shop_ID" Mode="Edit" />
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Shop_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                                    </asp:GridView>

                                    <table class="style1">
                                        <tr>
                                            <td style="text-align: right">
                                                -----------------------------
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="LB_shoplist_showprice" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
                                                    Font-Size="Large" style="text-align: right" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                ===================
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Button ID="BT_shoplist_toBuy" runat="server" Text="繼續購物" PostBackUrl="~/PDlist.aspx" />
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="BT_shoplist_toPay" runat="server" Text="完成訂單" />
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </section>
                                <section class="3u 12u(narrower)"></section>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="Panel_Setdown" runat="server" Visible="false">
                            <div class="row">
                                <section class="3u 12u(narrower)"></section>
                                <section class="6u 12u(narrower)">
                                    <article id="content2">
								        <header>
									        <h2><asp:Label ID="Label6" runat="server" Text="恭喜! 您的訂單已建立完成"></asp:Label></h2>
                                            <p><asp:Label ID="Label7" runat="server" Text="貨品到達指定地點時將以簡訊通知"></asp:Label></p>
								        </header>
							        </article>
                                </section>
                                <section class="3u 12u(narrower)"></section>
                            </div>
                        </asp:Panel>
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

		</div>
        </form>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SampleShopConnectionString %>" SelectCommand="SELECT Products.PD_Name, Products.PD_Price, Products.PD_Quantity, Users.User_ID, Users.User_Name, Users.User_Email, Users.User_Address, Users.User_Dividend, Users.User_Type, Users.User_Certification, Shoplist.Shop_Quantity, Shoplist.Shop_ID FROM ((Products INNER JOIN Shoplist ON Products.PD_ID = Shoplist.PD_ID) INNER JOIN Users ON Shoplist.User_ID = Users.User_ID) WHERE (Users.User_Certification = @shoplist)" DeleteCommand="DELETE FROM [Shoplist] WHERE ([Shop_ID] = @Shop_ID)" InsertCommand="INSERT INTO [Products] ([PD_ID], [PD_Name], [PD_Price], [PD_Quantity], [PD_Photo]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Products] SET [PD_Name] = ?, [PD_Price] = ?, [PD_Quantity] = ?, [PD_Photo] = ? WHERE [PD_ID] = ?">
            <SelectParameters>
                <asp:QueryStringParameter Name="shoplist" Type="String" QueryStringField="shoplist" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name ="Shop_ID" Type="int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PD_ID" Type="Int32" />
                <asp:Parameter Name="PD_Name" Type="String" />
                <asp:Parameter Name="PD_Price" Type="Int32" />
                <asp:Parameter Name="PD_Quantity" Type="Int32" />
                <asp:Parameter Name="PD_Photo" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PD_Name" Type="String" />
                <asp:Parameter Name="PD_Price" Type="Int32" />
                <asp:Parameter Name="PD_Quantity" Type="Int32" />
                <asp:Parameter Name="PD_Photo" Type="String" />
                <asp:Parameter Name="PD_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
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
