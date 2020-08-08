<html>
	<head>
	<title>1213</title>
	</head>
	<body>
		<center>
			<hr>
			<h3>系統登入</h3>
			<hr>
			<h5>輸入帳號密碼</h5>	
			<form action="ex-1.php" method="post">
				帳號: <INPUT TYPE="text" NAME="account" value="<?php  if (isset($_POST["sfun"]) && isset($_POST["account"])) echo $_POST["account"]; ?>"><br>
				密碼: <INPUT TYPE="text" NAME="password" value="<?php if (isset($_POST["sfun"]) && isset($_POST["password"])) echo $_POST["password"]; ?>"><br>
				
				<INPUT TYPE="submit" name="sfun" VALUE="送出">
				<INPUT TYPE="submit" name="rfun" VALUE="重填">
			</form>
			<hr>
			<?php
				if (isset($_POST["sfun"])) 
				{
			?>
					<font color="red">同步輸入資料</font><br>
					學號: <?php if (isset($_POST["account"])) echo $_POST["account"]; ?><br>
					姓名: <?php if (isset($_POST["password"])) echo $_POST["password"]; ?><br>
			<?php
				}
			?>
			<hr>
		</center>
	</body>
</html>