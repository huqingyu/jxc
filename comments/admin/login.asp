<!--#include file="admin_common/sql.asp" -->
<!--#include file="admin_common/conn_origin.asp"-->
<%  
	user=replace(trim(request.form("txtUser")),"'","''")
	password=replace(trim(request.form("txtPassword")),"'","''")
	sql="select * from admin where admin='"&user&"' and password='"&password&"'"
	set rs=conn.execute(sql)
	if rs.eof then
		Response.Write("<script language=javascript>alert('管理员姓名或密码错误！');history.back()</script>")
		Response.End
	else 
		Session("admin")=user
		Response.Redirect("index.html")
	end if
	conn.close
	set conn=nothing
%>

