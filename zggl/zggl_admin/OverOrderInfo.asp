
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>������ϵĻ�ԱԤ����Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet"></head>
<body>
<br />
<!--#include file="admin_common/conn.asp" -->
<!--#include file="fun.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where flag=1 order by id desc" 
rs.open sqltext,conn,1,1
'��ʾ���ӵ��ӳ���
If rs.eof or rs.bof then 
   call showempty()
else
   call list()
End if
Sub list()%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr>
                <td height="25" align="center" background="images/admin_bg_1.gif">���</td>
                <td align="center" background="images/admin_bg_1.gif">�ʺ�</td>
                <td align="center" background="images/admin_bg_1.gif">����</td>
                <td align="center" background="images/admin_bg_1.gif">��ϵ�绰</td>
                <td align="center" background="images/admin_bg_1.gif">�����ʼ�</td>
                <td align="center" background="images/admin_bg_1.gif">Ԥ���Ƶ�</td>
                <td align="center" background="images/admin_bg_1.gif">Ԥ������</td>
                <td align="center" background="images/admin_bg_1.gif">ȷ�Ϸ�ʽ</td>
                <td align="center" background="images/admin_bg_1.gif">����</td>
              </tr>
<% while not rs.eof %>
              <tr>
                <td align="center" height="25"><%=rs("id")%></td>
                <td align="center"><%=rs("userid")%></td>
                <td align="center"><%=rs("username")%></td>
                <td align="center"><%=rs("mobiletel")%></td>
                <td align="center"><%=rs("email")%></td>
                <td align="center"><%=GetHotelName(rs("c_id"))%></td>
                <td align="center"><%=GetRoomName(rs("roomtype"))%></td>
                <td align="center"><%=rs("affirmtype")%></td>
                <td align="center">
                <input name="button" type="button" onclick=" window.location='Overorderdetail.asp?id=<%=rs("id")%>'" value="����">
                <input name="button2" type="button" onclick="if (confirm('ȷʵҪ������¼��')) window.location='OverOrderinfodel.asp?id=<%=rs("id")%>'" value="ɾ��"></td>
              </tr>
<%
rs.movenext
wend
%>
</table>
<%
End sub
rs.close
conn.close
'��ʾ�����ӵ��ӳ���
Sub showempty()%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr >
                <td height="25" align="center" background="images/admin_bg_1.gif">���</td>
                <td align="center" background="images/admin_bg_1.gif">�ʺ�</td>
                <td align="center" background="images/admin_bg_1.gif">����</td>
                <td align="center" background="images/admin_bg_1.gif">��ϵ�绰</td>
                <td align="center" background="images/admin_bg_1.gif">�����ʼ�</td>
                <td align="center" background="images/admin_bg_1.gif">Ԥ���Ƶ�</td>
                <td align="center" background="images/admin_bg_1.gif">Ԥ������</td>
                <td align="center" background="images/admin_bg_1.gif">ȷ�Ϸ�ʽ</td>
                <td align="center" background="images/admin_bg_1.gif">����</td>
              </tr>
              <tr>
                <td align="center" height="25" colspan="9"> �������Ϣ��</td>
              </tr>
            </table>
<%
End sub
%>      
</body>
</html>