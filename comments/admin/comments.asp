<%
If Session("admin")="" then
	Response.Write "Please login..."
	Response.end
end if
%>
<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>��̨���� - by seirsoft.com</title>
<link href="css/comments.css" rel="stylesheet" />
</head>
<body>
<div class="J_page">
<table class="J_list" width="100%" border="0" cellpadding="0" cellspacing="1">
<%
sql="select * from comments order by id desc"

set rs=server.createobject("adodb.recordset") 
rs.open sql,conn,1
rs.pagesize=20 'ÿҳ��ʾ������
pagecount=rs.pagecount '��ҳ��

if rs.bof and rs.eof then
response.write "no comments"
else
%>
<tr align="center">
	<td><b>ID</b></td>
	<td><b>�������</b></td>
	<td><b>����������</b></td>
	<td><b>�Ա�</b></td>
	<td><b>��������</b></td>
	<td><b>�ֻ�����</b></td>
	<td><b>������</b></td>
	<td><b>ÿ������</b></td>
</tr>
<%				 
page=clng(request.querystring("page"))
if page<1 then page=1
if page>pagecount then page=pagecount
rs.absolutepage=page  '��������ҳ
  
for i=1 to rs.pagesize
%>
<tr>
	<td align="center"><%= rs("id") %></td>
	<td><%= rs("city") %></td>
	<td><%= rs("name") %></td>
	<td><%= rs("gender") %></td>
	<td><%= rs("email") %></td>
	<td><%= rs("tel") %></td>
	<td><%= rs("credit") %></td>
	<td><%= rs("income") %></td>
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
		Response.Write("<a href=""comments.asp?page=1"">1</a>")
	end if

	if pStart > 2 then Response.Write(" ... ") end if
	
	for i=pStart to pEnd
%>
<a href="comments.asp?page=<%=i%>"><%=i%></a>
<%
	next
	
	if pEnd < (pagecount-1) then Response.Write(" ... ") end if
	
	if pagecount > 7 then
%>
<a href="comments.asp?page=<%=pagecount%>"><%=pagecount%></a>
<%
	end if
end if
%>
</div>

</div>
</body>
</html>
