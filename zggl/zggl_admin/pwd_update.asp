<!--#include file="admin_common/conn.asp"-->
<!--#include file="../common/md5.asp"-->
<%
if request.QueryString("gn")="pass" then
   user =Replace(Trim(Request.Form("user")),"'","''")
   pass=md5(Replace(Trim(Request.Form("pass")),"'","''"))
   new_pass=md5(Replace(Trim(Request.Form("new_pass")),"'","''"))
   set rs2=server.CreateObject("adodb.recordset")
   sql2="select * from Admin where password='"& pass &"'"
   rs2.open sql2,conn,1,3
   if rs2.bof then
  	   Response.Write("<script language=javascript>alert('原密码输入错误！！！');history.back();</script>")
	else
	rs2("password")=new_pass
	rs2("admin")=user
	rs2.update  
	Response.Write("<script language=javascript>alert('用户名密码更改成功！！！');location.replace('pwd_update.asp')</script>")
	end if 
end if
%>
<SCRIPT>
<!--
function del_space(s)
{
	for(i=0;i<s.length;++i)
	{
	 if(s.charAt(i)!=" ")
		break;
	}

	for(j=s.length-1;j>=0;--j)
	{
	 if(s.charAt(j)!=" ")
		break;
	}

	return s.substring(i,++j);
}

function VerifySubmit()
{
	user = del_space(document.all("user").value);
     if (user.length == 0)
     {
        alert("您忘了填写管理员名称!");
	return false;
     }
	 
	 pass = del_space(document.all("pass").value);
     if (pass.length == 0)
     {
        alert("管理员密码不能为空！");
	return false;
     }
	 
	 new_pass = del_space(document.all("new_pass").value);
     if (new_pass.length == 0)
     {
        alert("新管理员密码不能为空！");
	return false;
     }

	new_pass = del_space(document.all("new_pass").value);
     if (new_pass.length < 5)
     {
        alert("新管理员密码不能小于6位字符！");
	return false;
     }

	new_pass2 = del_space(document.all("new_pass2").value);
     if (new_pass2!=new_pass)
     {
        alert("两次输入的口令不相同,请重新填写!");
		return false;
     }
	 
	return true;
}
//-->
</SCRIPT>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>123</title>
<link href="images/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
body {
	background-color: #FFF;
}
.STYLE1 {
	color: #FFF;
	font-weight: bold;
}
-->
</style></head>

<body>
<%
sql3="select * from Admin"
set rs3=conn.execute(sql3)
%>
<FORM action="pwd_update.asp?gn=pass" method="post" name="regform" onSubmit="return VerifySubmit()">
  <table width="416" border="0" align="center" cellpadding="5" cellspacing="1">
    <tr>
      <td height="28" colspan="3" align="center" background="images/admin_bg_1.gif"><span class="STYLE1">管理员密码修改</span></td>
    </tr>
    <tr>
      <td width="171" align="center" bgcolor="#ECF9FF">原管理员名称：</td>
      <td width="222" colspan="2" bgcolor="#ECF9FF"><input name="user" type="text" id="user" value="<% =rs3("admin") %>">
      </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#ECF9FF">原管理员密码：</td>
      <td colspan="2" bgcolor="#ECF9FF"><input name="pass" type="password" id="pass" ></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#ECF9FF">新管理员密码：</td>
      <td colspan="2" bgcolor="#ECF9FF"><input name="new_pass" type="password" id="new_pass"></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#ECF9FF">重复输入新管理员密码：</td>
      <td colspan="2" bgcolor="#ECF9FF"><input name="new_pass2" type="password" id="new_pass2"></td>
    </tr>
    <tr>
      <td colspan="3" align="center" bgcolor="#ECF9FF"><input type="submit" name="Submit" value="修 改">
      &nbsp;&nbsp;&nbsp; <input type="reset" name="Submit2" value="重 置"></td>
    </tr>
  </table>
</form>
</body>
</html>
