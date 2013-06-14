
<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from sum"
rs.Open sql,conn,1,2
%>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr bgcolor="#AE5700">
    <td height="29" colspan="6" align="center"><font color="#FFFFFF">ืÜทรฮส </font></td>
    <td width="75%" height="29" colspan="6">&nbsp;&nbsp; <font color="#FFFFFF"><%=rs("sum")%></font></td>
  </tr>
</table>
