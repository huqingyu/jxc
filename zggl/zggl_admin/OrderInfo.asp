
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>��ԱԤ����Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet"></head>
<body>
<br />
<!--#include file="admin_common/conn.asp" -->
<!--#include file="fun.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where flag=0 order by id desc" 
rs.open sqltext,conn,1,1
If rs.eof and rs.bof then 
   call showempty
Else
   call list
End if
Sub list()%>
            <table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr class=main2>
                <td width="5%" height="25" align="center" background="images/admin_bg_1.gif">���</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif">�ʺ�</td>
                <td width="7%" align="center" background="images/admin_bg_1.gif"> ����</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif">��ϵ�绰</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif"> �����ʼ�</td>
                <td width="17%" align="center" background="images/admin_bg_1.gif"> Ԥ���Ƶ�</td>
                <td width="11%" align="center" background="images/admin_bg_1.gif"> Ԥ������</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif"> ȷ�Ϸ�ʽ</td>
                <td width="12%" align="center" background="images/admin_bg_1.gif">����</td>
              </tr>
              <%
if not rs.eof then
  do while not rs.eof 
%>
              <tr>
                <td width="5%" align="center" height="23"><%=rs("id")%></td>
                <td width="9%" align="center" height="23"><%=rs("userid")%></td>
                <td width="7%" align="center" height="23"><%=rs("username")%></td>
                <td width="15%" align="center" height="23"><p align="left"><%=rs("mobiletel")%></td>
                <td width="15%" align="center" height="23">
                  <p align="left"><%=rs("email")%></td>
                <td width="17%" align="center" height="23">
                  <p align="left"><%=GetHotelName(rs("c_id"))%></td>
                <td width="11%" align="center" height="23">
                  <p align="left"><%=GetRoomName(rs("roomtype"))%></td>
                <td width="9%"  height="23"><%=rs("affirmtype")%></td>
                <td width="12%" align="center" height="23">
                  <input name="button" type="button" onclick=" window.location='orderdetail.asp?id=<%=rs("id")%>'"value="����">
                  <input name="button" type="button" onclick="if (confirm('ȷʵҪ������¼��')) window.location='Orderinfodel.asp?id=<%=rs("id")%>'" value="ɾ��"></td>
              </tr>
<%
rs.movenext
loop
End If
rs.close
conn.close
End sub
%>
</table>
<%
'��ʾ�����ӵ��ӳ���
Sub showempty()%>
            <table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr class=main2>
                <td width="5%" height="25" align="center" background="images/admin_bg_1.gif">���</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif">�ʺ�</td>
                <td width="7%" align="center" background="images/admin_bg_1.gif"> ����</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif">��ϵ�绰</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif"> �����ʼ�</td>
                <td width="17%" align="center" background="images/admin_bg_1.gif"> Ԥ���Ƶ�</td>
                <td width="11%" align="center" background="images/admin_bg_1.gif"> Ԥ������</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif"> ȷ�Ϸ�ʽ</td>
                <td width="12%" align="center" background="images/admin_bg_1.gif">����</td>
              </tr>
              <tr class=main2>
                <td align="center" height="23" colspan="9"> �������Ϣ��</td>
              </tr>
            </table>
<%
End sub
%>
</body>
</html>