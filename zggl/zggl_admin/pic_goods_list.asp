<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<div class="J_page">
<table class="J_list" width="100%" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td height="30" colspan="6" align="center" background="images/admin_bg_1.gif"><b><font class="STYLE1">管理</font></b></td>
  </tr>
<%
lei=request("lei")
if lei<>"" then
	sql="select * from pic_goods where mytype="&lei&" order by id desc"
else
	Response.End()
end if
set rs=server.createobject("adodb.recordset") 
rs.open sql,conn,1
rs.pagesize=20 '每页显示多少条
pagecount=rs.pagecount '总页数

if rs.bof and rs.eof then
response.write "没有"
else
%>
<tr align="center">
	<td width="7%" height="22"><b>ID</b></td>
	<td width="53%"><b>名称</b></td>
	<td width="10%"><b>价格</b></td>
	<td width="18%"><b>添加日期</b></td>
	<td width="6%"></td>
	<td width="6%"></td>
</tr>
<%				 
page=clng(request.querystring("page"))
if page<1 then page=1
if page>pagecount then page=pagecount
rs.absolutepage=page  '跳到多少页
  
for i=1 to rs.pagesize
%>
<tr>
	<td height="22" align="center"><%= rs("id") %></td>
	<td>&nbsp;<a href="pic_goods_update.asp?id=<%= rs("id") %>"><%= rs("bt") %></a></td>
	<td align="center"><%= rs("price") %></td>
	<td align="center"><%= rs("riqi") %></td>
	<td align="center"><a  href="pic_goods_update.asp?id=<%= rs("id") %>">修改</a></td>
	<td align="center"><a href="#" onclick="if(confirm('记录删除以后将不能恢复，您确认吗？')){location.href='pic_goods.asp?del=<%=rs("id")%>'};"><font color="#FF0000">删除</font></a></td>
</tr>
<% 
rs.movenext
if rs.eof then exit for 
next
end if 
%>
</table>
<div class="J_pager">
<%
if pagecount > 0 then

	pStart = 1
	pEnd = pagecount
	if pagecount > 7 then
		pStart = page-2
		pEnd = page+2
		if pStart<2 then pStart=2 end if
		if pEnd>pagecount-1 then pEnd=pagecount-1 end if
		if pEnd<pStart then pEnd=pStart end if
		Response.Write("<a href=""pic_goods_list.asp?page=1"">1</a>")
	end if

	if pStart > 2 then Response.Write(" ... ") end if
	
	for i=pStart to pEnd
%>
<a href="pic_goods_list.asp?page=<%=i%>"><%=i%></a>
<%
	next
	
	if pEnd < (pagecount-1) then Response.Write(" ... ") end if
	
	if pagecount > 7 then
%>
<a href="pic_goods_list.asp?page=<%=pagecount%>"><%=pagecount%></a>
<%
	end if
end if
%>
</div>

</div>
</body>
</html>
