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
'�������Ƿ�֧��
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

'�������汾
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>��̨���� - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<table width="90%" height="293" border="0" align="center" cellpadding="0" cellspacing="1" class="tableBorder">
  <tr>
    <td colspan="2" align="center" background="images/admin_bg_1.gif" height="30"><b><font class="STYLE1">��������Ϣͳ��</font></b></td>
  </tr>

  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;���������ͣ�<font face="Verdana"><%=Request.ServerVariables("OS")%> ��IP��</font><%=Request.ServerVariables("LOCAL_ADDR")%>��</td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(9)
      If Not IsObjInstalled(theInstalledObjects(9)) Then 
        Response.Write "<font color=red><b> ��</b></font>"
      Else
        Response.Write getver(theInstalledObjects(9)) & "<font color=#888888>(FSO �ı��ļ���д)</b><font color=green><b> ��</b></font> "
      End If
      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;���ط���������������DNS������IP��ַ��<%=Request.ServerVariables("SERVER_NAME")%></td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(10)
   	  Response.Write "<font color=#888888>(ACCESS ���ݿ�)</font>"
      If Not IsObjInstalled(theInstalledObjects(10)) Then 
        Response.Write "<font color=red><b> ��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(10))
      End If
      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(16)
		Response.Write "<font color=#888888>(w3 Jmail �շ���)</font>"

      If Not IsObjInstalled(theInstalledObjects(16)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(16))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;�ű���ʱʱ�䣺<%=Server.ScriptTimeout%> ��</td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(17)
	  Response.Write "<font color=#888888>(WIN����SMTP ����)</font>"

      If Not IsObjInstalled(theInstalledObjects(17)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(17))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;�������˿ڣ�<%=Request.ServerVariables("SERVER_PORT")%></td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(18)
	  Response.Write "<font color=#888888>(ASPemail ����)</font>"

      If Not IsObjInstalled(theInstalledObjects(18)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(18))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;վ������·����<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(19)
	  Response.Write "<font color=#888888>(ASPemail ����)</font>"

      If Not IsObjInstalled(theInstalledObjects(19)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(19))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;������IIS�汾��<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(20)
	  Response.Write "<font color=#888888>(dkQmail ����)</font>"

      If Not IsObjInstalled(theInstalledObjects(20)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(20))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="29" bgcolor="#ECF9FF">&nbsp;������CPU������<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ��</td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
    <%
      Response.Write theInstalledObjects(21)
	  Response.Write "<font color=#888888>(Geocel ����)</font>"

      If Not IsObjInstalled(theInstalledObjects(21)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(21))
      End If

      Response.Write vbCrLf
%></td>
  </tr>
  <tr bgcolor="#E8F1FF">
    <td width="50%" height="30" bgcolor="#ECF9FF">&nbsp;������ʱ�䣺<%=now%></td>
    <td width="50%" bgcolor="#ECF9FF">&nbsp;
<%
      Response.Write theInstalledObjects(22)
	  Response.Write "<font color=#888888>(IISemail ����)</font>"

      If Not IsObjInstalled(theInstalledObjects(22)) Then 
        Response.Write "&nbsp;<font color=red><b>��</b></font>"
      Else
        Response.Write "&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(22))
      End If

      Response.Write vbCrLf
%>
    </td>
  </tr>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td height="29" align="center" background="images/admin_bg_1.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="45" align="center" bgcolor="#ECF9FF"><a href="http://seirsoft.com" target="_blank">seirsoft.com</a> ��Ȩ����<br />
    <span style="font:11px">Copyright &copy; 2012 By seirsoft.com, All Rights Reserved</span></td>
  </tr>
</table>
</body>
</html>
