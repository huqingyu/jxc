
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>会员预定信息管理</title>
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
                <td width="5%" height="25" align="center" background="images/admin_bg_1.gif">编号</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif">帐号</td>
                <td width="7%" align="center" background="images/admin_bg_1.gif"> 姓名</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif">联系电话</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif"> 电子邮件</td>
                <td width="17%" align="center" background="images/admin_bg_1.gif"> 预定酒店</td>
                <td width="11%" align="center" background="images/admin_bg_1.gif"> 预定房型</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif"> 确认方式</td>
                <td width="12%" align="center" background="images/admin_bg_1.gif">操作</td>
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
                  <input name="button" type="button" onclick=" window.location='orderdetail.asp?id=<%=rs("id")%>'"value="详情">
                  <input name="button" type="button" onclick="if (confirm('确实要此条记录吗？')) window.location='Orderinfodel.asp?id=<%=rs("id")%>'" value="删除"></td>
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
'显示空帖子的子程序
Sub showempty()%>
            <table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr class=main2>
                <td width="5%" height="25" align="center" background="images/admin_bg_1.gif">编号</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif">帐号</td>
                <td width="7%" align="center" background="images/admin_bg_1.gif"> 姓名</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif">联系电话</td>
                <td width="15%" align="center" background="images/admin_bg_1.gif"> 电子邮件</td>
                <td width="17%" align="center" background="images/admin_bg_1.gif"> 预定酒店</td>
                <td width="11%" align="center" background="images/admin_bg_1.gif"> 预定房型</td>
                <td width="9%" align="center" background="images/admin_bg_1.gif"> 确认方式</td>
                <td width="12%" align="center" background="images/admin_bg_1.gif">操作</td>
              </tr>
              <tr class=main2>
                <td align="center" height="23" colspan="9"> 无相关信息！</td>
              </tr>
            </table>
<%
End sub
%>
</body>
</html>