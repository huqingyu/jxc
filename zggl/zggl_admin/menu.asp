<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>��̨���� - by seirsoft.com</title>
<link href="css/menu.css" rel="stylesheet" />
</head>
<body>
<div style="width:158px; margin:10px auto;">
	<div class="menu_title" onclick="showsubmenu(1)">
		<span>���¹���</span>
	</div>
	<div id="submenu1" class="sec_menu">
		<ul>
			<li><b></b><A href="news.asp" target=main>�������</A></li>
			<li><b></b><A href="news_list.asp" target=main>��������</A></li>
		</ul>
	</div>

	<div class="menu_title" onclick="showsubmenu(2)">
		<span>�������</span>
	</div>
	<div id="submenu2" class="sec_menu">
		<ul>
			<li><b></b><a href="nlei.asp?wang=nlei" target="main">�������</a></li>
			<li><b></b><a href="nlei.asp?wang=up" target="main">�����޸�</a></li>
		</ul>
	</div>

	<div class="menu_title">
		<span>����</span>
	</div>
	<div class="sec_menu">
		<ul>
			<li><b></b><a href="pwd_update.asp" target="main">�޸�����</a></li>
			<li><b></b><a href="logout.asp" 	target=_top>�˳�</a></li>
		</ul>
	</div>
	<div class="copyright">
		<a href="http://seirsoft.com" target="_blank" style="line-height:20px">seirsoft.com</a>
		<br />
		copyright
	</div>
</div>
<script>
function showsubmenu(sid)
{
	var o = document.getElementById("submenu" + sid);
	if (o.style.display == "none")
	{
		o.style.display = "";
	}
	else
	{
		o.style.display = "none";
	}
}
</script>
</body>