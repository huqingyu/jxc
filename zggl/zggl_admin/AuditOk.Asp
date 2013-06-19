<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gbk"> 
<title>Audit</title> 
</head> 
<body> 
<!--#include file="admin_common/conn.asp" -->
<%
dim XId,UserName
XId=trim(request("XId"))
UserName=trim(request("UserName"))
sqlA="select Audit,user from xianlu where Id="&XId&" And User='"&UserName&"'"
Set rsA= Server.CreateObject("ADODB.Recordset")
rsA.open sqlA,conn,1,3
if rsA.bof and rsA.eof then
	response.Write("<p>没有该用户发布的线路,或者该线路已经审核，请返回刷新!</p>")
else	
	rsA("Audit")=True
	rsA.update
	response.Write("<p>审核成功!</p>")
End if
rsA.close
%>
</body> 
</html>