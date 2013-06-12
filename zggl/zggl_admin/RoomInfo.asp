
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>房型信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet"></head>
<body>
<br /><br /><br />
<!--#include file="admin_common/conn.asp" -->
<!--#include file="system/system_code.asp" -->
<%
'假如没有数据时
set rs=server.createobject("adodb.recordset")
sqltext="select * from roomb order by id desc" 
rs.open sqltext,conn,1,1
If rs.eof and rs.bof then 
   response.write "<p align='center'><font color='#ff0000'>还没任何房型信息</font></p>"
   response.end
Else
call list
End if
Sub list()%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
<TBODY><TR><TD height="30" background="Images/topBar_bg.gif" colspan="2">&nbsp;&nbsp;已登记的房型信息</TD>
</TR><TD height="25" colspan="2">&nbsp;</TD>
</TR><TR><TD colspan="2">
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
<tr><td width="18%" height="25" align="center" background="Images/topBar_bg.gif">所属酒店</td>
<td width="11%" align="center" background="Images/topBar_bg.gif">房型</td>
<td width="9%" align="center" background="Images/topBar_bg.gif">首日房态</td>
<td width="11%" align="center" background="Images/topBar_bg.gif">门市价格</td>
<td width="11%" align="center" background="Images/topBar_bg.gif">前台现付价</td>
<td width="8%" align="center" background="Images/topBar_bg.gif">操作</td></tr>
<%
if not rs.eof then
rs.PageSize =20 '每页记录条数
result_num=rs.RecordCount '记录总数
maxpage=rs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
rs.AbsolutePage=Page
else
result_num=0
maxpage=0
page=0
end if
if not rs.eof then 
for i=1 to rs.PageSize
hotelid=rs("c_id")
set rs_hotel=server.createobject("adodb.recordset")
stsql="select c_name from hotelb where id="&hotelid
rs_hotel.open stsql,conn,1,1
%> 
<tr><td width="18%" align="center" height="23"><%=rs_hotel("c_name")%></td>
<td width="11%" align="center" height="23"><%=rs("type")%></td>
<td width="9%" align="center" height="23"><%=rs("state")%></td>
<td width="11%" align="center" height="23"><%=rs("marketprice")%></td>
<td width="11%" align="center" height="23">
<p align="center"><%=rs("stageprice")%></td>
<td width="8%" align="center" height="23">
<input type="button" value="详情" onclick=" window.location='roomdetail.asp?id=<%=rs("id")%>'"  ><input type="button" value="编辑" onclick=" window.location='editroomdetail.asp?id=<%=rs("id")%>'"><input type="button" value="删除" onclick="if (confirm('确实要此条记录吗？')) window.location='roominfodel.asp?id=<%=rs("id")%>'"></td>
</tr>
<%
rs_hotel.close
rs.movenext      
if rs.EOF then Exit For
next      
end if
%></table></TD></TR><TR><TD height="30" colspan="2">
<p align="center"><% call LastNextPage(maxpage,page,result_num) %></TD></TR><td width="489"></TBODY></TABLE>
<br />
<%
rs.close
End sub
%>
</body>
</html>