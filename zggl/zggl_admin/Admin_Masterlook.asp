
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end select
sub looknew
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="190" height="24">Ԥ��������</td>
    <td width="120">Ԥ��ʱ��</td>
    <td width="130">Ԥ������ϵ�绰</td>
    <td width="110">��������</td>
    <td width="62">Ԥ����·</td>
  </tr>
<%
set rs=conn.execute("select id,m_id,m_name,m_xianlu_name,m_phone,m_yudingtime,m_renshuo,m_show from giveme where m_show=false order by m_yudingtime desc")
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFFFFF"">�����µ�Ԥ����</td></tr>")
end if
while not rs.eof
%>
  <tr align="center">
    <td height="24"><a href="admin_yddel.asp?action=look&id=<%=rs("id")%>" title="�鿴��Ԥ����ϸ��Ϣ">����</a> <%=rs("m_name")%></td>
    <td><%=rs("m_yudingtime")%></td>
    <td><%=rs("m_phone")%></td>
    <td><%=rs("m_renshuo")%></td>
    <td><a href="../xl_show.asp?id=<%=rs("m_id")%>" title="<%=rs("m_xianlu_name")%>" target=_blank>�鿴��·</a></td>
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
    <td height="24" align="center" bgcolor="#f5f5f5"><input type="button" name="Submit" value="ˢ ��" onclick="window.location.reload();"></td>
  </tr>
</table>
<%
end sub
sub lookall
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr align="center" bgcolor="#f5f5f5">
    <td width="190" height="24">Ԥ��������</td>
    <td width="120">Ԥ��ʱ��</td>
    <td width="130">Ԥ������ϵ�绰</td>
    <td width="110">��������</td>
    <td width="62">Ԥ����·</td>
  </tr>
<%
set rs=conn.execute("select id,m_id,m_name,m_xianlu_name,m_phone,m_yudingtime,m_renshuo,m_show from giveme order by m_yudingtime desc")
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFFFFF"">��û��Ԥ����Ϣ��</td></tr>")
end if
while not rs.eof
%>
  <tr align="center">
    <td height="24"><%
if not rs("m_show") then
response.write("<img src=images/mfk34.gif>")
end if
%><a href="admin_yddel.asp?action=look&id=<%=rs("id")%>" title="�鿴��Ԥ����ϸ��Ϣ">
����</a> <%=rs("m_name")%></td>
    <td><%=rs("m_yudingtime")%></td>
    <td><%=rs("m_phone")%></td>
    <td><%=rs("m_renshuo")%></td>
    <td><a href="../xl_show.asp?id=<%=rs("m_id")%>" title="<%=rs("m_xianlu_name")%>" target=_blank>�鿴��·</a></td>
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
    <td height="24" align="center" bgcolor="#f5f5f5"><input type="button" name="Submit2" value="ˢ ��" onclick="window.location.reload();"></td>
  </tr>
</table>
<%
end sub
%>