
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
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
result_num=strs.RecordCount '��¼����
end if      
strs.close      
set strs=nothing      

set rs=server.createobject("adodb.recordset")
sql="select id from xianlu where Audit=True order by id desc"
rs.open sql,conn,1,1
if not rs.eof then
Xl_num=rs.RecordCount '��¼����
end if      
rs.close      
set rs=nothing

set rs=server.createobject("adodb.recordset")
sql="select id from HotelB where Audit=True order by id desc"
rs.open sql,conn,1,1
if not rs.eof then
Hotel_num=rs.RecordCount '��¼����
end if      
rs.close      
set rs=nothing
%>

<br /><br /><br />
<table width="90%" height="180" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><font color="red">��</font><a href="Html_index.asp">������վ��ҳ</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="make_XlIndex.asp">����������·��ҳ</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="make_Xllistall_all.asp?type=all&zzyy=1">��������������·��HTMLҳ<font color="green">(��<%=Xl_num%>ҳ,δ��˵��û���·���ᱻ����)</font></a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="make_HotelIndex.asp">���ɾƵ���ҳ</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="Make_HotellistAll_All.asp?type=all&zzyy=1">�������оƵ��HTMLҳ<font color="green">(��<%=Hotel_num%>ҳ,δ��˵��û��Ƶ���Ϣ���ᱻ����)</font></a></td>
  </tr>
</table>
</body></html>