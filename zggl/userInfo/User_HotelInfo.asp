<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert('�㲻����ҵ��Ա��');history.go(-1);</script>"
end if
%>
<html>
<head>
<title>�Ƶ���Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function OpenSmallWindows(strURL)
{
window.open (strURL,"_blank",
"status=no,resizable=0,toolbar=no,menubar=no,scrollbars=no,width=780,height=300,left=2,top=100");
}
</script>
<link rel="stylesheet" href="style.css" type="text/css"></head>
<body>
<br>
<!--#include file="../common/conn.asp"-->
<!--#include file="admin/system/system_code.asp" -->
<%
UserName=request.Cookies("Gemisum")("username")
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where User='"&UserName&"' order by id desc" 
rs.open sqltext,conn,1,1
If rs.eof and rs.bof then 
   call showempty
   else
   call list
end if
rs.close
conn.close
Sub list()%>
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<TBODY><TR ><TD height="30" background="Images/topBar_bg.gif">&nbsp;</TD></TR>
<TR><TD height="25">&nbsp;&nbsp;�ѵǼǵľƵ���Ϣ</TD></TR><TR><TD height="15">
<table width="99%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<tr><td width="9%" height="25" align="center" background="Images/topBar_bg.gif">�Ƶ���</td>
<td width="19%" align="center" background="Images/topBar_bg.gif">�Ƶ�����</td>
<td width="9%" align="center" background="Images/topBar_bg.gif">�Ǽ�</td>
<td width="16%" align="center" background="Images/topBar_bg.gif">����״̬</td>
<td width="10%" align="center" background="Images/topBar_bg.gif">��������</td>
<td width="37%" align="center" background="Images/topBar_bg.gif">����</td></tr>
<%
UserName=request.Cookies("Gemisum")("username")
set strs=server.createobject("adodb.recordset")
stsql="select * from hotelb where User='"&UserName&"' order by id desc"
strs.open stsql, conn, 1, 1
if not strs.eof then
strs.PageSize =20 'ÿҳ��¼����
result_num=strs.RecordCount '��¼����
maxpage=strs.PageCount 
page=request("page")
if Not IsNumeric(page) or page="" then
page=1
else
page=cint(page)
end if
if page<1 then
page=1
elseif  page>maxpage then
page=maxpage
end if
strs.AbsolutePage=Page
else
result_num=0
maxpage=0
page=0
end if
if not strs.eof then 
for i=1 to strs.PageSize
%>                   
<tr>
<td width="9%" align="center" height="23"><%=strs("id")%></td>
<td width="19%" align="center" height="23"><p align="left"><a href="#" title="<%=strs("User")%>" onclick="Javascript:OpenSmallWindows('HotelRoomAll.asp?id=<%=strs("Id")%>')" >
<%=strs("c_name")%></a></td>
<td width="9%" align="center" height="23"><%=strs("level")%></td>
<td width="16%" align="center" height="23"><%
if strs("Audit")="True" then
response.write ("<font color=Green >ͨ�����</font>")
else
response.write ("<font color=Red >��δ���</font>")
end if
%></td>
<td width="10%" align="center" height="23">
<p align="center"><%=strs("city")%></td>
<td width="37%" align="center" height="23">
<input type="button" value="��ӷ���" onclick=" window.location='User_RegRoom.asp?id=<%=strs("id")%>&action=hotel_room'"></td>
</tr>
<%
strs.movenext      
if strs.EOF then Exit For      
next      
end if      
strs.close     
set strs=nothing      
%></table></TD></TR><TR><TD height="30">
<p align="center"><% call LastNextPage(maxpage,page,result_num) %>
</TD></TR></TBODY></TABLE>
<br>
<%
End sub
%>        
<%      
Sub showempty()%>
<table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<tr><td width="5%" height="25" align="center" background="Images/topBar_bg.gif">�Ƶ���</td>
<td width="14%" align="center" background="Images/topBar_bg.gif">�Ƶ�����</td>
<td width="10%" align="center" background="Images/topBar_bg.gif">�Ǽ�</td>
<td width="6%" align="center" background="Images/topBar_bg.gif">����ʡ��</td>
<td width="8%" align="center" background="Images/topBar_bg.gif">��������</td>
<td width="12%" align="center" background="Images/topBar_bg.gif">����</td></tr><tr>
<td width="55%" align="center" height="23" colspan="6"> �������Ϣ��</td></tr></table><br>
<%
End sub
%>        
</body>
</html>