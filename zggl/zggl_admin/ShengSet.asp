
<%
if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
dim shengid,shengorder,shengname,shengno,i
if request("action")="update" then
    for i=1 to request.form("shengid").count
	shengid=replace(request.form("shengid")(i),"'","")
	shengorder=replace(request.form("shengorder")(i),"'","")
	shengname=replace(request.form("shengname")(i),"'","")
	shengno=replace(request.form("shengno")(i),"'","")
	if replace(request.form("shengorder")(i),"'","")="" then
%>
<script>
history.back();
alert("请填写省的显示排序！");
</script>
<%
		Response.End
	end if
	conn.execute("update szsheng set shengorder="&shengorder&",shengname='"&shengname&"',shengno='"&shengno&"' where id="&shengid)

    next
conn.close
set conn=nothing
response.write "<p align=center><font color=red>省设置成功!<br />2秒钟后返回上页!</font>"
response.write "<meta http-equiv=""refresh"" content=""2;url=shengmanage.asp"">"
end if


if request("action")="add" then
	shengno=request.form("shengno")
	shengname=trim(request("shengname"))
	shengorder=request.form("shengorder")
	If shengname="" Then
		response.write "省名称不能为空！请<a href=javascript:history.go(-1)>返回重新填写</a>！"
		response.end
	end if
	If shengno="" Then
		response.write "省编号名称不能为空！请<a href=javascript:history.go(-1)>返回重新填写</a>！"
		response.end
	end if
	If shengorder="" Then
		response.write "排序不能为空！请<a href=javascript:history.go(-1)>返回重新填写</a>！"
		response.end
	end if
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open "select * from szsheng",conn,1,3
rs.addnew
rs("shengname")=shengname
rs("shengno")=shengno
rs("shengorder")=shengorder
rs.update
rs.close
set rs=nothing

conn.close
set conn=nothing
response.write "<p align=center><font color=red>省添加成功!<br />2秒钟后返回上页!</font>"
response.write "<meta http-equiv=""refresh"" content=""2;url=shengmanage.asp"">"
end if
%>