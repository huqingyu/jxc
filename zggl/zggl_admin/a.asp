<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>��̨���� - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="center"><% 
	set rs=server.createobject("adodb.recordset") 
sql="select * from nlei"
rs.open sql,conn,1 
while not rs.eof 
%>
<a href="news_list.asp?lei=<%= rs("id") %>"><%= rs("nlei") %></a>&nbsp;&nbsp;
<% rs.movenext
wend  %>
</td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#aaccff">
  <tr>
    <td height="30" colspan="6" align="center" background="images/admin_bg_1.gif"><b><font color="#FFF">���¹���</font></b></td>
  </tr>
<%
lei=request("lei")
if lei="" then
sql="select * from news order by id desc"
else
sql="select * from news where mytype="&lei&" order by id desc"
end if 
set rs=server.createobject("adodb.recordset") 
rs.open sql,conn,1
rs.pagesize=50 'ÿҳ��ʾ������
pagecount=rs.pagecount '��ҳ��

if rs.bof and rs.eof then
response.write "û������"
else
%>
<tr align="center">
	<td width="7%" height="22"><b>ID</b></td>
	<td width="53%"><b>���±���</b></td>
	<td width="18%"><b>�������</b></td>
	<td width="10%"><b>�����</b></td>
	<td width="6%"></td>
	<td width="6%"></td>
</tr>
<%				 
page=clng(request.querystring("page"))
if page<1 then page=1
if page>pagecount then page=pagecount
rs.absolutepage=page  '��������ҳ
  
for i=1 to rs.pagesize
%>
<tr>
	<td height="22" align="center"><%= rs("id") %></td>
	<td>&nbsp;<a href="news_update.asp?id=<%= rs("id") %>"><%= rs("bt") %></a></td>
	<td align="center"><%= rs("riqi") %></td>
	<td align="center"><%= rs("lls") %></td>
	<td align="center"><a  href="news_update.asp?id=<%= rs("id") %>">�޸�</a></td>
	<td align="center"><a href="#" onclick="if(confirm('��¼ɾ���Ժ󽫲��ָܻ�����ȷ����')){location.href='news.asp?del=<%=rs("id")%>'};"><font color="#FF0000">ɾ��</font></a></td>
</tr>
<% 
rs.movenext
if rs.eof then exit for 
next
end if 
%>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td height="27" align="center">
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
	end if

	Response.Write("<a href=""news_list.asp?page=1""></a>1</a>")
	
	for i=pStart to pEnd
%>
<a href="news_list.asp?page=<%=i%>"></a><%=i%></a>
<%
	next
	
	if pagecount > 1 then
%>
<a href="news_list.asp?page=<%=pagecount%>"></a><%=pagecount%></a>
<%
	end if
end if
%>
</td>
</tr>
</table>
<form name="ff1" method="post" action="news_add_click.asp">
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td>
�������������<input name="click" size="8" />
<input type="submit" value="�ύ" style="font-size:9pt;padding-top:2px;">
</td>
</tr>
</table>
</form>
</body>
</html>
