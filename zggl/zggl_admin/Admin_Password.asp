
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<script LANGUAGE="javascript">
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.renpassword.password.value)) {
	document.renpassword.password.focus();
    alert("原密码不能为空！");
	return false;
  }
  if(checkspace(document.renpassword.password1.value)) {
	document.renpassword.password1.focus();
    alert("新密码不能为空！");
	return false;
  }
    if(checkspace(document.renpassword.password2.value)) {
	document.renpassword.password2.focus();
    alert("确认密码不能为空！");
	return false;
  }
    if(document.renpassword.password1.value != document.renpassword.password2.value) {
	document.renpassword.password1.focus();
	document.renpassword.password1.value = '';
	document.renpassword.password2.value = '';
    alert("新密码和确认密码不相同，请重新输入");
	return false;
  }
	document.admininfo.submit();
  }
//-->
</script> 
<%if request.QueryString("action")="save" then%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="../common/md5.asp" -->
<%
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from master where name='"&session("admin")&"'",conn,3,3
if md5(trim(request("password")))<>rs("password") then
response.Write "<script>alert('原密码错误，请返回重新输入');history.go(-1);</script>"
response.End
else
rs("password")=md5(trim(request("password2")))
rs.Update
rs.Close
set rs=nothing
session("admin")=""
session("flag")=""
response.Write "<script>alert('更改成功，请用新密码重新登陆！');history.go(-1);</script>"
end if
response.End
end if
%>
<br /><br /><br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#ff0000">更改管理密码</font></div>    </td>
  </tr>
  <tr> 
    <td height="163"> 
      <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="renpassword" method="post" action="Admin_password.asp?action=save">
          <tr> 
            <td width="81" height="25"> 
            <div align="right">用户名：</div></td>
            <td width="139"> 
              <div align="center"><font color=red><%=session("admin")%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="25"> 
            <div align="right">原密码：</div></td>
            <td> 
              <div align="center"> 
                <input name="password" type="password" id="password" size="17">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="25"> 
            <div align="right">新密码：</div></td>
            <td> 
              <div align="center"> 
                <input name="password1" type="password" id="password1" size="17">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="25"> 
            <div align="right">确认密码：</div></td>
            <td> 
              <div align="center"> 
                <input  name="password2" type="password" id="password2" size="17">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="35" colspan="2"> 
              <div align="center"> 
                <input onClick="return check();" type="submit" name="Submit" value="确定更改">
              </div>            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
