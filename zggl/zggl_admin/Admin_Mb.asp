<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br /><br /><br />
<table width="680" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><font color="red">·</font>首页模板管理 (请直接用网页编辑软件打开Admin/System/default_Asp.asp文件直接进行编辑)</td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="Html_xlIndex.asp">旅游线路首页模板管理</a>(Xl.html)</td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="Html_xl.asp">旅游线路内容页模板管理</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="Html_Hotel.asp">酒店首页模板管理</a>(Hotel.html)</td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="Html_HotelInfo.asp">酒店内容页模板管理</a></td>
  </tr>
</table>
</body>
</html>
