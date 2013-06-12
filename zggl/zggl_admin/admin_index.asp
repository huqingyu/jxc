<!--#include file="admin_common/admin_check.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/frame.css" rel="stylesheet" />
</head>
<body scroll="no">
<ul id="content">
	<li id="left" class="J_left">
		<iframe class="frmLeft" src="menu.asp" frameBorder="0"></iframe>
	</li>
	<li class="J_middle">
		<div class="navPoint" onclick="switchSysBar();"></div>
	</li>
	<li class="J_right">
		<iframe id="main" name="main" src="main.asp" target="_self" frameBorder="0" width="100%"></iframe>
	</li>
</ul>
<script src="js/frame.js"></script>
</body>
</html>
