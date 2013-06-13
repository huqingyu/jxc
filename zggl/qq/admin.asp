<%@LANGUAGE="VBSCRIPT" CodePage="936"%>
<%
'hncits.org
Option Explicit
response.Buffer = True
Server.scriptTimeout = "20"
On Error Resume Next
Const mpassword = "123456789"
Dim starttime: starttime = Timer()
Dim Jurl: Jurl = Left(request.ServerVariables("URL"), InStrRev(request.ServerVariables("URL"), "/") - 1)

Function leftshow(ByVal str, ByVal leftc)
  If Len(str) >= leftc Then
    leftshow = Left(str, leftc) & ".."
  Else
    leftshow = str
  End If
End Function

Function htmlencode(ByVal reString)
  Dim str
  str = reString
  str = Replace(str, "&", "&amp;")
  str = Replace(str, ">", "&gt;")
  str = Replace(str, "<", "&lt;")
  htmlencode = str
End Function

Sub client_alert(ByVal str, ByVal stype)
  response.Clear
  response.write "<html>" & vbCrLf
  response.write "<head>" & vbCrLf
  response.write "<meta http-equiv=""content-type"" content=""text/html; charset=gb2312"">" & vbCrLf
  response.write "<title>网站QQ在线咨询-提示信息</title>" & vbCrLf
  response.write "</head>" & vbCrLf
  response.write "<body>" & vbCrLf
  response.write "<script language=""javascript"">" & vbCrLf
  response.write "alert(""" & str & """)" & vbCrLf
  If IsNumeric(stype) Then
    response.write "history.go(" & stype & ")" & vbCrLf
  Else
    response.write "location.href=""" & stype & """" & vbCrLf
  End If
  response.write "</script>" & vbCrLf
  response.write "</body>" & vbCrLf
  response.write "</html>" & vbCrLf
  response.End
End Sub

Sub client_confirm(ByVal str, ByVal funy, ByVal funn)
  response.Clear
  response.write "<html>" & vbCrLf
  response.write "<head>" & vbCrLf
  response.write "<meta http-equiv=""content-type"" content=""text/html; charset=gb2312"">" & vbCrLf
  response.write "<title>网站QQ在线咨询-提示信息</title>" & vbCrLf
  response.write "</head>" & vbCrLf
  response.write "<body>" & vbCrLf
  response.write "<script language=""javascript"">" & vbCrLf
  response.write "if(confirm(""" & str & """))" & vbCrLf
  If IsNumeric(funy) Then
    response.write "history.go(" & funy & ")" & vbCrLf
  Else
    response.write "location.href=""" & funy & """" & vbCrLf
  End If
  response.write "else" & vbCrLf
  If IsNumeric(funn) Then
    response.write "history.go(" & funn & ")" & vbCrLf
  Else
    response.write "location.href=""" & funn & """" & vbCrLf
  End If
  response.write "</script>" & vbCrLf
  response.write "</body>" & vbCrLf
  response.write "</html>" & vbCrLf
  response.End
End Sub

Sub cklogin()
  If Not request.cookies("jqqonline")("password") = mpassword Then
    response.Clear
    response.write "Error !!"
    response.End
  End If
End Sub

Sub login()
  If request.cookies("jqqonline")("error") = "2" Then
    Call client_alert("您已经输入了两次错误的密码\n\n请关闭浏览器以后重新尝试!", -1)
  End If
  If request.Form("password") = mpassword Then
    response.cookies("jqqonline")("password") = request.Form("password")
    response.redirect "?type=manage"
  Else
    If request.cookies("jqqonline")("error") = "" Then
      response.cookies("jqqonline")("error") = "1"
    Else
      response.cookies("jqqonline")("error") = "2"
    End If
    Call client_alert("您输入了错误的密码!", -1)
  End If
  response.End
End Sub

Sub editsiteinfo()
  Dim infostrSourceFile, infoobjXML
  infostrSourceFile = Server.MapPath("xml/info.xml")
  Set infoobjXML = Server.CreateObject("Microsoft.XMLDOM")
  infoobjXML.Load (infostrSourceFile)
  Dim infoobjNodes
  Set infoobjNodes = infoobjXML.selectSingleNode("xml/qqinfo/qqset[siteid ='1']")
  If Not IsNull(infoobjNodes) Then
    infoobjNodes.childNodes(0).Text = htmlencode(request.Form("sitename"))
    infoobjNodes.childNodes(1).Text = htmlencode(request.Form("siteskin"))
    infoobjNodes.childNodes(2).Text = htmlencode(request.Form("siteshowx"))
    infoobjNodes.childNodes(3).Text = htmlencode(request.Form("siteshowy"))
    infoobjNodes.childNodes(4).Text = htmlencode(request.Form("sitearea"))
    infoobjXML.save (infostrSourceFile)
    Set infoobjNodes = Nothing
    Set infoobjXML = Nothing
    Call client_alert("参数修改成功!", "?type=manage")
  Else
    Call client_alert("Xml文件 未成功打开!", -1)
  End If
End Sub

Sub addinfo()
  If Trim(request.Form("qq")) = "" Or Trim(request.Form("dis")) = "" Or Trim(request.Form("face")) = "" Then
    Call client_alert("您并没有填入必要的数据!", -1)
  End If
  Dim jtb_color
  If Trim(request.Form("color")) = "" Then
    jtb_color = "#000000"
  Else
    jtb_color = htmlencode(request.Form("color"))
  End If
  Dim strSourceFile, objXML, oListNode, oDetailsNode, AllNodesNum
  strSourceFile = Server.MapPath("xml/qq.xml")
  Set objXML = Server.CreateObject("Microsoft.XMLDOM")
  objXML.Load (strSourceFile)
  Dim objRootlist
  Set objRootlist = objXML.documentElement.selectSingleNode("qqlist")
  Dim id
  If objRootlist.hasChildNodes Then
    id = objRootlist.lastChild.lastChild.Text + 1
  Else
    id = 1
  End If
  Set objRootlist = Nothing
  Set oListNode = objXML.documentElement.selectSingleNode("qqlist").appendChild(objXML.createElement("qq"))
  Set oDetailsNode = oListNode.appendChild(objXML.createElement("qid"))
  oDetailsNode.Text = htmlencode(request.Form("qq"))
  Set oDetailsNode = oListNode.appendChild(objXML.createElement("dis"))
  oDetailsNode.Text = htmlencode(request.Form("dis"))
  Set oDetailsNode = oListNode.appendChild(objXML.createElement("face"))
  oDetailsNode.Text = htmlencode(request.Form("face"))
  Set oDetailsNode = oListNode.appendChild(objXML.createElement("color"))
  oDetailsNode.Text = jtb_color
  Set oDetailsNode = oListNode.appendChild(objXML.createElement("id"))
  oDetailsNode.Text = id
  objXML.save (strSourceFile)
  Set objRootlist = Nothing
  Set oListNode = Nothing
  Set oDetailsNode = Nothing
  Set objXML = Nothing
  Call client_alert("添加新的QQ号成功!", "?type=manage")
End Sub

Sub editinfo()
  Dim editid: editid = request.querystring("id")
  If Not IsNumeric(editid) Or editid = "" Then
    Call client_alert("ID号必须为数字!", -1)
  Else
    editid = CLng(editid)
  End If
  If Trim(request.Form("qq")) = "" Or Trim(request.Form("dis")) = "" Or Trim(request.Form("face")) = "" Then
    Call client_alert("没有添入必要的数据!", -1)
  End If
  Dim strSourceFile, objXML
  strSourceFile = Server.MapPath("xml/qq.xml")
  Set objXML = Server.CreateObject("Microsoft.XMLDOM")
  objXML.Load (strSourceFile)
  Dim objNodes
  Set objNodes = objXML.selectSingleNode("xml/qqlist/qq[id ='" & editid & "']")
  If Not IsNull(objNodes) Then
    objNodes.childNodes(0).Text = htmlencode(request.Form("qq"))
    objNodes.childNodes(1).Text = htmlencode(request.Form("dis"))
    objNodes.childNodes(2).Text = htmlencode(request.Form("face"))
    objNodes.childNodes(3).Text = htmlencode(request.Form("color"))
    objXML.save (strSourceFile)
    Set objNodes = Nothing
    Set objXML = Nothing
    Call client_alert("修改成功!", "?type=manage")
  Else
    Call client_alert("修改失败!", "?type=manage")
  End If
End Sub

Sub delinfo()
  Dim delid
  delid = request.querystring("id")
  If Not IsNumeric(delid) Or delid = "" Then
    Call client_alert("ID号必须为数字!", "?type=manage")
  Else
    delid = CLng(delid)
  End If
  Dim strSourceFile, objXML
  strSourceFile = Server.MapPath("xml/qq.xml")
  Set objXML = Server.CreateObject("Microsoft.XMLDOM")
  objXML.Load (strSourceFile)
  Dim objNodes
  Set objNodes = objXML.selectSingleNode("xml/qqlist/qq[id ='" & delid & "']")
  If Not IsNull(objNodes) Then
    If request.querystring("yn") = "" Then
      Call client_confirm("确认要删除[" & objNodes.childNodes(0).Text & "]的信息吗?", "?type=manage&act=delete&id=" & delid & "&yn=1", -1)
    Else
      objNodes.parentNode.removeChild (objNodes)
      objXML.save (strSourceFile)
      Call client_alert("删除成功!", "?type=manage")
    End If
  Else
  Call client_alert("没有找到指定的条目!", "?type=manage")
  End If
  Set objNodes = Nothing
  Set objXML = Nothing
  response.End
End Sub

Sub fso_write(ByVal fpath, ByVal ftext)
  On Error Resume Next
  Dim fso, fout
  Set fso = Server.CreateObject("Scripting.FileSystemObject")
  Set fout = fso.CreateTextFile(Server.MapPath(fpath))
  fout.write ftext
  fout.Close
  Set fout = Nothing
  Set fso = Nothing
  If Err Then
    Call client_alert("创建文件失败,可能是您的服务器不支持FSO权限而导致的!", "?type=manage")
  End If
End Sub

Sub create_js()
  Dim tmpstr
  tmpstr = ""
  tmpstr = tmpstr & "var online=new Array();" & vbCrLf
  tmpstr = tmpstr & "if (!document.layers)" & vbCrLf
  tmpstr = tmpstr & "document.write('<div id=divStayTopLeft style=position:absolute>');" & vbCrLf
  Call fso_write("top.js", tmpstr)
  Dim strSourceFile, objXML, objRootsite, AllNodesNum
  strSourceFile = Server.MapPath("xml/info.xml")
  Set objXML = Server.CreateObject("Microsoft.XMLDOM")
  objXML.Load (strSourceFile)
  Set objRootsite = objXML.documentElement.selectSingleNode("qqinfo")
  Dim Sitename, Siteskin
  Sitename = objRootsite.childNodes.Item(0).childNodes.Item(0).Text
  Siteskin = objRootsite.childNodes.Item(0).childNodes.Item(1).Text
  Dim startX, startY, sarea
  startX = objRootsite.childNodes.Item(0).childNodes.Item(2).Text
  startY = objRootsite.childNodes.Item(0).childNodes.Item(3).Text
  sarea = objRootsite.childNodes.Item(0).childNodes.Item(4).Text
  If sarea = "1" Then
    If IsNumeric(startX) Then
      startX = CInt(startX) + 135
      startX = "screen.width-" & CStr(startX)
    End If
  End If
  Set objRootsite = Nothing
  Set objXML = Nothing
  strSourceFile = Server.MapPath("xml/qq.xml")
  Set objXML = Server.CreateObject("Microsoft.FreeThreadedXMLDOM")
  objXML.Load (strSourceFile)
  Set objRootsite = objXML.documentElement.selectSingleNode("qqlist")
  AllNodesNum = objRootsite.childNodes.length - 1
  Dim iCount, iqCount, Qqnum
  For iqCount = 0 To AllNodesNum
    Qqnum = Qqnum & objRootsite.childNodes.Item(iqCount).childNodes.Item(0).Text & ":"
  Next
  tmpstr = ""
  tmpstr = tmpstr & "document.write('<script language=""javascript"" src=""" & Jurl & "/top.js""></script>');" & vbCrLf
  tmpstr = tmpstr & "document.write('<script language=""javascript"" src=""http://webpresence.qq.com/getonline?Type=1&" & Qqnum & """></script>');" & vbCrLf
  tmpstr = tmpstr & "document.write('<script language=""javascript"" src=""" & Jurl & "/bottom.js""></script>');" & vbCrLf
  Call fso_write("jqqonline.js", tmpstr)
  tmpstr = ""
  tmpstr = tmpstr & "document.write('<table cellSpacing=""0"" cellPadding=""0"" width=""110"" border=""0"" id=""qqtab"">');" & vbCrLf
  tmpstr = tmpstr & "document.write('    <tr>');" & vbCrLf
  tmpstr = tmpstr & "document.write('      <td width=""110"" onclick=""if(document.all.qqtab.style.display==\'none\'){document.all.qqtab.style.display=\'\'} else {document.all.qqtab.style.display=\'none\'}""><img src=""" & Jurl & "/images/qq/skin/" & Siteskin & "/top.gif"" border=""0""></td>');" & vbCrLf
  tmpstr = tmpstr & "document.write('    </tr>');" & vbCrLf
  tmpstr = tmpstr & "document.write('    <tr id=""qqstab"">');" & vbCrLf
  tmpstr = tmpstr & "document.write('      <td valign=""middle"" align=""center"" background=""" & Jurl & "/images/qq/skin/" & Siteskin & "/middle.gif"">');" & vbCrLf
  tmpstr = tmpstr & "document.write('<table border=""0"" width=""80"" cellSpacing=""0"" cellPadding=""0"">');" & vbCrLf
  tmpstr = tmpstr & "document.write('  <tr>');" & vbCrLf
  tmpstr = tmpstr & "document.write('    <td width=""80"" height=""5"" border=""0"" colspan=""2""></td>');" & vbCrLf
  tmpstr = tmpstr & "document.write('  </tr>');" & vbCrLf
  For iCount = 0 To AllNodesNum
    tmpstr = tmpstr & "document.write('  <tr>');" & vbCrLf
    tmpstr = tmpstr & "if (online[" & iCount & "]==0)" & vbCrLf
    tmpstr = tmpstr & "  {" & vbCrLf
    tmpstr = tmpstr & "    document.write('    <td width=""25"" height=""22"" valign=""middle"" align=""center"">');" & vbCrLf
    tmpstr = tmpstr & "    document.write('<img src=""" & Jurl & "/images/qqface/" & objRootsite.childNodes.Item(iCount).childNodes.Item(2).Text & "_f.gif"" border=""0"">');" & vbCrLf
    tmpstr = tmpstr & "    document.write('    </td>');" & vbCrLf
    tmpstr = tmpstr & "    document.write('    <td width=""55"" height=""22"" valign=""middle"" align=""left"">');" & vbCrLf
    tmpstr = tmpstr & "    document.write('<a href=""http://wpa.qq.com/msgrd?V=1&amp;Uin=" & objRootsite.childNodes.Item(iCount).childNodes.Item(0).Text & "&amp;Site=" & Sitename & "&amp;Menu=yes"" target=""blank""><font style=""font-size:12px;TEXT-DECORATION:none;color:" & objRootsite.childNodes.Item(iCount).childNodes.Item(3).Text & ";"">" & objRootsite.childNodes.Item(iCount).childNodes.Item(1).Text & "</font></a><br>');" & vbCrLf
    tmpstr = tmpstr & "    document.write('    </td>');" & vbCrLf
    tmpstr = tmpstr & "  }" & vbCrLf
    tmpstr = tmpstr & "else" & vbCrLf
    tmpstr = tmpstr & "  {" & vbCrLf
    tmpstr = tmpstr & "    document.write('    <td width=""25"" height=""22"" valign=""middle"" align=""center"">');" & vbCrLf
    tmpstr = tmpstr & "    document.write('<img src=""" & Jurl & "/images/qqface/" & objRootsite.childNodes.Item(iCount).childNodes.Item(2).Text & "_m.gif"" border=""0"">');" & vbCrLf
    tmpstr = tmpstr & "    document.write('    </td>');" & vbCrLf
    tmpstr = tmpstr & "    document.write('    <td width=""55"" height=""22"" valign=""middle"" align=""left"">');" & vbCrLf
    tmpstr = tmpstr & "    document.write('<a href=""http://wpa.qq.com/msgrd?V=1&amp;Uin=" & objRootsite.childNodes.Item(iCount).childNodes.Item(0).Text & "&amp;Site=" & Sitename & "&amp;Menu=yes"" target=""blank""><font style=""font-size:12px;TEXT-DECORATION:none;color:" & objRootsite.childNodes.Item(iCount).childNodes.Item(3).Text & ";"">" & objRootsite.childNodes.Item(iCount).childNodes.Item(1).Text & "</font></a><br>');" & vbCrLf
    tmpstr = tmpstr & "    document.write('    </td>');" & vbCrLf
    tmpstr = tmpstr & "  }" & vbCrLf
    tmpstr = tmpstr & "document.write('  </tr>');" & vbCrLf
  Next
  Set objRootsite = Nothing
  Set objXML = Nothing
  tmpstr = tmpstr & "document.write('</table>');" & vbCrLf
  tmpstr = tmpstr & "document.write('</td>');" & vbCrLf
  tmpstr = tmpstr & "document.write('    </tr>');" & vbCrLf
  tmpstr = tmpstr & "document.write('    <tr>');" & vbCrLf
  tmpstr = tmpstr & "document.write('      <td width=""110"" onclick=""if(document.all.qqstab.style.display==\'none\'){document.all.qqstab.style.display=\'\'} else {document.all.qqstab.style.display=\'none\'}""><img src=""" & Jurl & "/images/qq/skin/" & Siteskin & "/bottom.gif"" border=""0""></td>');" & vbCrLf
  tmpstr = tmpstr & "document.write('    </tr>');" & vbCrLf
  tmpstr = tmpstr & "document.write('</table>');" & vbCrLf
  tmpstr = tmpstr & "var verticalpos=""frombottom""" & vbCrLf
  tmpstr = tmpstr & "if (!document.layers)" & vbCrLf
  tmpstr = tmpstr & "document.write('</div>')" & vbCrLf
  tmpstr = tmpstr & "function JSFX_FloatTopDiv()" & vbCrLf
  tmpstr = tmpstr & "{" & vbCrLf
  tmpstr = tmpstr & "  var jqq_startX = " & startX & ";" & vbCrLf
  tmpstr = tmpstr & "  var jqq_startY = " & startY & ";" & vbCrLf
  tmpstr = tmpstr & "  var jqq_ns = (navigator.appName.indexOf(""Netscape"") != -1);" & vbCrLf
  tmpstr = tmpstr & "  var jqq_d = document;" & vbCrLf
  tmpstr = tmpstr & "  function jqq_ml(id)" & vbCrLf
  tmpstr = tmpstr & "  {" & vbCrLf
  tmpstr = tmpstr & "    var jqq_el=jqq_d.getElementById?jqq_d.getElementById(id):jqq_d.all?jqq_d.all[id]:jqq_d.layers[id];" & vbCrLf
  tmpstr = tmpstr & "    if(jqq_d.layers)jqq_el.style=jqq_el;" & vbCrLf
  tmpstr = tmpstr & "    jqq_el.sP=function(x,y){this.style.left=x;this.style.top=y;};" & vbCrLf
  tmpstr = tmpstr & "    jqq_el.x = jqq_startX;" & vbCrLf
  tmpstr = tmpstr & "    if (verticalpos==""fromtop"")" & vbCrLf
  tmpstr = tmpstr & "      jqq_el.y = jqq_startY;" & vbCrLf
  tmpstr = tmpstr & "    else{" & vbCrLf
  tmpstr = tmpstr & "      jqq_el.y = jqq_ns ? pageYOffset + innerHeight : document.body.scrollTop + document.body.clientHeight;" & vbCrLf
  tmpstr = tmpstr & "      jqq_el.y -= jqq_startY;" & vbCrLf
  tmpstr = tmpstr & "    }" & vbCrLf
  tmpstr = tmpstr & "    return jqq_el;" & vbCrLf
  tmpstr = tmpstr & "  }" & vbCrLf
  tmpstr = tmpstr & "  window.stayTopLeft=function()" & vbCrLf
  tmpstr = tmpstr & "  {" & vbCrLf
  tmpstr = tmpstr & "    if (verticalpos==""fromtop""){" & vbCrLf
  tmpstr = tmpstr & "      var jqq_pY = jqq_ns ? pageYOffset : document.body.scrollTop;" & vbCrLf
  tmpstr = tmpstr & "      jqq_ftlObj.y += (jqq_pY + jqq_startY - jqq_ftlObj.y)/8;" & vbCrLf
  tmpstr = tmpstr & "    }" & vbCrLf
  tmpstr = tmpstr & "    else{" & vbCrLf
  tmpstr = tmpstr & "      var jqq_pY = jqq_ns ? pageYOffset + innerHeight : document.body.scrollTop + document.body.clientHeight;" & vbCrLf
  tmpstr = tmpstr & "      jqq_ftlObj.y += (jqq_pY - jqq_startY - jqq_ftlObj.y)/8;" & vbCrLf
  tmpstr = tmpstr & "    }" & vbCrLf
  tmpstr = tmpstr & "    jqq_ftlObj.sP(jqq_ftlObj.x, jqq_ftlObj.y);" & vbCrLf
  tmpstr = tmpstr & "    setTimeout(""stayTopLeft()"", 10);" & vbCrLf
  tmpstr = tmpstr & "  }" & vbCrLf
  tmpstr = tmpstr & "  jqq_ftlObj = jqq_ml(""divStayTopLeft"");" & vbCrLf
  tmpstr = tmpstr & "  stayTopLeft();" & vbCrLf
  tmpstr = tmpstr & "}" & vbCrLf
  tmpstr = tmpstr & "JSFX_FloatTopDiv();" & vbCrLf
  Call fso_write("bottom.js", tmpstr)
  Call client_alert("新的JS文件已经创建成功!", "?type=manage")
