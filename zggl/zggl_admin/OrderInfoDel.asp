
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>=2 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")

   set rs=server.createobject("adodb.recordset")
   sqltext="delete * from orderb where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   response.redirect "orderInfo.asp"
%>