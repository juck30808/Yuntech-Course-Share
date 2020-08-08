<html>
	<head>
		<meta charset="utf-8" />
		<title>1122</title>
	</head>
	<body>
		<h1>testdb資料庫users資料表</h1>
		<hr>
		<?php
			// 建立MySQL的資料庫連接 
			//$link = mysqli_connect("localhost","root","","testdb")or die("無法開啟MySQL資料庫連接!<br>");
			// 建立Access的資料庫連接
			$db = dirname(__FILE__) ."/testdb.accdb";
			$dsn = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ=$db;";
			$username = "";
			$password = "";
			$link = odbc_connect($dsn, $username, $password);
			if ( !$link ) {
				echo "Access資料庫連接錯誤!<br/>";
				exit();
			}
			else {
				echo "Access資料庫myschool連接成功!<br/>";
			}
			odbc_close($link);  // 關閉資料庫連接
			/*
			//  指定SQL查詢字串
			$sql = "SELECT * FROM users";
			
			//送出UTF8編碼的MySQL指令
			//mysqli_query($link, 'SET NAMES utf8'); 
			
			// 送出查詢的SQL指令
			//$result = mysqli_query($link, $sql);
			$result = odbc_exec($link, $sql);
			
			// 一筆一筆的以表格顯示記錄
			echo "<table border=1><tr>";
			// 顯示欄位名稱
			//while ( $meta = mysqli_fetch_field($result) ){
			while ( $meta = odbc_fetch_array($result) ){
				echo "<td>".mb_convert_encoding($meta->name, "UTF-8", "BIG5")."</td>";
			}
			echo "</tr>"; 
			
			// 取得欄位數			
			$total_fields = odbc_num_fields($result);
			
			// 取得記錄數
			$total_records = odbc_num_rows($result);
			
			// 顯示每一筆記錄
			//while ($row = mysqli_fetch_row($result)) {
			//	echo "<tr>"; // 顯示每一筆記錄的欄位值
			//	for ( $i = 0; $i <= $total_fields-1; $i++ ){
			//		echo "<td>" . $row[$i] . "</td>";
			//	}
			///	echo "</tr>";		
			//}	
			//echo "</table>";
			echo "<table border=1>";
			for ($i = 1; $i <= $total_fields; $i++){
				echo "<tr><td>" . mb_convert_encoding(odbc_field_name($result, $i), "UTF-8", "BIG5") . "</td>";
				echo "<td>" . mb_convert_encoding(odbc_field_len($result, $i), "UTF-8", "BIG5") . "</td>";   
				echo "<td>" . mb_convert_encoding(odbc_field_type($result, $i), "UTF-8", "BIG5") . "</td></tr>";   
			}
			echo "</table>";

			// 釋放佔用記憶體  
			//mysqli_free_result($result); 
			odbc_free_result($result)
			
			// 關閉資料庫連接
			//mysqli_close($link); 
			//odbc_close($link);
			*/			
		?>
		<hr>
	</body>
</html>