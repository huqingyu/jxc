<%
If Session("admin")="" then
	Response.end
end if
%>
<!--#include file="admin_common/conn.asp"-->
<%
sql="select top 20 * from comments order by id desc"

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1

%>
<!DOCTYPE HTML>
<html>
<head>
<title>�ջ��ͨ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
<!--
body{width:95%;}
.style1 {	color: #FFFFFF;
	font-size: 16px;
}
.style7 {color: #FF0000}
-->
</style>
</head>
<body>
<table width="700" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#315F9D" class="css">
  <tr>
    <td height="30" colspan="5"><div align="center" class="style1">�鿴�����</div></td>
  </tr>
<%
if rs.bof and rs.eof then
else
while not rs.eof
%>
<tr class="css">
<td colspan="5" align="left" bgcolor="#92BCF8" class="c">
<div align="left">
<table width="94%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#315F9D" class="css">
	<tr>
	  <td height="30" colspan="5">
	  <div align="center" class="style1">����ʱ��:<%=CDate(rs("cdate"))%></div></td>
	</tr>
	<tr align="center" class="css">
	  <td width="25%" height="30" align="right" bgcolor="#92BCF8">������У�</td>
	  <td width="25%" align="left" bgcolor="#FFFFFF"><%= rs("city") %><span class="style7"> </span></td>
	  <td colspan="2" align="right" bgcolor="#92BCF8">������������</td>
	  <td width="25%" align="left" bgcolor="#FFFFFF"><%= rs("name") %>
		  <span class="style7"> </span></td>
	</tr>
	<tr class="css">
	  <td align="right" bgcolor="#92BCF8">�����ȣ�</td>
	  <td align="left" bgcolor="#FFFFFF"><%= rs("credit") %><span class="style7"> </span></td>
	  <td colspan="2" align="right" bgcolor="#92BCF8">�Ա�</td>
	  <td align="left" bgcolor="#FFFFFF"><%= rs("gender") %><span class="style7"> </span></td>
	</tr>
	<tr class="css">
	  <td align="right" bgcolor="#92BCF8">�ֻ����룺</td>
	  <td align="left" bgcolor="#FFFFFF"><%= rs("tel") %><span class="style7"> </span></td>
	  <td colspan="2" align="right" bgcolor="#92BCF8">�������䣺</td>
	  <td align="left" bgcolor="#FFFFFF"><%= rs("email") %><span class="style7"> </span></td>
	</tr>
	<tr class="css">
	  <td align="right" bgcolor="#92BCF8">ÿ�����룺</td>
	  <td align="left" bgcolor="#FFFFFF"><%= rs("income") %><span class="style7"> </span></td>
	  <td colspan="2" align="right" bgcolor="#92BCF8">&nbsp;</td>
	  <td align="left" bgcolor="#FFFFFF">&nbsp;</td>
	</tr>
</table>
</div>
</td>
</tr>
<%
rs.movenext
wend
end if
%>
</table>
</body>
</html>
