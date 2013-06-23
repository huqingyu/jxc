<!--#include file="common/conn.asp"-->
<%dim options,total,sql,i,answer
if request.QueryString("stype")="" then
	if Request.ServerVariables("REMOTE_ADDR")=request.cookies("vote")("IPAddress") then
		response.write"<SCRIPT language=JavaScript>alert(' 您现在的位置: 您现在的位置: 您现在的位置:，谢谢！');"
		response.write"javascript:window.close();</SCRIPT>"
	else
		options=request.form("options")
		response.cookies("vote")("IPAddress")=Request.ServerVariables("REMOTE_ADDR") 
		conn.execute("update toupiao set answer"&options&"=answer"&options&"+1 where IsChecked=1")
	end if
end if
%>
<!DOCTYPE HTML>
<html>
<head>
	<title>投票结果</title>
	<link href="css/common.css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" />
</head>
<body>
<div id="J_page" class="w980 center">
<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr> 
      <td height="29"> 
        <table cellspacing=0 cellpadding=0 width=170 height="20">
          <tr> 
            <td width=5>&nbsp;</td>
            <td width=28> 
              <div align="center"><img src="Images/ring01.gif" width="9" height="9"></div>
            </td>
            <td class=hg12 width="123">&nbsp;<font color="#000000"><b>投票结果</b></font></td>
            <td width=12>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
</table>
<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td height="29"> 
      <table border="0" cellpadding="0" cellspacing="0" width="58%" height="48" style="border-collapse: collapse" align="center">
        <%
total=0
set rs=server.createobject("adodb.recordset")
sql="select * from toupiao where IsChecked=1"
rs.open sql,conn,3,3
%>
        <tr> 
          <td height="24" colspan="3">=====================================================================================</td>
        </tr>
        <tr>
          <td height="24" colspan="3" align=center><font color="#000073"><%=rs("Title")%></font> </td>
        </tr>
        <tr>
          <td width="36%" valign="top">序号</td>
          <td width="45%" valign="top">百比分</td>
          <td width="19%" valign="top">人数</td>
        </tr>
        <%
for i=1 to 8
	if rs("Select"&i)<>"" then
		total=total+rs("answer"&i)
	end if
next

%>
        <%for i=1 to 8
	if rs("Select"&i)<>"" then
		if total=0 then
			answer=0
		else
			answer=(rs("answer"&i)/total)*100
		end if
%>
        <tr> 
          <td valign="top"><%=i%>.<%=rs("select"&i)%>：</td>
          <td valign="top"><img src=images/RSCount.gif width=<%=int(answer*2)%> height=8> 
            <%=round(answer,3)%>%</td>
          <td valign="top"><%=rs("answer"&i)%>人</td>
          <%
	end if
next
%>
        <tr>
          <td height="24" colspan="3"> 共有【<%=total%>】人参加投票</td>
        </tr>
        <tr>
          <td height="24" colspan="3">=====================================================================================</td>
        </tr>
      </table>
      <div align="center"></div>
      <p align="center">【<a href="javascript:window.close()">关闭窗口</a>】 
        <% rs.close     
set rs=nothing     
conn.close     
set conn=nothing %>
    </td>
  </tr>
</table>
<table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td height="23"> 
      <div align="center"></div>
    </td>
  </tr>
</table>
</div>
</body>
</html>