<!--#include file="admin_common/sql.asp" -->
<!--#include file="admin_common/conn_origin.asp"-->
<!--#include file="../common/md5.asp"-->
<%  
	if (int(session("VCodes"))<>int(request("VCodes"))) then
		response.write "<script language=javascript> alert('��ʾ:\n\n��֤����������������ɫ�����ڵ�����!');history.back();</script>"
		response.end
	end if
	user=replace(trim(request.form("user")),"'","''")
	password=MD5(replace(trim(request.form("password")),"'","''"))
	sql="select * from admin where admin='"&user&"' and password='"&password&"'"
	set rs=conn.execute(sql)
	if rs.eof then
		Response.Write("<script language=javascript>alert('����Ա�������������');history.back()</script>")
		Response.End
	else 
		Session("vip")=999
		Session("admin")=user
		Response.Redirect("admin_index.asp")
	end if
	conn.close
	set conn=nothing
%>

