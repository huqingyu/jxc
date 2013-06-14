
<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<%
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select  * from fromw order by coun desc"
rs.Open sql,conn,1,2
while not rs.eof
sum=sum+rs("coun")
rs.movenext
wend
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select top  10  * from fromw order by coun desc"
rs.Open sql,conn,1,2
%>

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1">
  <tr bgcolor="#AE5700"> 
    <td height="29" colspan="3"> 
      <div align="center"><font color="#FFFFFF">地域统计(TOP10)</font></div></td>
  </tr>
  <tr> 
    <td width="33%" height="23" bgcolor="#FFC184"> 
      <div align="center">地域</div></td>
    <td width="31%" bgcolor="#FFC184"> 
      <div align="center">百分比</div></td>
    <td width="36%" align="center" bgcolor="#FFC184">访问量</td>
  </tr>
  <%
  i=1
while not rs.eof
if i mod 2 =0 then 
colorstr="#F3F3F3"
else
colorstr="#ffffff"
end if%>
  <tr> 
    <td height="18" bgcolor=<%=colorstr%>> 
      <div align="center"><%=rs("vwhere")%> </div></td>
  <td bgcolor=<%=colorstr%>>
<div align="center"><%=left((rs("coun")/sum)*100,4)%>%</div></td>
    <td bgcolor=<%=colorstr%>>
<div align="center"><%=rs("coun")%></div></td>
  </tr>
  <%i=i+1
rs.movenext
wend%>
</table>
