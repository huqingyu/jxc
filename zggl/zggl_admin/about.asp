<!--#include file="admin_common/conn.asp"-->
<% 
if request("w")="qq" then 
id=request("id")
nr=request("nr")
set rs= Server.CreateObject("adodb.recordset")
sql="select * from about where id="&id
rs.open sql,conn,1,3
rs("nr")=nr
rs.update
%>
<script>
alert("<%= request("bt") %>!修改成功！")
window.location="about.asp?id=<%= id %>"
</script>
<%
else 
id=request("id")
set rs= Server.CreateObject("adodb.recordset")
sql="select * from about where id="&id
rs.open sql,conn,1,3
end if 
  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<form id="form1" name="form1" method="post" action="about.asp?w=qq">
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#5580D5">
    <tr>
      <td height="28" align="center" background="images/admin_bg_1.gif"><b><font class="STYLE1"><%=rs("bt")%>-修改
        <input name="bt" type="hidden"  value="<%=rs("bt")%>" id="bt" />
      </font></b></td>
    </tr>
    <tr>
      <td height="327" align="center">
	  <textarea id="nr" name="nr" style="display:none"><%=rs("nr")%></textarea>
      <iframe id="xWebEditor1" src="ubb/xwebeditor.asp?id=nr&amp;style=standard_coolblue1" frameborder="0" scrolling="No" width="800" height="500"></iframe>
      
      <input name="id" type="hidden" id="id" value="<%=rs("id")%>" /></td>
    </tr>
    <tr>
      <td align="center"><input type="submit" name="Submit" value="保  存" />
      &nbsp;&nbsp;&nbsp;  <input type="reset" name="Submit2" value="重  置" /></td>
    </tr>
  </table>
</form>
</body>
</html>
