<!--#include file="admin_common/conn.asp" -->
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
dim action
action=request.QueryString("action")
if action="save" then
set rs=server.CreateObject("adodb.recordset")
rs.Open "select webname,musicd,musicurl,webemail,dizhi,youbian,dianhua,copyright,weblogo,weburl,webbanner,Fos,mailaddress,mailusername,mailuserpass,mailname,mailsend from config ",conn,1,3
rs("webname")=trim(request("webname"))
rs("webemail")=trim(request("webemail"))
rs("dizhi")=trim(request("dizhi"))
rs("youbian")=trim(request("youbian"))
rs("dianhua")=trim(request("dianhua"))
rs("copyright")=trim(request("copyright"))
rs("weblogo")=trim(request("weblogo"))
rs("webbanner")=trim(request("webbanner"))
rs("Fos")=trim(request("Fos"))
rs("weburl")=trim(request("weburl"))
rs("mailaddress")=request("mailaddress")
rs("mailusername")=request("mailusername")
rs("mailuserpass")=request("mailuserpass")
rs("mailname")=request("mailname")
rs("mailsend")=request("mailsend")
rs("B_mid")=request("B_mid")
rs("B_key")=request("B_key")
rs.update
rs.close
set rs=nothing
response.Write "<script>alert('网站资料修改成功！');history.go(-1);</script>"
end if%>
<!DOCTYPE HTML>
<html>
<head><title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form name="form1" method="post" action="webconfig.asp?action=save">
<%set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from config",conn,1,1%>
<tr> 
<td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="#ff0000">网站信息设置</font></b></td>
</tr>
<tr> 
<td width="30%" height="25" align="right">网站网址：</td>
<td width="70%" style="PADDING-LEFT: 10px">HTTP:// <input name="weburl" type="text" id="weburl" size="21" value="<%=trim(rs("weburl"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">网站名称：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="webname" type="text" id="webname" size="28" value="<%=trim(rs("webname"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">公司 e-mail：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="webemail" type="text" id="webemail" size="28" value="<%=trim(rs("webemail"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">公司地址：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="dizhi" type="text" id="dizhi" size="28" value="<%=trim(rs("dizhi"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">公司邮编：</td>
<td style="PADDING-LEFT: 10px">
<input name="youbian" type="text" id="youbian" size="28" value="<%=trim(rs("youbian"))%>"	onKeyPress	= "return regInput(this,	/^[0-9]*$/,		String.fromCharCode(event.keyCode))"
onpaste		= "return regInput(this,	/^[0-9]*$/,		window.clipboardData.getData('Text'))"
ondrop		= "return regInput(this,	/^[0-9]*$/,		event.dataTransfer.getData('Text'))">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">公司电话：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="dianhua" type="text" id="dianhua" size="28" value="<%=trim(rs("dianhua"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">网站版权：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="copyright" type="text" size="28" value="<%=trim(rs("copyright"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">网站Logo：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="weblogo" type="text" id="weblogo" size="28" value="<%=trim(rs("weblogo"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">BANNER地址：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="webbanner" type="text" id="webbanner" size="28" value="<%=trim(rs("webbanner"))%>">
<font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">FOS地址：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="Fos" type="text" id="Fos" size="35" value="<%=trim(rs("Fos"))%>"><font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">网银商户号：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="b_mid" type="text" id="b_mid" size="35" value="<%=trim(rs("b_mid"))%>"><font color=#ff0000>*</font></td>
</tr>
<tr> 
<td height="25" align="right">网银私钥：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="B_key" type="text" id="B_key" size="35" value="<%=trim(rs("B_key"))%>"><font color=#ff0000>*</font></td>
</tr>
<tr>
<td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="#ff0000">发送邮件的配置</font></b></td>
</tr>
<tr> 
<td height="25" align="right">邮件服务器地址：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="mailaddress" type="text" id="mailaddress" size="36" value="<%=trim(rs("mailaddress"))%>">
</td>
</tr>
<tr> 
<td height="25" align="right">发送邮箱：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="mailsend" type="text" id="mailsend" size="36" value="<%=trim(rs("mailsend"))%>">
</td>
</tr>
<tr> 
<td height="25" align="right">登 录 名：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="mailusername" type="text" id="mailusername" size="36" value="<%=trim(rs("mailusername"))%>">
</td>
</tr>
<tr> 
<td height="25" align="right">登录密码：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="mailuserpass" type="password" id="mailuserpass" size="36" value="<%=trim(rs("mailuserpass"))%>">
</td>
</tr>
<tr> 
<td height="25" align="right">显示的姓名：</td>
<td style="PADDING-LEFT: 10px"> 
<input name="mailname" type="text" id="mailname" size="36" value="<%=trim(rs("mailname"))%>">
</td>
</tr>
<tr>
<td height="35">&nbsp;</td>
<td style="PADDING-LEFT: 10px"> 
<input type="submit" name="Submit" value=" 修改保存 ">&nbsp;
<input type="reset" name="Submit2" value=" 重新添写 ">
</td>
</tr>
</form>
</table>
<%rs.Close
  set rs=nothing
  %>
<script>
	function regInput(obj, reg, inputStr)
	{
		var docSel	= document.selection.createRange()
		if (docSel.parentElement().tagName != "INPUT")	return false
		oSel = docSel.duplicate()
		oSel.text = ""
		var srcRange	= obj.createTextRange()
		oSel.setEndPoint("StartToStart", srcRange)
		var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length)
		return reg.test(str)
	}
</script>

</body>
</html>