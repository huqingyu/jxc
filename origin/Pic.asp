<!--#include file="common/conn.asp"-->
<!--#include file="common/webconfig.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>-���Ϸ��</title>
</head>
<!--��վ������ʼ -->
<!--#include file="top.asp" -->
<!--��վ�������� -->
<!--#include file="common/system_code.asp" -->
<TABLE width=980 border=0 align="center" cellPadding=0 cellSpacing=0>

        <tr> 
          <td><TABLE cellSpacing=0 cellPadding=0 width=980 border=0>
        
       
<tr>
  <TD width=212 vAlign=top><!--#include file="ymfg_left.asp" --></td> 
  <TD height="32" valign="top">
    <table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#AFD2A1" borderColorDark=#ffffff bgcolor="#F9F9F9">
<tr> 
  <td height="35" background="Images/ly6_3.gif"><span style="font-size:14px; font-weight:bold; padding-left:20px;">���Ϸ��</span></td>
</tr>
<tr>
  <td height="785" valign="top"><%
set strs=server.createobject("adodb.recordset")
stsql="select * from pic order by id desc"
strs.open stsql, conn, 1, 1
if not strs.eof then
strs.PageSize =12 'ÿҳ��¼����
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
    <table width=100%  border=0 cellspacing=0 cellpadding=0>
      <tr>
        <td width=180 height=136><div align="center"><%if not strs.eof then %>
            <a href="pic_info.asp?id=<%=strs("id")%>" title="<%=strs("name")%>" target="_blank"><img src="admin/<%=strs("pic_slt")%>" width="150" height="120" border="0" style="border:1px solid #CCCCCC;"></a>
            <% end if %></div></td>
        <% strs.movenext %>
        <td width=181><div align="center"><%if not strs.eof then %><a href="pic_info.asp?id=<%=strs("id")%>" title="<%=strs("name")%>" target="_blank"><img src="admin/<%=strs("pic_slt")%>" width="150" height="120" border="0" style="border:1px solid #CCCCCC;"></a>
            <% end if %></div></td>
        <% strs.movenext %>
        <td width=178><div align="center"><%if not strs.eof then %><a href="pic_info.asp?id=<%=strs("id")%>" title="<%=strs("name")%>" target="_blank"><img src="admin/<%=strs("pic_slt")%>" width="150" height="120" border="0" style="border:1px solid #CCCCCC;"></a>
            <% end if %></div></td>
      </tr>
    </table>
    <%
strs.movenext      
if strs.EOF then Exit For      
next      
end if      
strs.close      
set strs=nothing      
%></td>
</tr>
<tr>
<td height="30" background="Images/topBar_bg.gif"><div align="center">
<% call LastNextPage(maxpage,page,result_num) %>
</div></td>
</tr>
</table></td>
  <TD width="214" valign="top"><!--#include file="right_i.asp" --></td>
</tr></TABLE></td>
</tr></TABLE>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>

<!--#include file="foot.asp" -->

</BODY>
</HTML>
