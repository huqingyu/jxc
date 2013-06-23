<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title>宾馆查询结果--全部房型</title>
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
  	response.write "<script language=JavaScript>{window.alert(' 您现在的位置: 您现在的位置:返回重新查找!');window.history.go(-1);}</script>"
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
		  	response.write "<script language=JavaScript>{window.alert(' 您现在的位置: 您现在的位置:返回重新查找!');window.history.go(-1);}</script>"
 		  	response.end
	end if
  if not rsroom.eof then
  %>
  <strong><font color="#FF0000" size="+1" ><%=rs("c_name")%>所有房型</font></strong>
  <table width="90%" border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <tr>
      <td width="23%" height="25" background="images/topBar_bg.gif">房型</td>
      <td width="7%" background="images/topBar_bg.gif">
      <p align="center">早餐</td>
      <td width="11%" background="images/topBar_bg.gif">门市价</td>
      <td width="22%" colspan="2" background="images/topBar_bg.gif">前台现付价</td>
      <td width="12%" background="images/topBar_bg.gif">团队支付价</td>
      <td width="13%" background="images/topBar_bg.gif">支付方式</td>
      <td width="12%" background="images/topBar_bg.gif">
      <p align="center">首日房态</td>
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
        <p align="center"> <a href="UserInfo/login.asp?hotelid=<%=rs("id")%>&roomid=<%=rsroom("id")%>" target=_blank><font color="#FF0000">预订</font></a></td>
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