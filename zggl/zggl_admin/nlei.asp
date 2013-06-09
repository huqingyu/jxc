<!--#include file="admin_common/conn.asp"-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>

<body>
<% if request("wang")="nlei" then  %>
<form id="form1" name="form1" method="post" action="nlei.asp?wang=add">
  <table width="54%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#aaccff">
    <tr>
      <td height="28" colspan="2" align="center" background="images/admin_bg_1.gif"><strong><font color="#FFF">文章分类添加</font></strong></td>
    </tr>
    <tr>
      <td width="20%" height="33" align="center">分类名称</td>
      <td width="80%"> &nbsp;
      <input name="nlei" type="text" id="nlei" size="40" /></td>
    </tr>
    <tr>
      <td height="28" colspan="2" align="center"><input type="submit" name="Submit" value="提交" />
      &nbsp;&nbsp;  <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>
<% End If %>
<% if request("wang")="add" then 
nlei=request("nlei")
set rs= Server.CreateObject("adodb.recordset") 
sql="select * from nlei "
rs.open sql,conn,1,3
rs.addnew
rs("nlei")=nlei
rs.update
response.Redirect("nlei.asp?wang=up")
end if 
 %>
 <% if request("wang")="up" then  %>
<table width="57%" height="59" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#aaccff">
  <tr>
    <td height="28" colspan="4" align="center" background="images/admin_bg_1.gif"><strong><font color="#FFF">文章分类修改</font></strong></td>
  </tr>
  <% set rs= Server.CreateObject("adodb.recordset") 
sql="select * from nlei "
rs.open sql,conn,1,3
while not rs.eof 
 %>
 <form id="form1" name="form1" method="post" action="nlei.asp?wang=save">
  <tr>
    <td width="10%" align="center"><%=rs("id")%></td>
    <td width="64%" height="28" align="center"><input name="nlei" type="text" id="nlei" value="<%=rs("nlei")%>" size="35" />
      <input name="id" type="hidden" id="id" value="<%=rs("id")%>" /></td>
    <td width="13%" align="center"><input type="submit" name="Submit3" value="修改" /></td>
    <td width="13%" align="center"><input type="button" name="Submit4"  onclick="window.location='nlei.asp?del=<%=rs("id")%>'"  value="删除" /></td>
  </tr></form>
  <% rs.movenext 
  
  wend  %>
  
</table>
<% End If %>
 <% if request("wang")="save" then 
 id=request("id")
 nlei=request("nlei")
 set rs= Server.CreateObject("adodb.recordset") 
sql="select * from nlei  where id="&id
rs.open sql,conn,1,3
rs("nlei")=nlei
rs.update
response.Redirect("nlei.asp?wang=up")
 
 end if 
  %>
  <% if request("del")<>"" then 
  id=request("del")
  conn.execute("delete from nlei where id="&id)

  response.Redirect("nlei.asp?wang=up")
  end if %>
</body>
</html>
