
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
dim shiid,id
shiid=request("shiid")
id=request("id")
	conn.execute("delete from szshi where id=" &shiid)
	conn.close
	set conn=nothing
	response.write "<p align=center><font color=red>恭喜您!您选择的市已经被删除!<br />2秒钟后返回上页!</font>"
if id<>"" then
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp?shengid="&id&""">"
else
response.write "<meta http-equiv=""refresh"" content=""2;url=shimanage.asp"">"
end if
	response.end
%>