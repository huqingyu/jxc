
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
<%
dim action
action=trim(request("action"))
select case action
case "looknew"
looknew
case "lookall"
lookall
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub looknew
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="205" height="24">预订人姓名</td>
    <td width="216">预订时间</td>
    <td width="212">预订人联系电话</td>
    <td width="139">票数</td>
    <td width="156">预订航线</td>
  </tr>
<%
set rs=conn.execute("select id,m_yudingtime,name,hdname,hdid,tel,piao,m_show from givemejipiao where m_show=false order by m_yudingtime desc")
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFFFFF"">暂无新的预订！</td></tr>")
end if
while not rs.eof
%>
  <tr align="center">
    <td height="24"><a href="admin_ydjipiaodel.asp?action=look&id=<%=rs("id")%>" title="查看此预订详细信息">详情</a> <%=rs("name")%></td>
    <td><%=rs("m_yudingtime")%></td>
    <td><%=rs("tel")%></td>
    <td><%=rs("piao")%></td>
    <td><a href="../Ticketinfo.asp?id=<%=rs("hdid")%>" title="<%=rs("hdname")%>" target=_blank>查看</a></td>
  </tr>
<%
rs.movenext
wend
rs.close
%>
</table>
<table width="618" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr>
    <td height="24" align="center" bgcolor="#f5f5f5"><input type="button" name="Submit" value="刷 新" onclick="window.location.reload();"></td>
  </tr>
</table>
<%
end sub
sub lookall
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="205" height="24">预订人姓名</td>
    <td width="216">预订时间</td>
    <td width="212">预订人联系电话</td>
    <td width="139">票数</td>
    <td width="156">预订航线</td>
  </tr>
<%
set rs=conn.execute("select id,m_yudingtime,name,hdname,hdid,tel,piao,m_show from givemejipiao order by m_yudingtime desc")
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFFFFF"">暂没有预订信息！</td></tr>")
end if
while not rs.eof
%>
  <tr align="center">
    <td height="24"><%
if not rs("m_show") then
response.write("<img src=images/mfk34.gif>")
end if
%><a href="admin_ydjipiaodel.asp?action=look&id=<%=rs("id")%>" title="查看此预订详细信息">
详情</a> <%=rs("name")%></td>
    <td><%=rs("m_yudingtime")%></td>
    <td><%=rs("tel")%></td>
    <td><%=rs("piao")%></td>
    <td><a href="../Ticketinfo.asp?id=<%=rs("hdid")%>" title="<%=rs("hdname")%>" target=_blank>查看</a></td>
  </tr>

<%
rs.movenext
wend
rs.close
%>
</table>

<table width="618" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr>
    <td height="24" align="center" bgcolor="#f5f5f5"><input type="button" name="Submit2" value="刷 新" onclick="window.location.reload();"></td>
  </tr>
</table>
<%
end sub
%>