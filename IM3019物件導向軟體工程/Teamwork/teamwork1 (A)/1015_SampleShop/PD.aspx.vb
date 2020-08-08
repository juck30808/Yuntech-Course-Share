
Imports System.Data

Partial Class PDlist
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("isLogin") Then
            Panel_Signing.Visible = False
            Panel_Signed.Visible = True
            LB_User_Name.Text = Session("User_Name")
            LB_User_Dividend.Text = "紅利積點：" & Session("User_Dividend")
            If Session("User_Type") = 0 Then
                LB_User_isCertification.Text = "信箱未驗證"
            ElseIf Session("User_Type") = 1 Then
                LB_User_isCertification.Text = "已驗證"
            ElseIf Session("User_Type") = 2 Then
                LB_User_isCertification.Text = "管理者"
            End If
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Shoplist] WHERE (([User_ID] = " & Session("User_ID") & "))"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            LB_Shoplist_Num.Text = "目前購物車有 (" & dv.Count & ") 件商品"
            LKB_ShopList_Num.PostBackUrl = "~/service.aspx?app=shoplist&shoplist=" & Session("User_Certification")
        Else
            Panel_Signing.Visible = True
            Panel_Signed.Visible = False

        End If

        Dim PD_ID As String = Request.QueryString("PD")
        If PD_ID <> "" Then
            Panel_PDInfor.Visible = True
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Products] WHERE (([PD_ID] = " & PD_ID & "))"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            LB_PDlist_Name.Text = dv(0)("PD_Name")
            Image_PDlist_Photo.ImageUrl = "~/images/" & dv(0)("PD_Photo") & ".jpg"
            LB_PDlist_Price.Text = dv(0)("PD_Price")
            LB_PDlist_Desc.Text = dv(0)("PD_Desc")
            For i = 1 To dv(0)("PD_Quantity")
                DropDown_PDlist_Quantity.Items.Add(i)
            Next
        Else
            Response.Redirect("PDlist.aspx")
        End If
    End Sub
    Private Sub BT_Logout_Click(sender As Object, e As EventArgs) Handles BT_Logout.Click
        Session("isLogin") = False
        Session("User_ID") = ""
        Session("User_Name") = ""
        Session("User_Dividend") = ""
        Panel_Signing.Visible = True
        Panel_Signed.Visible = False
        Response.Redirect("PDlist.aspx")
    End Sub
    Protected Sub BT_Login_Click(sender As Object, e As EventArgs) Handles BT_Login.Click
        If TB_User_Acc.Text.Length = 0 Then
            Response.Write(" < Script > alert('請輸入帳號')</script>")
            TB_User_Acc.Focus()
            Exit Sub
        ElseIf TB_User_Pwd.Text.Length = 0 Then
            Response.Write("<script> alert('請輸入密碼')</script>")
            TB_User_Pwd.Focus()
            Exit Sub
        End If

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Users] WHERE (([User_Acc] = @ACC) AND ([User_PWD] = @PWD))"
        ads.SelectParameters.Add("ACC", TB_User_Acc.Text)
        ads.SelectParameters.Add("PWD", TB_User_Pwd.Text)
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count <> 0 Then
            Session("isLogin") = True
            Session("User_ID") = dv(0)("User_ID")
            Session("User_Name") = dv(0)("User_Name")
            Session("User_Dividend") = dv(0)("User_Dividend")
            Session("User_Certification") = dv(0)("User_Certification")
            Session("User_Type") = dv(0)("User_Type")
            Panel_Signing.Visible = False
            Panel_Signed.Visible = True
            Response.Redirect("PDlist.aspx")
        Else
            Session("isLogin") = False
            Response.Write("<script> alert('帳號或密碼輸入錯誤'); location.href='index.aspx'; </script>")
        End If
    End Sub


    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs)
        Response.Write("<script> alert('帳號或密碼輸入錯誤'); location.href='index.aspx'; </script>")
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
    End Sub



    Private Sub BT_PDlist_AddShoplist_Click(sender As Object, e As EventArgs) Handles BT_PDlist_AddShoplist.Click
        If Session("isLogin") Then
            Dim PD_ID As String = Request.QueryString("PD")
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Shoplist] WHERE (([User_ID] = " & Session("User_ID") & ") AND ([PD_ID] = " & PD_ID & "))"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            If dv.Count = 0 Then
                ads.InsertCommand = "INSERT INTO [Shoplist] ([User_ID],[PD_ID],[Shop_Quantity]) Values ('" & Session("User_ID") & "','" & PD_ID & "','" & DropDown_PDlist_Quantity.SelectedValue & "')"
                ads.Insert()
                ads.SelectCommand = "SELECT * FROM [Shoplist] WHERE (([User_ID] = " & Session("User_ID") & "))"
                dv = ads.Select(New DataSourceSelectArguments)
                LB_Shoplist_Num.Text = "目前購物車有 (" & dv.Count & ") 件商品"
                Response.Write("<script> alert('已加入購物車'); location.href='PDlist.aspx';</script>")
            Else
                Response.Write("<script> alert('購物車中已存在相同商品'); location.href='PDlist.aspx';</script>")
            End If
        Else
            TB_User_Acc.Focus()
            Response.Write("<script> alert('請先登入')</script>")
        End If
    End Sub
End Class
