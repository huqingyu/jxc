
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end select
sub Upnyd
id=trim(request("id"))
set rsq=conn.execute("select id,m_show from giveme where id="&id)
if rsq("m_show") = false then
conn.execute("update giveme set m_show=true")
response.Write "<script language='javascript'>alert('����������ϣ�');history.back(1);</script>"
Else
response.Write "<script language='javascript'>alert('�ö����Ѿ�����,�뷵�ش���ҳ�����ˢ�£�');history.back(1);</script>"
end if
rsq.close
end sub
sub look
dim id
id=trim(request("id"))
if not isnumeric(id) then
response.write("<script>alert('����Ĵ��ݲ�������ȷ�������Ч���ӽ��룡');history.back(1);</script>")
end if
set rs=conn.execute("select * from giveme where id="&id)
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="30" background="images/admin_bg_1.gif">����[�� �� �� Ŀ]</td>
  </tr>
</table>

<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="22" bgcolor="#f5f5f5">������·���ƣ�<%=rs("m_xianlu_name")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td width="131" height="22" align="center" bgcolor="#f5f5f5">�ա�������</td>
    <td width="325"><%=rs("m_name")%></td>
    <td width="129" align="center" bgcolor="#f5f5f5"> ���ڵ�ַ�� </td>
    <td width="329"><%=rs("m_address")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> ��ϵ�绰�� </td>
    <td><%=rs("m_phone")%></td>
    <td align="center" bgcolor="#f5f5f5"> ���������� </td>
    <td><%=rs("m_renshuo")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> ��Ҫ���Σ� </td>
    <td><%=rs("m_daoyou")%></td>
    <td align="center" bgcolor="#f5f5f5"> ϣ��ƴ�ţ� </td>
    <td><%=rs("m_pingchuan")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> Ԥ��ʱ�䣺 </td>
    <td><%=rs("m_yudingtime")%></td>
    <td align="center" bgcolor="#f5f5f5"> �������ڣ� </td>
    <td><%=rs("m_laiyoutime")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> �������ڣ� </td>
    <td><%=rs("m_huanchengtime")%></td>
    <td align="center" bgcolor="#f5f5f5"> ������� </td>
    <td><%=rs("m_mfk_2")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="30" background="images/admin_bg_1.gif">����[�� �� �� Ϣ]</td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td width="130" height="22" align="center" bgcolor="#f5f5f5">  OICQ�� </td>
    <td width="326" height="22"><%=rs("m_oicq")%></td>
    <td width="129" height="22" align="center" bgcolor="#f5f5f5"> �ꡡ���䣺 </td>
    <td width="329" height="22"><%=rs("m_age")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> �����ʼ��� </td>
    <td height="22"><%=rs("m_email")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5"> ��ҳ��ַ�� </td>
    <td height="22"><%=rs("m_homepage")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> �ֻ����룺 </td>
    <td height="22"><%=rs("m_shouji")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5"> �������棺 </td>
    <td height="22"><%=rs("m_fax")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> ������λ�� </td>
    <td height="22"><%=rs("m_gongzuodanwei")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5"> �� ��֤�� </td>
    <td height="22"><%=rs("m_zhengjian")%></td>
  </tr>
  <tr>
    <td height="22" align="center" bgcolor="#f5f5f5"> �������룺 </td>
    <td height="22"><%=rs("m_youbian")%></td>
    <td height="22" align="center" bgcolor="#f5f5f5">&nbsp;</td>
    <td height="22">&nbsp;</td>
  </tr>
  <tr>
    <td height="60" align="center" bgcolor="#f5f5f5"> �����뷨�� </td>
    <td height="60" colspan="3"><%=rs("m_mfk")%></td>
  </tr>
  <tr>
    <td height="60" align="center" bgcolor="#f5f5f5"> ������ע�� </td>
    <td height="60" colspan="3"><%=rs("m_mfk_1")%></td>
  </tr>
</table>
<table width="618" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="4"></td>
  </tr>
</table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr>
    <td height="35" align="center" bgcolor="#f5f5f5"><input name="Submit" type="button" onclick="window.history.go(-1);" value="�� ��">
    &nbsp;<input name="button" type="button" onclick= "window.location='Admin_Yddel.asp?action=Upnyd&id=<%=rs("id")%> '" value="����ö���" <% if rs("m_show")=true then Response.write("disabled=""true""") end if%> >
</td>
  </tr>
</table>
<%
rs.close
end sub
sub del
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
set rs=conn.execute("select id,m_show,m_id,m_name,m_phone,m_yudingtime from giveme order by m_yudingtime desc")
%>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">  <tr align="center" bgcolor="#f5f5f5">
    <td width="23%" height="24" bgcolor="#f5f5f5">Ԥ��������</td>
    <td width="31%" height="24" bgcolor="#f5f5f5">Ԥ������ϵ�绰</td>
    <td width="15%" height="24" bgcolor="#f5f5f5">Ԥ��ʱ��</td>
    <td width="11%" height="24" bgcolor="#f5f5f5">��·����</td>
    <td width="12%" height="24" bgcolor="#f5f5f5">Ԥ������</td>
    <td width="8%" height="24" bgcolor="#f5f5f5">ɾ��</td>
  </tr>
<%
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""6"" bgcolor=""#FFFFFF"">��ʱû��Ԥ����Ϣ��</td></tr>")
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
    <td><a href="../xl/xl_<%=rs("m_id")%>.html" target="_blank">�鿴</a></td>
    <td><input type="button" value="Ԥ������" onclick=" window.location='?action=look&id=<%=rs("id")%>'"></td>
    <td><input type="button" value="ɾ��" onclick=" window.location='?action=delok&id=<%=rs("id")%>'"></td>
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
    <td height="35" align="center"><input type="button" name="Submit2" value="ˢ ��" onclick="window.location.reload();"></td>
  </tr>
</table>
<%
end sub
sub delok
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
dim id
id=trim(request("id"))
conn.execute("delete from giveme where id="&id)
response.write("<script>alert('��ѡ���Ԥ����Ϣ�Ѿ�ɾ������ȷ���������룡');window.location='admin_yddel.asp?action=del';</script>")
end sub
%>

</body>
</html>