
<!--#include file="ifgoto.asp" -->
<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from fromw where id="+cstr(request("id"))+""
rs.Open sql,conn,1,2
rs.delete
rs.update
response.Redirect("admin.asp")
%>