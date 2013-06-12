<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="system/WebConfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<title><%=webname & "--后台管理页面"%></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<style type="text/css">
a:link { color:#000000;text-decoration:none}
a:hover {color:#666666;}
a:visited {color:#000000;text-decoration:none}

td {FONT-SIZE: 9pt; FILTER: dropshadow(color=#FFF,offx=1,offy=1); COLOR: #000000; FONT-FAMILY: "宋体"}
img {filter:Alpha(opacity:100); chroma(color=#FFF)}
</style>
<base target="main">
<script language="JavaScript" type="text/JavaScript">
function preloadImg(src)
{
	var img=new Image();
	img.src=src
}
preloadImg("Images/admin_top_open.gif");

var displayBar=true;
function switchBar(obj)
{
	if (displayBar)
	{
		parent.frame.cols="0,*";
		displayBar=false;
		obj.src="Images/admin_top_open.gif";
		obj.title="打开左边管理导航菜单";
	}
	else{
		parent.frame.cols="180,*";
		displayBar=true;
		obj.src="Images/admin_top_close.gif";
		obj.title="关闭左边管理导航菜单";
	}
}
</script>
</head>

<body background="Images/admin_top_bg.gif" leftmargin="0" topmargin="0">
<table height="100%" width="100%" border=0 cellpadding=0 cellspacing=0>
<tr valign=middle>
	<td width=91>
	&nbsp;<img onclick="switchBar(this)" src="Images/admin_top_close.gif" title="关闭左边管理导航菜单" style="cursor:hand">
	</td>
	<td width=20>
		<img src="Images/admin_top_icon_1.gif">
	</td>
	<td width=63>
		<a href="Admin_password.asp">修改密码</a>
	</td>
	<td width=22>
		<img src="Images/admin_top_icon_5.gif">
	</td>
	<td width=127>
<a href="admin_masterlook.asp?action=looknew">查看新的线路预订信息</a>
	</td>
	<td width=17>
		<img src="Images/admin_top_icon_5.gif">
	</td>
	<td width=123>
		<a href='OrderInfo.asp'>查看新的酒店预订信息</a></td>
	<td width="20"><img src="Images/admin_top_icon_5.gif">
  </td>
    <td width="124"><a href='admin_lookjipiao.asp?action=looknew'>查看新的机票预订信息</a></td>
    <td width="194" align="right"></td>
</tr>
</table>
</body>
</html>
