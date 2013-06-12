<table width="212" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="36" background="images/left_01.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;">最新酒店</td>
  </tr>
  <tr>
    <td height="163" align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE"><%sql="select top 8 id,c_name from Hotelb order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1

if rs.eof then
response.write " 您现在的位置:信息!"
Else
do while not rs.eof%>
      <table width="93%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="18"><font color="#666666"><a href="Hotel/Hotel_<%=rs("id")%>.html">
            <%if len(rs("c_name"))>13 then%>
            <%=left(rs("c_name"),13)%>...
            <%else%>
            <%=rs("c_name")%>
            <%end if%>
          </a></font></td>
        </tr>
      </table>
    <%
rs.movenext                                                 
loop
end if
rs.close%></td>
  </tr>
  <tr>
    <td><img src="images/left_04.jpg" width="212" height="8" alt="" /></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>
<table width="212" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="36" background="images/left_01.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;">最新线路</td>
  </tr>
  <tr>
    <td height="163" align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE"><%sql="select top 8 id,x_name from xianlu order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1

if rs.eof then
response.write " 您现在的位置:信息!"
Else
do while not rs.eof%>
      <table width="93%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="18"><font color="#666666"><a href="xl/xl_<%=rs("id")%>.html">
            <%if len(rs("x_name"))>13 then%>
            <%=left(rs("x_name"),13)%>...
            <%else%>
            <%=rs("x_name")%>
            <%end if%>
          </a> </font></td>
        </tr>
      </table>
    <%
rs.movenext                                                 
loop
end if
rs.close%></td>
  </tr>
  <tr>
    <td><img src="images/left_04.jpg" width="212" height="8" alt="" /></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>
<table width="212" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="36" background="images/left_01.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;">在线调查</td>
  </tr>
  <tr>
    <td height="163" align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE"><!--#include file="toupiaoinfo.asp" --></td>
  </tr>
  <tr>
    <td><img src="images/left_04.jpg" width="212" height="8" alt="" /></td>
  </tr>
</table>