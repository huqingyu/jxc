
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>������Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet"></head>
<body>
<br /><br /><br />
<!--#include file="admin_common/conn.asp" -->
<!--#include file="system/system_code.asp" -->
<%
'����û������ʱ
set rs=server.createobject("adodb.recordset")
sqltext="select * from roomb order by id desc" 
rs.open sqltext,conn,1,1
If rs.eof and rs.bof then 
   response.write "<p align='center'><font color='#ff0000'>��û�κη�����Ϣ</font></p>"
   response.end
Else
call list
End if
Sub list()%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
<TBODY><TR><TD height="30" background="Images/topBar_bg.gif" colspan="2">&nbsp;&nbsp;�ѵǼǵķ�����Ϣ</TD>
</TR><TD height="25" colspan="2">&nbsp;</TD>
</TR><TR><TD colspan="2">
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
<tr><td width="18%" height="25" align="center" background="Images/topBar_bg.gif">�����Ƶ�</td>
<td width="11%" align="center" background="Images/topBar_bg.gif">����</td>
<td width="9%" align="center" background="Images/topBar_bg.gif">���շ�̬</td>
<td width="11%" align="center" background="Images/topBar_bg.gif">���м۸�</td>
<td width="11%" align="center" background="Images/topBar_bg.gif">ǰ̨�ָ���</td>
<td width="8%" align="center" background="Images/topBar_bg.gif">����</td></tr>
<%
if not rs.eof then
rs.PageSize =20 'ÿҳ��¼����
result_num=rs.RecordCount '��¼����
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
<input type="button" value="����" onclick=" window.location='roomdetail.asp?id=<%=rs("id")%>'"  ><input type="button" value="�༭" onclick=" window.location='editroomdetail.asp?id=<%=rs("id")%>'"><input type="button" value="ɾ��" onclick="if (confirm('ȷʵҪ������¼��')) window.location='roominfodel.asp?id=<%=rs("id")%>'"></td>
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