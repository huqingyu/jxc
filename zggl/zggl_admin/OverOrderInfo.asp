
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>处理完毕的会员预定信息管理</title>
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
'显示帖子的子程序
If rs.eof or rs.bof then 
   call showempty()
else
   call list()
End if
Sub list()%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr>
                <td height="25" align="center" background="images/admin_bg_1.gif">编号</td>
                <td align="center" background="images/admin_bg_1.gif">帐号</td>
                <td align="center" background="images/admin_bg_1.gif">姓名</td>
                <td align="center" background="images/admin_bg_1.gif">联系电话</td>
                <td align="center" background="images/admin_bg_1.gif">电子邮件</td>
                <td align="center" background="images/admin_bg_1.gif">预定酒店</td>
                <td align="center" background="images/admin_bg_1.gif">预定房型</td>
                <td align="center" background="images/admin_bg_1.gif">确认方式</td>
                <td align="center" background="images/admin_bg_1.gif">操作</td>
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
                <input name="button" type="button" onclick=" window.location='Overorderdetail.asp?id=<%=rs("id")%>'" value="详情">
                <input name="button2" type="button" onclick="if (confirm('确实要此条记录吗？')) window.location='OverOrderinfodel.asp?id=<%=rs("id")%>'" value="删除"></td>
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
'显示空帖子的子程序
Sub showempty()%>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tr >
                <td height="25" align="center" background="images/admin_bg_1.gif">编号</td>
                <td align="center" background="images/admin_bg_1.gif">帐号</td>
                <td align="center" background="images/admin_bg_1.gif">姓名</td>
                <td align="center" background="images/admin_bg_1.gif">联系电话</td>
                <td align="center" background="images/admin_bg_1.gif">电子邮件</td>
                <td align="center" background="images/admin_bg_1.gif">预定酒店</td>
                <td align="center" background="images/admin_bg_1.gif">预定房型</td>
                <td align="center" background="images/admin_bg_1.gif">确认方式</td>
                <td align="center" background="images/admin_bg_1.gif">操作</td>
              </tr>
              <tr>
                <td align="center" height="25" colspan="9"> 无相关信息！</td>
              </tr>
            </table>
<%
End sub
%>      
</body>
</html>