
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
dim action
action=trim(request("action"))
select case action
case "Upnyd"
Upnyd
case "look"
look
case "del"
del
case "delok"
delok
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub Upnyd
id=trim(request("id"))
set rsq=conn.execute("select id,m_show from giveme where id="&id)
if rsq("m_show") = false then
conn.execute("update giveme set m_show=true")
response.Write "<script language='javascript'>alert('订单处理完毕！');history.back(1);</script>"
Else
response.Write "<script language='javascript'>alert('该订单已经处理,请返回处理页面进行刷新！');history.back(1);</script>"
end if
rsq.close
end sub
sub look
dim id
id=trim(request("id"))
if not isnumeric(id) then
response.write("<script>alert('错误的传递参数！请确定你从有效链接进入！');history.back(1);</script>")
end if
set rs=conn.execute("select * from giveme where id="&id)
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
    <td height="22" bgcolor="#f5f5f5">　　线路名称：<%=rs("m_xianlu_name")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td width="131" height="22" align="center" bgcolor="#f5f5f5">姓　　名：</td>
    <td width="325"><%=rs("m_name")%></td>
    <td width="129" align="center" bgcolor="#f5f5f5"> 所在地址： </td>
    <td width="329"><%=rs("m_address")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 联系电话： </td>
    <td><%=rs("m_phone")%></td>
    <td align="center" bgcolor="#f5f5f5"> 来游人数： </td>
    <td><%=rs("m_renshuo")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 需要导游： </td>
    <td><%=rs("m_daoyou")%></td>
    <td align="center" bgcolor="#f5f5f5"> 希望拼团： </td>
    <td><%=rs("m_pingchuan")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 预订时间： </td>
    <td><%=rs("m_yudingtime")%></td>
    <td align="center" bgcolor="#f5f5f5"> 来游日期： </td>
    <td><%=rs("m_laiyoutime")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 反程日期： </td>
    <td><%=rs("m_huanchengtime")%></td>
    <td align="center" bgcolor="#f5f5f5"> 补充事项： </td>
    <td><%=rs("m_mfk_2")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="30" background="images/admin_bg_1.gif">　　[其 它 信 息]</td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td width="130" height="22" align="center" bgcolor="#f5f5f5">  OICQ： </td>
    <td width="326" height="22"><%=rs("m_oicq")%></td>
    <td width="129" height="22" align="center" bgcolor="#f5f5f5"> 年　　龄： </td>
    <td width="329" height="22"><%=rs("m_age")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 电子邮件： </td>
    <td height="22"><%=rs("m_email")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5"> 主页地址： </td>
    <td height="22"><%=rs("m_homepage")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 手机号码： </td>
    <td height="22"><%=rs("m_shouji")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5"> 传　　真： </td>
    <td height="22"><%=rs("m_fax")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 工作单位： </td>
    <td height="22"><%=rs("m_gongzuodanwei")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5"> 身 份证： </td>
    <td height="22"><%=rs("m_zhengjian")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> 邮政编码： </td>
    <td height="22"><%=rs("m_youbian")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5">&nbsp;</td>
    <td height="22">&nbsp;</td>
  </tr>
  <tr>
    <td height="60" align="center" bgcolor="#f5f5f5"> 您的想法： </td>
    <td height="60" colspan="3"><%=rs("m_mfk")%></td>
  </tr>
  <tr>
    <td height="60" align="center" bgcolor="#f5f5f5"> 备　　注： </td>
    <td height="60" colspan="3"><%=rs("m_mfk_1")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="35" align="center" bgcolor="#f5f5f5"><input name="Submit" type="button" onclick="window.history.go(-1);" value="后 退">
    &nbsp;<input name="button" type="button" onclick= "window.location='Admin_Yddel.asp?action=Upnyd&id=<%=rs("id")%> '" value="处理该订单" <% if rs("m_show")=true then Response.write("disabled=""true""") end if%> >
</td>
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
set rs=conn.execute("select id,m_show,m_id,m_name,m_phone,m_yudingtime from giveme order by m_yudingtime desc")
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr align="center" bgcolor="#f5f5f5">
    <td width="23%" height="24" bgcolor="#f5f5f5">预订人姓名</td>
    <td width="31%" height="24" bgcolor="#f5f5f5">预订人联系电话</td>
    <td width="15%" height="24" bgcolor="#f5f5f5">预订时间</td>
    <td width="11%" height="24" bgcolor="#f5f5f5">线路详情</td>
    <td width="12%" height="24" bgcolor="#f5f5f5">预订详情</td>
    <td width="8%" height="24" bgcolor="#f5f5f5">删除</td>
  </tr>
<%
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""6"" bgcolor=""#FFFFFF"">暂时没有预订信息！</td></tr>")
end if
while not rs.eof
%>
  <tr align="center">
    <td height="22">
<%if not rs("m_show") then
response.write("<img src=images/mfk34.gif>")
end if
response.write rs("m_name")%></td>
    <td><%=rs("m_phone")%></td>
    <td><%=rs("m_yudingtime")%></td>
    <td><a href="../xl/xl_<%=rs("m_id")%>.html" target="_blank">查看</a></td>
    <td><input type="button" value="预订详情" onclick=" window.location='?action=look&id=<%=rs("id")%>'"></td>
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
conn.execute("delete from giveme where id="&id)
response.write("<script>alert('你选择的预订信息已经删除！按确定重新载入！');window.location='admin_yddel.asp?action=del';</script>")
end sub
%>

</body>
</html>