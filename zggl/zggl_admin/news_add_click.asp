<!--#include file="admin_common/conn.asp"-->
<%
click = Trim(Request.Form("click"))
If click = "" or isNumeric(click) = False Then
Response.Write("<p align=center>��������&nbsp;&nbsp;<a href=javascript:history.back()>����</a></p>")
Response.End
End If

dim sn:sn = 0

set rs= Server.CreateObject("adodb.recordset")
sql="select * from news"
rs.open sql,conn,1,3
Do while not rs.eof
sn = sn + 1
rs("lls") = rs("lls") + click
rs.update
rs.MoveNext
Loop

rs.close
set rs = nothing
conn.close
set conn = nothing
%>
<p align="center" style="font-size:9pt;color:#FF0066;">
������޸ĳɹ��������޸���<b><%=sn%><b>����¼��
&nbsp;&nbsp;
<a href="newsup.asp" style="font-size:9pt;color:#0066cc;">����</a>
</p>
