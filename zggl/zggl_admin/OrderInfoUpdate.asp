
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")
   userID=request("userid")

   set rs=server.createobject("adodb.recordset")
   sqltext="update orderb set flag=1 where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   response.write "<script>{window.alert('�˶����������!');window.location.href='orderInfo.asp';}</script>"
%>