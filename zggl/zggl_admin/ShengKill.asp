
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>=2 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
dim shengid
shengid=request("shengid")
	conn.execute("delete from szshi where shengid=" &shengid)
	conn.execute("delete from szsheng where id=" &shengid)
	conn.close
	set conn=nothing
	response.write "<p align=center><font color=red>恭喜您!您选择的省已经被删除!<br />2秒钟后返回上页!</font>"
	response.write "<meta http-equiv=""refresh"" content=""2;url=shengmanage.asp"">"
	response.end
%>