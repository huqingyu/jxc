
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="../common/md5.asp" -->
<%dim action,admin,adminid
action=request.QueryString("action")
adminid=request.QueryString("id")
admin=trim(request("admin"))
select case action
'//修改数据
case "edit"
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from master where id="&adminid,conn,1,3
rs("name")=admin
if trim(request("password"))<>"" then
rs("password")=md5(trim(request("password")))
end if
rs("flag")=int(request("flag"))
rs.Update
rs.Close
set rs=nothing
response.Write "<script>alert('修改成功！');history.go(-1);</script>"
response.End
'//添加新数据
case "add"
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from master",conn,1,3
rs.addnew
rs("name")=trim(request("admin2"))
rs("password")=md5(trim(request("password2")))
rs("flag")=int(request("flag2"))
rs.update
rs.close
set rs=nothing
response.Write "<script>alert('添加成功！');history.go(-1);</script>"
response.End
'//删除数据
case "del"
conn.execute ("delete from master where id="&request.QueryString("id"))
response.Redirect "ManageAdmin.asp"
end select
%>