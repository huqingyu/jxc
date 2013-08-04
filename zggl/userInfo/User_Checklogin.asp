<!--#include file="../common/conn.asp"-->
<!--#include file="../common/md5.asp"-->
<%dim username,userpassword,comeurl,verifycode
username=replace(trim(request("username")),"'","")
userpassword=md5(replace(trim(request("userpassword")),"'",""))
verifycode=replace(trim(request("verifycode")),"'","")
if username="" or userpassword="" then
response.write "<script LANGUAGE='javascript'>alert('您的用户名或密码有误！');history.go(-1);</script>"
response.end
end if
if UCase(session("GetCode"))<>UCase(trim(request("verifycode"))) then
response.Write "<script LANGUAGE='javascript'>alert('请输入正确的验证码！');history.go(-1);</script>"
response.end
end if

set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from [userb] where username='"&username&"' and userpassword='"&userpassword&"' " ,conn,1,3
if not(rs.bof and rs.eof) then
if userpassword=rs("userpassword") then
response.Cookies("Gemisum")("username")=trim(request("username"))
response.Cookies("Gemisum")("reglx")=rs("reglx")
response.Cookies("Gemisum")("yucun")=rs("yucun")
response.Cookies("Gemisum")("jifen")=rs("jifen")

rs("lastlogin")=now()
rs("logins")=rs("logins")+1
rs("userlastip")=Request.ServerVariables("REMOTE_ADDR")
rs.Update
rs.Close
set rs=nothing

if request("linkaddress")="" then
response.redirect request.servervariables("http_referer")
else
response.redirect request("linkaddress")
end if
else
response.write "<script LANGUAGE='javascript'>alert('对不起，您的用户名或密码有误！');history.go(-1);</script>"
end if
else
response.write "<script LANGUAGE='javascript'>alert('对不起！您的用户名或密码有误！');history.go(-1);</script>"
end if
%>