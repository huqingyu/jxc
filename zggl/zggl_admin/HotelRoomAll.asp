<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
<title>宾馆查询结果--全部房型</title>
</head>
<body>
<br /><br />
<!--#include file="admin_common/conn.asp" -->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select id,c_name from hotelb where id="&request("id")&"" 
rs.open sqltext,conn
session("starttime")=request.form("starttime")
session("deptime")=request.form("deptime")
%><div align="center">
  <%
  if rs.eof then 
  	response.write "<script>{window.alert('没有找到符合条件的宾馆信息，返回重新查找!');window.history.go(-1);}</script>"
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
		  	response.write "<script>{window.alert('没有找到符合条件的宾馆信息，返回重新查找!');window.history.go(-1);}</script>"
 		  	response.end
	end if
  if not rsroom.eof then
  %>
  <strong><font color="#FF0000" size="+1" ><%=rs("c_name")%>所有房型</font></strong>
  <table width="90%" border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#FFF bgcolor="#F9F9F9">
    <tr>
      <td width="23%" height="25" background="images/admin_bg_1.gif">房型</td>
      <td width="7%" background="images/admin_bg_1.gif">
      <p align="center">早餐</td>
      <td width="11%" background="images/admin_bg_1.gif">门市价</td>
      <td width="22%" background="images/admin_bg_1.gif">前台现付价</td>
      <td width="12%" background="images/admin_bg_1.gif">网上支付价</td>
      <td width="13%" background="images/admin_bg_1.gif">支付方式</td>
      <td width="12%" background="images/admin_bg_1.gif">
      <p align="center">首日房态</td>
    </tr>
    <%if not rsroom.eof then
      do while not rsroom.eof%>
    <tr>
      <td width="23%" height="14"><%=rsroom("type")%></td>
      <td width="7%" height="14">
        <p align="center"><%=rsroom("breakfast")%></td>
      <td width="11%" height="14">RMB <%=rsroom("marketprice")%></td>
      <td height="14">RMB <%=rsroom("stageprice")%></td>
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