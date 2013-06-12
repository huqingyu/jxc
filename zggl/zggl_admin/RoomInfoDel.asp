
<!--#include file="admin_check_permission.asp"-->
<!--#include file="admin_common/conn.asp" -->
<%
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")

   set rs=server.createobject("adodb.recordset")
   sqltext="delete * from roomb where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   response.redirect "RoomInfo.asp"
%>