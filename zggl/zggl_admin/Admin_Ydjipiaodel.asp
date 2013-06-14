<%@ LANGUAGE = VBScript.Encode %>
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
<%
dim action
action=trim(request("action"))
select case action
case "look"
look
case "del"
del
case "delok"
delok
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub look
dim id
id=trim(request("id"))
if not isnumeric(id) then
response.write("<script>alert('错误的传递参数！请确定你从有效链接进入！');history.back(1);</script>")
end if
set rs=conn.execute("select * from givemejipiao where id="&id)
if not rs("m_show") then
conn.execute("update givemejipiao set m_show=true where id="&id)
end if
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="30" background="images/admin_bg_1.gif">　　[必 填 项 目]</td>
  </tr>
</table>

<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="25" bgcolor="#f5f5f5">　　


 航段：<%=rs("hdname")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  
  <tr>
    <td width="180" height="25" align="center" bgcolor="#f5f5f5"> 联系人： </td>
    <td width="339"><%=rs("name")%></td>
    <td width="158" align="center" bgcolor="#f5f5f5"> 联系电话：</td>
    <td width="253"><%=rs("tel")%></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5"> 票 数：</td>
    <td><%=rs("piao")%>[<%=rs("piaotype")%>]</td>
    <td align="center" bgcolor="#f5f5f5"> 电子邮件：</td>
    <td><%=rs("email")%></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5"> 乘舱类型：</td>
    <td><%=rs("cctype")%></td>
    <td align="center" bgcolor="#f5f5f5"> 联系地址：</td>
    <td><%=rs("add")%></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5"> 登机日期：</td>
    <td><%=rs("textfield")%></td>
    <td colspan="2" rowspan="2" align="center"><a href="../Ticketinfo.asp?id=<%=rs("hdid")%>" target=_blank>查看该航段的详细信息</a></td>
  </tr>
  <tr>
    <td height="25" align="center" bgcolor="#f5f5f5"> 返程日期：</td>
    <td><%=rs("textfield2")%></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="35" align="center" bgcolor="#f5f5f5"><input type="button" name="Submit" value="后 退" onclick="window.history.go(-1);"></td>
  </tr>
</table>
<%
rs.close
end sub
sub del
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
set rs=conn.execute("select id,m_yudingtime,name,hdname,hdid,tel,piao,m_show from givemejipiao order by m_yudingtime desc")
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="205" height="24">预订人姓名</td>
    <td width="216">预订时间</td>
    <td width="212">预订人联系电话</td>
    <td width="139">票数</td>
    <td width="156">删除</td>
  </tr>
  <%
set rs=conn.execute("select id,m_yudingtime,name,hdname,hdid,tel,piao,m_show from givemejipiao order by m_yudingtime desc")
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFF"">暂没有预订信息！</td></tr>")
end if
while not rs.eof
%>
  <tr align="center">
    <td height="24"><%
if not rs("m_show") then
response.write("<img src=images/mfk34.gif>")
end if
%>
        <a href="admin_ydjipiaodel.asp?action=look&id=<%=rs("id")%>" title="查看此预订详细信息"> 详情</a> <%=rs("name")%></td>
    <td><%=rs("m_yudingtime")%></td>
    <td><%=rs("tel")%></td>
    <td><%=rs("piao")%></td>
    <td><input type="button" value="删除" onclick=" window.location='?action=delok&id=<%=rs("id")%>'"></td>
  </tr>
  <%
rs.movenext
wend
rs.close
%>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="35" align="center"><input type="button" name="Submit2" value="刷 新" onclick="window.location.reload();"></td>
  </tr>
</table>
<%
end sub
sub delok
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
dim id
id=trim(request("id"))
conn.execute("delete from givemejipiao where id="&id)
response.write("<script>alert('你选择的预订信息已经删除！按确定重新载入！');window.location='admin_ydjipiaodel.asp?action=del';</script>")
end sub
%>