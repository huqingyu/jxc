
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
set strs=server.createobject("adodb.recordset")
stsql="select id,time from news order by time desc"
strs.open stsql,conn,1,1
if not strs.eof then
result_num=strs.RecordCount '记录总数
end if      
strs.close      
set strs=nothing      

set rs=server.createobject("adodb.recordset")
sql="select id from xianlu where Audit=True order by id desc"
rs.open sql,conn,1,1
if not rs.eof then
Xl_num=rs.RecordCount '记录总数
end if      
rs.close      
set rs=nothing

set rs=server.createobject("adodb.recordset")
sql="select id from HotelB where Audit=True order by id desc"
rs.open sql,conn,1,1
if not rs.eof then
Hotel_num=rs.RecordCount '记录总数
end if      
rs.close      
set rs=nothing
%>

<br /><br /><br />
<table width="90%" height="180" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><font color="red">·</font><a href="Html_index.asp">生成网站首页</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="make_XlIndex.asp">生成旅游线路首页</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="make_Xllistall_all.asp?type=all&zzyy=1">生成所有旅游线路的HTML页<font color="green">(共<%=Xl_num%>页,未审核的用户线路不会被生成)</font></a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="make_HotelIndex.asp">生成酒店首页</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">·</font><a href="Make_HotellistAll_All.asp?type=all&zzyy=1">生成所有酒店的HTML页<font color="green">(共<%=Hotel_num%>页,未审核的用户酒店信息不会被生成)</font></a></td>
  </tr>
</table>
</body></html>