End Sub

Select Case request.querystring("act")
  Case "login"
    Call login
  Case "cjs"
    Call cklogin: Call create_js
  Case "editsiteinfo"
    Call cklogin: Call editsiteinfo
  Case "add"
    Call cklogin: Call addinfo
  Case "edit"
    Call cklogin: Call editinfo
  Case "delete"
    Call cklogin: Call delinfo
End Select
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>JQQonline插件信息管理界面</title>
<style type="text/css">
<!--
body{margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;BACKGROUND:#C7E3FE;}
a{font-style:normal;TEXT-DECORATION: none;color:#000000;}
a:hover{font-style:normal;TEXT-DECORATION: none;color:#F4F4F4;}
a:active{font-style:normal;TEXT-DECORATION: none;color:#000000;}
table{font-size: 9pt;font-family: tahoma;color:#000000;}
-->
</style>
</head>
<body>
<%
Sub nlogin()
%>
<table border="0" width="500" cellpadding="0" cellspacing="0" align="center">
<form method="post" action="?act=login">
  <tr>
    <td width="500">
    <fieldset align="center">
    <legend>管理员登陆</legend>
    <table border="0" width="500">
      <tr>
        <td width="500" height="10"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;管理密码：<input type="password" name="password" size="30">&nbsp;<input type="submit" name="submit" value="登陆"></td>
      </tr>
      <tr>
        <td width="500" height="20"></td>
      </tr>
    </table>
    </fieldset>
    </td>
  </tr>
</form>
</table>
<%
End Sub

Sub slist()
%>
<table border="0" width="500" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td width="500">
    <fieldset align="center">
    <legend>通用网站在线咨询JQQonline插件</legend>
  <%
  Dim infostrSourceFile, infoobjXML
  infostrSourceFile = Server.MapPath("xml/info.xml")
  Set infoobjXML = Server.CreateObject("Microsoft.XMLDOM")
  infoobjXML.Load (infostrSourceFile)
  Dim infoobjNodes
  Set infoobjNodes = infoobjXML.selectSingleNode("xml/qqinfo/qqset[siteid ='1']")
  If Not IsNull(infoobjNodes) Then
    %>
    <form method="post" action="?type=manage&act=editsiteinfo">
    <table border="0" width="500">
      <tr>
        <td width="500" height="25">&nbsp;参数设置</td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;位置：<input type="radio" name="sitearea" value="0"<%if infoobjNodes.childNodes(4).text="0" then response.write " checked"%>>&nbsp;居左&nbsp;<input type="radio" name="sitearea" value="1"<%if infoobjNodes.childNodes(4).text="1" then response.write " checked"%>>&nbsp;居右</td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;网站名：<input type="text" name="sitename" size="15" value="<%=infoobjNodes.childNodes(0).text%>">&nbsp;使用皮肤：<input type="text" name="siteskin" size="5" value="<%=infoobjNodes.childNodes(1).text%>"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;显示界面X坐标：<input type="text" name="siteshowx" size="10" value="<%=infoobjNodes.childNodes(2).text%>">&nbsp;Y坐标：<input type="text" name="siteshowy" size="10" value="<%=infoobjNodes.childNodes(3).text%>">&nbsp;<input type="submit" name="submit" value="参数修改"></td>
      </tr>
      <tr>
        <td width="500" height="10"></td>
      </tr>
    </table>
    </form>
    <%
    Set infoobjNodes = Nothing
    Set infoobjXML = Nothing
  Else
    Call client_alert("Xml文件 未成功打开!", "?type=manage")
  End If
%>
    <table border="0" width="500">
      <tr>
        <td width="180" height="25">&nbsp;QQ号</td>
        <td width="180" height="25">&nbsp;描述</td>
        <td width="80" height="25">&nbsp;头像</td>
        <td width="30" align="center" height="25">编辑</td>
        <td width="30" align="center" height="25">删除</td>
      </tr>
<%
  Dim strSourceFile, objXML, objRootsite, AllNodesNum
  strSourceFile = Server.MapPath("xml/qq.xml")
  Set objXML = Server.CreateObject("Microsoft.XMLDOM")
  objXML.Load (strSourceFile)
  Set objRootsite = objXML.documentElement.selectSingleNode("qqlist")
  AllNodesNum = objRootsite.childNodes.length - 1
  Dim iCount
  For iCount = 0 To AllNodesNum
    %>
      <tr>
        <td width="180" height="25">&nbsp;<%=objRootsite.childNodes.item(iCount).childNodes.item(0).text%></td>
        <td width="180" height="25">&nbsp;<%=objRootsite.childNodes.item(iCount).childNodes.item(1).text%></td>
        <td width="80" height="25">&nbsp;<img src="images/qqface/<%=objRootsite.childNodes.item(iCount).childNodes.item(2).text%>_m.gif" border="0"></td>
        <td width="30" align="center" height="25"><a href="?type=manage&mtype=edit&id=<%=objRootsite.childNodes.item(iCount).childNodes.item(4).text%>">编辑</a></td>
        <td width="30" align="center" height="25"><a href="?type=manage&act=delete&id=<%=objRootsite.childNodes.item(iCount).childNodes.item(4).text%>">删除</a></td>
      </tr>
    <%
  Next
  Set objRootsite = Nothing
  Set objXML = Nothing
%>
      <tr>
        <td height="25" colspan="5" align="right"><input type="button" value="生成新的JS文件" onclick="location.href='?type=manage&act=cjs'">&nbsp;</td>
      </tr>
    </table>
    <form method="post" action="?type=manage&act=add">
    <table border="0" width="500">
      <tr>
        <td width="500" height="10"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;添加新的QQ号</td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;QQ号：<input type="text" name="qq" size="20"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;描述：<input type="text" name="dis" size="25"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;颜色：<input type="text" name="color" size="25"> 输入颜色代码例如：#000000</td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;头像：<br>
        <%dim fcount:for fcount=1 to 100%>
        <input type="radio" name="face" value="<%=fcount%>"><img src="images/qqface/<%=fcount%>_m.gif" border="0">
        <%next%>
        </td>
      </tr>
      <tr>
        <td width="500" height="10"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;<input type="submit" name="submit" value="确定添加">&nbsp;<input type="reset" name="reset" value="取消重置"></td>
      </tr>
      <tr>
        <td width="500" height="10"></td>
      </tr>
    </table>
    </form>
    </fieldset>
    </td>
  </tr>
</table>
<%
End Sub

Sub neditinfo()
%>
<table border="0" width="500" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td width="500">
    <fieldset align="center">
    <legend>编辑QQ信息</legend>
<%
  Dim neditid: neditid = request.querystring("id")
  If Not IsNumeric(neditid) Or neditid = "" Then
    Call client_alert("ID号必须是数字!", -1)
  Else
    neditid = CLng(neditid)
  End If
  Dim strSourceFile, objXML
  strSourceFile = Server.MapPath("xml/qq.xml")
  Set objXML = Server.CreateObject("Microsoft.XMLDOM")
  objXML.Load (strSourceFile)
  Dim objNodes
  Set objNodes = objXML.selectSingleNode("xml/qqlist/qq[id ='" & neditid & "']")
  If Not IsNull(objNodes) Then
    %>
    <form method="post" action="?type=manage&act=edit&id=<%=neditid%>">
    <table border="0" width="500">
      <tr>
        <td width="500" height="10"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;修改指定的QQ信息</td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;QQ号：<input type="text" name="qq" size="20" value="<%=objNodes.childNodes(0).text%>"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;描述：<input type="text" name="dis" size="25" value="<%=objNodes.childNodes(1).text%>"> </td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;颜色：<input type="text" name="color" size="25" value="<%=objNodes.childNodes(3).text%>"> 输入颜色代码例如：#000000</td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;头像：<br>
        <%dim fcount:for fcount=1 to 100%>
        <input type="radio" name="face" value="<%=fcount%>"<%if objNodes.childNodes(2).text=cstr(fcount) then response.write" checked"%>><img src="images/qqface/<%=fcount%>_m.gif" border="0">
        <%next%>
        </td>
      </tr>
      <tr>
        <td width="500" height="10"></td>
      </tr>
      <tr>
        <td width="500" height="25">&nbsp;<input type="submit" name="submit" value="确定修改">&nbsp;<input type="reset" name="reset" value="取消重置"></td>
      </tr>
      <tr>
        <td width="500" height="10"></td>
      </tr>
    </table>
    </form>
    </fieldset>
    </td>
  </tr>
</table>
    <%
    Set objNodes = Nothing
    Set objXML = Nothing
  Else
    Call client_alert("发生错误!", -1)
  End If
End Sub
  %>
<table border="0" width="500" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td width="500" height="20"></td>
  </tr>
</table>
  <%
If request.querystring("type") = "manage" Then
  Call cklogin
  Select Case request.querystring("mtype")
    Case "edit"
      Call neditinfo
    Case Else
      Call slist
  End Select
Else
  Call nlogin
End If
  Dim enddtime: enddtime = Timer()
  %>
<table border="0" width="500" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td width="500" height="10"></td>
  </tr>
  <tr>
    <td width="500" height="20" align="center"><a href="http://www.seirsoft.com" target="_blank">seirsoft.Com</a> 执行时间:<%=FormatNumber((enddtime-starttime)*1000,3)%>毫秒</td>
  </tr>
</table>
</body>
</html>