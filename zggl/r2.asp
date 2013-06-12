<table width="214" border="0" cellpadding="0" cellspacing="0" bgcolor="#F9FFF3">
  <tr>
    <td><a href="http://bbs.rzwww.com/index.asp?boardid=43" target="_blank"><img src="images/right2_01.jpg" alt="" width="214" height="30" border="0" /></a></td>
  </tr>
  <tr>
    <td height="215" align="center" style="border-left:1px solid #A7D466;border-right:1px solid #A7D466">
	<table width="96%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><script src="http://bbs.rzwww.com/Dv_News.asp?GetName=travel_01"></script></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><a href="list.asp?tp=75" target="_blank"><img src="images/right2_03.jpg" alt="" width="214" height="30" border="0" /></a></td>
  </tr>
  <tr>
    <td height="204" align="center" style="border-left:1px solid #A7D466;border-right:1px solid #A7D466"><table width="96%" border="0" cellspacing="0" cellpadding="0">
      <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 8 * from news where mytype=75 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
      <tr>
        <td height="24" style="border-bottom:1px dotted #D0EDC5;">
		¡¤ <a href="show.asp?id=<%=rs("id")%>" target="_blank">
        <%=left(rs("bt"),14)%>
        </a></td>
      </tr>
      <% rs.movenext 
wend 
			 %>
    </table></td>
  </tr>
  <tr>
    <td><a href="http://bbs.rzwww.com/index.asp?boardid=49" target="_blank"><img src="images/right2_05.jpg" alt="" width="214" height="30" border="0" /></a></td>
  </tr>
  <tr>
    <td height="225" align="center" style="border-left:1px solid #A7D466;border-right:1px solid #A7D466">
	<table width="96%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><script src="http://bbs.rzwww.com/Dv_News.asp?GetName=travel_02"></script></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/right2_07.jpg" width="214" height="4" alt="" /></td>
  </tr>
  <tr>
    <td><img src="images/right2_08.jpg" width="214" height="2" alt="" /></td>
  </tr>
</table>
