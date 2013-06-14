<!--#include file="conn.asp"-->
<%
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"

if request("act")="edit" then
 set rs= Server.CreateObject("adodb.recordset")
 rs.open "select * from account1000y where account='"& request("account") &"'" ,conn,1,3
 rs("password")=request("password")
 rs("username")=request("username")
 rs("nativenumber")=request("nativenumber")
 rs("email")=request("email")
 rs("telephone")=request("telephone")
 rs("masterkey")=request("masterkey")
 rs("ipaddr")=request("ipaddr")
 rs("makedate")=request("makedate")
 rs("lastdate")=request("lastdate")
 rs("paycount")=request("paycount")
 rs.update
 rs.close
 set rs=nothing
 response.Write "<script>alert('修改成功');</script>"
end if%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户信息</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	font-size: 12px;
}
-->
</style></head>

<body>
<%set rs= Server.CreateObject("adodb.recordset")
  rs.open "select * from account1000y where account='"& request("account") &"'" ,conn,1,1%>
<table width="478" border="0" align="center" cellpadding="0" cellspacing="0">
  <form action="?act=edit" method="post" name="form1" id="form1">
    <tr>
      <td width="113" height="27" align="right" style="color:#666666;font-size:14px">帐号：</td>
      <td width="365" height="27"><label>
        <input name="account" type="text" class="input" id="account" size="30" readonly value="<%=request("account")%>"/>
      </label>        <span id="regtitle"></span></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">密码：</td>
      <td height="27"><input name="password" type="text" class="input" id="password" size="30" value="<%=rs("password")%>"/></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">姓    名：</td>
      <td height="27"><input name="username" type="text" class="input" id="username" size="30" value="<%=rs("username")%>"/></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">身份证号码：</td>
      <td height="27"><input name="nativenumber" type="text" class="input" id="nativenumber" size="30" value="<%=rs("nativenumber")%>" /></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">邮箱：</td>
      <td height="27"><input name="email" type="text" class="input" id="email" size="30" value="<%=rs("email")%>" /></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">手机：</td>
      <td height="27"><input name="telephone" type="text" class="input" id="telephone" size="30"  value="<%=rs("telephone")%>" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" /></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">角色：</td>
      <td height="27">&nbsp;1.<%=rs("char1")%><BR>&nbsp;2.<%=rs("char2")%><BR>&nbsp;3.<%=rs("char3")%></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">&nbsp;</td>
      <td height="27">&nbsp;4.<%=rs("char4")%><BR>&nbsp;5.<%=rs("char5")%></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">注册IP：</td>
      <td height="27"><input name="ipaddr" type="text" class="input" id="ipaddr" size="30" value="<%=rs("ipaddr")%>" /></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">最后登陆时间：</td>
      <td height="27"><input name="lastdate" type="text" class="input" id="lastdate" size="30" value="<%=rs("lastdate")%>" /></td>
    </tr>
    <tr>
      <td height="27" align="right" style="color:#666666;font-size:14px">充值总额：</td>
      <td height="27"><input name="paycount" type="text" class="input" id="paycount" size="30" value="<%=rs("paycount")%>" /></td>
    </tr>
    <tr>
      <td height="47" align="right">&nbsp;</td>
      <td><input type="image" name="imageField" id="imageField" src="images/editzl.png" /></td>
    </tr>
  </form>
</table>
</body>
</html>
