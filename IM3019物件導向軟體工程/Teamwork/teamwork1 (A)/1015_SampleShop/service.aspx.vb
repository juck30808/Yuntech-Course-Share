
Imports System.Data
Imports System.Net.Mail

Partial Class index
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim app As String = Request.QueryString("app")
        Select Case app
            Case "regist"
                Panel_Regist.Visible = True
                Exit Select
            Case "Certification"
                Panel_Certification.Visible = True
                Dim Certification As String = Request.QueryString("Certification")
                If Certification <> "" Then
                    Dim ads As New System.Web.UI.WebControls.SqlDataSource
                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
                    ads.UpdateCommand = "UPDATE [Users] SET [User_Type] = 1 WHERE [User_Certification] = '" & Certification & "'"
                    ads.Update()
                    Response.Write("<script> alert('信箱驗證完成，將返回登入'); location.href='PDlist.aspx'; </script>")
                End If
                Exit Select
            Case "shoplist"
                Panel_Shoplist.Visible = True
                Exit Select
            Case "setdown"
                Panel_Setdown.Visible = True
                Exit Select
        End Select

    End Sub

    Private Sub BT_Regist_Click(sender As Object, e As EventArgs) Handles BT_Regist.Click
        If Check_RegistField() Then
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Users] WHERE (([User_Acc] = @ACC))"
            ads.SelectParameters.Add("ACC", TB_Regist_Acc.Text)
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            If dv.Count = 0 Then
                ads.InsertCommand = "INSERT INTO [Users] ([User_Acc],[User_Pwd],[User_Name],[User_Email],[User_Address],[User_Certification]) Values ('" & TB_Regist_Acc.Text & "','" & TB_Regist_Pwd.Text & "','" & TB_Regist_Name.Text & "','" & TB_Regist_Email.Text & "','" & TB_Regist_Address.Text & "','" & CreatRandomNum() & "')"
                ads.Insert()
                '========================================認證信件寄送==========================================
                ads.SelectCommand = "SELECT * FROM [Users] WHERE (([User_Acc] = @ACC))"
                ads.SelectParameters.Add("ACC", TB_Regist_Acc.Text)
                dv = ads.Select(New DataSourceSelectArguments)
                'Dim myMail As New MailMessage()
                'myMail.From = New MailAddress("發送者信箱", "發送者暱稱") '發送者 	
                'myMail.To.Add(dv(0)("User_Email"))  '收件者
                'myMail.SubjectEncoding = Encoding.UTF8  '主題編碼格式 
                'myMail.Subject = "Sample會員認證信件" '主題 
                'myMail.IsBodyHtml = True    'HTML語法(true:開啟false:關閉) 	
                'myMail.BodyEncoding = Encoding.UTF8 '內文編碼格
                'myMail.Body = "<a href='http://localhost:4111/service.aspx?app=Certification&Certification='" & dv(0)("User_Certification") & "</a>" '內文
                'Dim mySmtp As New SmtpClient()  '建立SMTP連線 	
                'mySmtp.Credentials = New System.Net.NetworkCredential("此處填帳號", "此處填密碼")  '連線驗證 
                'mySmtp.Port = 25   'SMTP Port 
                'mySmtp.Host = "webmail.yuntech.edu.tw"  'SMTP主機名 	
                'mySmtp.EnableSsl = False '開啟SSL驗證 
                'mySmtp.Send(myMail) '發送
                '==============================================================================================
                Response.Redirect("service.aspx?app=Certification")
                LB_Certificaion_Email.Text = "請至所填寫的「" & dv(0)("User_Email") & "」進行驗證"

            Else
                TB_Regist_Acc.Text = ""
                TB_Regist_Acc.Focus()
                Response.Write("<script> alert('帳號已經有人使用')</script>")
            End If

        End If
    End Sub

    Private Sub GridView1_DataBound(sender As Object, e As EventArgs) Handles GridView1.DataBound
        Dim total As Integer
        If GridView1.Rows.Count = 0 Then
            GridView1.Visible = False
            Response.Redirect("PDlist.aspx")
        Else

            For i = 0 To GridView1.Rows.Count - 1
                Dim RowPrice As Label = CType(GridView1.Rows(i).FindControl("label2"), Label)
                Dim RowQuantity As Label = CType(GridView1.Rows(i).FindControl("label3"), Label)
                Dim Row_PD_Quantity As Label = CType(GridView1.Rows(i).FindControl("label4"), Label)
                Dim DDL As DropDownList = CType(GridView1.Rows(i).FindControl("DDL1"), DropDownList)
                For j = 1 To Val(Row_PD_Quantity.Text)
                    DDL.Items.Add(j)
                Next
                DDL.SelectedIndex = Val(RowQuantity.Text) - 1

                total += (Val(RowPrice.Text) * Val(DDL.SelectedValue))
            Next
            LB_shoplist_showprice.Text = "總計金額 : " & total
        End If
    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
        ads.DeleteCommand = "DELETE FROM [Shoplist] WHERE [Shop_ID] = @Shop_ID"
        ads.DeleteParameters.Add("Shop_ID", e.CommandArgument)
        ads.Delete()
    End Sub


    Protected Sub DDL1_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim ddl As DropDownList = DirectCast(sender, DropDownList)
        Dim gvr As GridViewRow = ddl.NamingContainer
        Dim Shop_ID As Label = CType(GridView1.Rows(gvr.RowIndex).FindControl("label5"), Label)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
        ads.UpdateCommand = "UPDATE [Shoplist] SET [Shop_Quantity] = '" & ddl.SelectedValue & "' WHERE [Shop_ID] = " & Val(Shop_ID.Text) & ""
        ads.Update()
        GridView1.DataBind()
    End Sub

    Private Sub BT_shoplist_toPay_Click(sender As Object, e As EventArgs) Handles BT_shoplist_toPay.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("SampleShopConnectionString").ConnectionString
        ads.DeleteCommand = "DELETE FROM [Shoplist] WHERE [User_ID] = @User_ID"
        ads.DeleteParameters.Add("User_ID", Session("User_ID"))
        ads.Delete()
        Response.Redirect("service.aspx?app=setdown")
    End Sub
    Function Check_RegistField() As Boolean
        If TB_Regist_Acc.Text = "" Then
            Response.Write("<script> alert('請填寫「帳號 ID」欄位')</script>")
            Check_RegistField = False
            TB_Regist_Acc.Focus()
        ElseIf TB_Regist_Pwd.Text = "" Then
            Response.Write("<script> alert('請填寫「密碼 Password」欄位')</script>")
            Check_RegistField = False
            TB_Regist_Pwd.Focus()
        ElseIf TB_Regist_rePwd.Text = "" Then
            Response.Write("<script> alert('請填寫「再次密碼 RePassword」欄位')</script>")
            Check_RegistField = False
            TB_Regist_rePwd.Focus()
        ElseIf TB_Regist_Name.Text = "" Then
            Response.Write("<script> alert('請填寫「姓名 Name」欄位')</script>")
            Check_RegistField = False
            TB_Regist_Name.Focus()
        ElseIf TB_Regist_Email.Text = "" Then
            Response.Write("<script> alert('請填寫「信箱 Email」欄位')</script>")
            Check_RegistField = False
            TB_Regist_Email.Focus()
        ElseIf TB_Regist_Address.Text = "" Then
            Response.Write("<script> alert('請填寫「地址 Address」欄位')</script>")
            Check_RegistField = False
            TB_Regist_Address.Focus()
        Else
            If TB_Regist_Pwd.Text <> TB_Regist_rePwd.Text Then
                TB_Regist_Pwd.Text = ""
                TB_Regist_rePwd.Text = ""
                TB_Regist_Pwd.Focus()
                Response.Write("<script> alert('再次密碼輸入錯誤，請重新輸入密碼')</script>")
                Check_RegistField = False
            Else
                If CheckEmail(TB_Regist_Email.Text) Then
                    Check_RegistField = True
                Else
                    Check_RegistField = False
                End If
            End If
        End If
    End Function

    Function CheckEmail(ByVal Check_TB_Email As String) As Boolean
        Dim i As Integer
        For i = 1 To Len(Check_TB_Email)
            If Mid(Check_TB_Email, i, 1) = "@" Then
                CheckEmail = True
                Exit Function
            End If
        Next
        Response.Write("<script> alert('「信箱 Email」格式錯誤，請重新輸入')</script>")
        TB_Regist_Email.Focus()
        CheckEmail = False
    End Function

    Function CreatRandomNum() As String
        Dim rndpwd As String = ""
        Randomize()
        For i = 1 To 8
            Select Case (Int(Rnd() * 3) + 1)
                Case 1
                    rndpwd &= Chr(Int(Rnd() * 26) + 65)
                Case 2
                    rndpwd &= Chr(Int(Rnd() * 26) + 97)
                Case 3
                    rndpwd &= Int(Rnd() * 10)
            End Select
        Next
        CreatRandomNum = rndpwd
    End Function


End Class
