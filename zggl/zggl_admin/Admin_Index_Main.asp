<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>创业中国源码论坛 599CN.COM</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
<table cellpadding="2" cellspacing="1" border="0" width="100%" class="border" align=center>
<tr align="center">
    <td width="776" height=25 colspan=2 class="topbg">    
</tr>
</table>
<%

Dim theInstalledObjects(24)
    theInstalledObjects(9) = "Scripting.FileSystemObject"
    theInstalledObjects(10) = "adodb.connection"
    theInstalledObjects(16) = "JMail.SmtpMail"
    theInstalledObjects(17) = "CDONTS.NewMail"
    theInstalledObjects(18) = "Persits.MailSender"
    theInstalledObjects(19) = "SMTPsvg.Mailer"
    theInstalledObjects(20) = "DkQmail.Qmail"
    theInstalledObjects(21) = "Geocel.Mailer"
    theInstalledObjects(22) = "IISmail.Iismail.1"
'检查组件是否被支持
Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function

'检查组件版本
Function getver(Classstr)
On Error Resume Next
getver=""
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(Classstr)
If 0 = Err Then getver=xtestobj.version
Set xTestObj = Nothing
Err = 0
End Function
%>
<table width="90%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr>
    <td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b>服务器信息统计</b></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;服务器类型：<font face="Verdana"><%=Request.ServerVariables("OS")%> （IP：</font><%=Request.ServerVariables("LOCAL_ADDR")%>）</td>
    <td width="50%"> &nbsp;
        <%
      Response.Write theInstalledObjects(9)
      If Not IsObjInstalled(theInstalledObjects(9)) Then 
        Response.Write "<font color=red><b> ×</b></font>"
      Else
        Response.Write getver(theInstalledObjects(9)) & "<font color=#888888>(FSO 文本文件读写)</b><font color=green><b> √</b></font> "
      End If
      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;返回服务器的主机名、DNS别名或IP地址：<%=Request.ServerVariables("SERVER_NAME")%></td>
    <td width="50%"> &nbsp;
        <%
      Response.Write theInstalledObjects(10)
   	  Response.Write "<font color=#888888>(ACCESS 数据库)</font>"
      If Not IsObjInstalled(theInstalledObjects(10)) Then 
        Response.Write "<font color=red><b> ×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(10))
      End If
      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
    <td width="50%"> &nbsp;
        <%
      Response.Write theInstalledObjects(16)
		Response.Write "<font color=#888888>(w3 Jmail 收发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(16)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(16))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;脚本超时时间：<%=Server.ScriptTimeout%> 秒</td>
    <td width="50%">&nbsp;
        <%
      Response.Write theInstalledObjects(17)
	  Response.Write "<font color=#888888>(WIN虚拟SMTP 发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(17)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(17))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;服务器端口：<%=Request.ServerVariables("SERVER_PORT")%></td>
    <td width="50%">&nbsp;
        <%
      Response.Write theInstalledObjects(18)
	  Response.Write "<font color=#888888>(ASPemail 发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(18)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(18))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;站点物理路径：<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
    <td width="50%">&nbsp;
        <%
      Response.Write theInstalledObjects(19)
	  Response.Write "<font color=#888888>(ASPemail 发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(19)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(19))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;服务器IIS版本：<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
    <td width="50%">&nbsp;
        <%
      Response.Write theInstalledObjects(20)
	  Response.Write "<font color=#888888>(dkQmail 发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(20)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(20))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;服务器CPU个数：<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
    <td width="50%">&nbsp;
        <%
      Response.Write theInstalledObjects(21)
	  Response.Write "<font color=#888888>(Geocel 发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(21)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(21))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr>
    <td width="50%">&nbsp;服务器时间：<%=now%></td>
    <td width="50%">&nbsp;
        <%
      Response.Write theInstalledObjects(22)
	  Response.Write "<font color=#888888>(IISemail 发信)</font>"

      If Not IsObjInstalled(theInstalledObjects(22)) Then 
        Response.Write "&nbsp;<font color=red><b>×</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(22))
      End If

      Response.Write vbCrLf
%>
    </td>
  </tr>
</table><br />
<table width="90%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr>
    <td height="30" align="center" background="images/admin_bg_1.gif"><b>搜 索 用 户</b></td>
  </tr>
  <tr>
    <td height="50">
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <form name="form2" method="post" action="manageuser.asp?action=select">
            <td>
              <input name="namekey" type="text" id="namekey" onFocus="this.value=''" value="请输入关键字">
              <input name="checkbox" type="checkbox" id="checkbox" value="1" checked>
              模糊查询&nbsp;&nbsp;&nbsp;
              <input type="submit" name="Submit2" value=" 开始查询 ">
            </td>
          </form>
        </tr>
    </table></td>
  </tr>
</table>
<table width="100%" height="35"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td><br /><script src="http://www.599cn.com/Dv_News.asp?GetName=besttopic"></script>
  </tr>
</table>
</body>
</html>