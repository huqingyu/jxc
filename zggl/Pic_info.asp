<!--#include file="common/conn.asp"-->
<!--#include file="admin/system/WebConfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>-Õº∆¨–≈œ¢</title>
</head>
<!--#include file="admin/system/system_code.asp" -->
<TABLE border=0 align="center" cellPadding=0 cellSpacing=0>

        <tr> 
          <td><table border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#AFD2A1" borderColorDark=#ffffff bgcolor="#FFFFFF">
            <tr>
              <td height="35" background="Images/ly6_3.gif"><center>
                  <%
id=Trim(request("id"))
set rs=server.createobject("adodb.recordset")
sql="select name,pic_url,info,Tuijiang from pic where id ="&id&""
rs.open sql, conn, 1, 1
if not rs.eof then
response.write (rs("name"))
if rs("Tuijiang")=1 Then response.write ("<font color=red>&nbsp;ºˆ</font>") end if
%>
              </center></td>
            </tr>
            <tr>
              <td><table width=100%  border=0 cellspacing=0 cellpadding=0>
                  <tr>
                    <td><div align="center"><a href="admin/<%=rs("pic_url")%>"><img src="admin/<%=rs("pic_url")%>" border="0"></a></div></td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td height="30" background="Images/topBar_bg.gif">&nbsp;Õº∆¨ΩÈ…‹</td>
            </tr>
            <tr>
              <td height="130"><table width="693" height="118" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="693" height="118"><%=rs("info")%> </td>
                  </tr>
              </table></td>
            </tr>
            <%
end if
rs.close      
set rs=nothing      
%>
          </table></td>
</tr></TABLE>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>
</BODY>
</HTML>
