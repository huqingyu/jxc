<!DOCTYPE HTML>
<html>
<head>
<title>User_login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body background="images/log_box.gif">
<!--#include file="Connection.asp"--><br>
<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
            <%if request.Cookies("Gemisum")("username")=""  then%>
            <form name="userlogin" method="post" action="User_Checklogin.asp">
              <tr>
                <td align="center"><font color="#999999">游客您好, 您现在的位置:先登录</font></td>
              </tr>
              <tr>
                <td align="center">用户名：
                    <input type="text"  name="username" size="14">
                </td>
              </tr>
              <tr>
                <td align="center">密　码：
                    <input type="password"  name="userpassword" size="14">
                </td>
              </tr>
              <tr>
                <td align="center">验证码：
                    <input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6>
                    <img src=GetCode.asp> </td>
              </tr>
              <tr>
                <td height="38" align="center" valign="middle">
                  <input  name="imageField" value="登 陆" type=submit onFocus="this.blur()">
                   &nbsp;<a href=User_Reg.asp target=_blank>注册</a>&nbsp;
                   <a href=userinfo/getpwd.asp target=_blank>忘密</a>&nbsp;
				   <a href="help.htm" target="_blank">帮助</a></td>
              </tr>
            </form>
            <%else%>
            <tr>
              <td align="center" height="38"><%
set rs=server.createobject("adodb.recordset")
rs.open "select jifen,yucun,reglx,vipdate from [userb] where username='"&request.Cookies("Gemisum")("username")&"'",conn,1,3
if rs("vipdate")<>"" then 
'看是不是过期VIP
if rs("vipdate")<date and rs("reglx")>2 then
rs("reglx")=1
rs.update
end if
end if
response.Cookies("Gemisum")("yucun")=rs("yucun")
response.Cookies("Gemisum")("jifen")=rs("jifen")
response.Cookies("Gemisum")("reglx")=rs("reglx")
rs.close
set rs=nothing
if request.Cookies("Gemisum")("reglx")=3 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 企业用户您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
Else
if request.Cookies("Gemisum")("reglx")=2 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 贵宾您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
else
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" 您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
end if
end if
response.write "<br><a href=userinfo.asp target=_blank><font color=red>进入会员中心</font></a>"
response.write "<br><a href=logout.asp>注销退出</a>"
end if
%></td>
            </tr>
</table>
</body>
</html>