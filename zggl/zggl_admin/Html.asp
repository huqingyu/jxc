
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
dim sql
set rs=server.CreateObject("adodb.recordset")
sql="select id from xianlu where Audit=True order by id desc"
rs.open sql, conn, 1, 1
if not rs.eof then
Xl_num=rs.RecordCount '��¼����
end if      
rs.close      
set rs=nothing

set rs2=server.CreateObject("adodb.recordset")
sql="select id from HotelB where Audit=True order by id desc"
rs2.open sql, conn, 1, 1
if not rs2.eof then
Hotel_num=rs2.RecordCount '��¼����
end if      
rs2.close      
set rs2=nothing
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
