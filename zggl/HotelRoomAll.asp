<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title>���ݲ�ѯ���--ȫ������</title>
</head>
<body>
<br><br>
<!--#include file="common/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select id,c_name from hotelb where id="&request("id")&"" 
rs.open sqltext,conn
session("starttime")=request.form("starttime")
session("deptime")=request.form("deptime")
%><div align="center">
  <%
  if rs.eof then 
  	response.write "<script language=JavaScript>{window.alert(' �����ڵ�λ��: �����ڵ�λ��:�������²���!');window.history.go(-1);}</script>"
  	response.end
  end if
  if not rs.eof then
  	
  	do while not rs.eof 
  	
	c_id=rs("id")
	set rsroom=server.createobject("adodb.recordset")
	sqltext="select * from roomb where c_id="&c_id&"" 
	sqltext=sqltext & " order by id asc"
	rsroom.open sqltext,conn,1,1
	if rsroom.eof then
		  	response.write "<script language=JavaScript>{window.alert(' �����ڵ�λ��: �����ڵ�λ��:�������²���!');window.history.go(-1);}</script>"
 		  	response.end
	end if
  if not rsroom.eof then
  %>
  <strong><font color="#FF0000" size="+1" ><%=rs("c_name")%>���з���</font></strong>
  <table width="90%" border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <tr>
      <td width="23%" height="25" background="images/topBar_bg.gif">����</td>
      <td width="7%" background="images/topBar_bg.gif">
      <p align="center">���</td>
      <td width="11%" background="images/topBar_bg.gif">���м�</td>
      <td width="22%" colspan="2" background="images/topBar_bg.gif">ǰ̨�ָ���</td>
      <td width="12%" background="images/topBar_bg.gif">�Ŷ�֧����</td>
      <td width="13%" background="images/topBar_bg.gif">֧����ʽ</td>
      <td width="12%" background="images/topBar_bg.gif">
      <p align="center">���շ�̬</td>
    </tr>
    <%if not rsroom.eof then
      do while not rsroom.eof%>
    <tr>
      <td width="23%" height="14"><%=rsroom("type")%></td>
      <td width="7%" height="14">
        <p align="center"><%=rsroom("breakfast")%></td>
      <td width="11%" height="14">RMB <%=rsroom("marketprice")%></td>
      <td width="12%" height="14">RMB <%=rsroom("stageprice")%></td>
      <td width="10%" height="14">
        <p align="center"> <a href="UserInfo/login.asp?hotelid=<%=rs("id")%>&roomid=<%=rsroom("id")%>" target=_blank><font color="#FF0000">Ԥ��</font></a></td>
      <td width="12%" height="14">RMB <%=rsroom("netprice")%></td>
      <td width="13%" height="14"><%=rsroom("paytype")%></td>
      <td width="12%" height="14">
        <p align="center"><%=rsroom("state")%></td>
    </tr>
    <%
        rsroom.movenext
        loop
        rsroom.close
        end if%>
  </table>
  <%
  end if
  rs.movenext
  loop
  end if
  rs.close
  conn.close
  %>
</div>
</body>
</html>