
<!--#include file="admin_check_permission.asp"-->
<!--#include file="admin_common/conn.asp" -->
<%
ContentId=Trim(Request("id"))
Set Rsroom=Server.Createobject("Adodb.Recordset")
Sql="Select C_Id From Roomb Where C_Id = "& ContentId
Rsroom.Open sql,Conn,1,1
If not rsroom.eof Then
   Rsroom.close
   Set Rsroom=Nothing
   Response.Redirect "Messagebox.Asp?Msg=����ɾ���˾Ƶ���Ӧ�ķ�������,��ִ�и�ɾ������!"
Else
   Set Rs=Server.Createobject("Adodb.Recordset")
   Sqltext="Delete * From Hotelb Where Id="& ContentId
   Rs.Open Sqltext,Conn,3,3
   Set Rs=Nothing
   Conn.close
	Response.Redirect "HotelInfo.asp"
End If
%>