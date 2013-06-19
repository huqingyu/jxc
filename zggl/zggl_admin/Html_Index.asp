<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
if request("index_mb")<>"" then
Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set fout = fso.CreateTextFile(server.mappath("../Default.htm"))
fout.Write request("index_mb")
fout.close
set fout=nothing
set fso=nothing
mskrindex="ok"
end if
%>
<% if mskrindex="ok" then %>
<br /><br /><br /><p align="center"><b><font color="#FF0000">恭喜你,成功生成首页!</font>[<a target="_blank" href="../Default.htm">../Default.htm</a>]</b>
<% else %>
<br />
<br />
<form name=pwd method="post" action="html_index.asp">
<table width="73%" height="251"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><textarea rows="35" name="index_mb" cols="88"><!--#include file="system/default_asp.asp"--></textarea></td>
  </tr>
<tr>
<td>
<div align="center"><br />
<input name="change" class=buttonface value="确认生成首页文件" type='submit'>     
&nbsp;&nbsp;
<input type="reset" value="还原" name="B2">
</div></td></tr>
</table>
</form>
<% End If %>
</body></html>