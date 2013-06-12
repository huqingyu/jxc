<table width="212" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="36" background="images/left_01.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;">图片分类</td>
  </tr>
  <tr>
    <td height="163" align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE"><%
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from picboard order by id",conn,1,1
if rs.recordcount=0 then
response.write "<br> 您现在的位置:类"
else
%>
        <table width=193 cellspacing="0" cellpadding="0" border="0">
          <%
while not rs.eof
%>
          <tr>
            <td width=100% height="26" background="images/bg_guide02.gif" class="table-you" STYLE='PADDING-LEFT: 24px; font-weight:bold;'><a href="Pic_class.asp?bid=<%=rs("id")%>"><%=rs("board")%></a></td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
          <%
	rs.movenext
wend
%>
      </table>
      <%
end if
rs.close
set rs=nothing
%>
      &nbsp;</td>
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
    <td height="36" background="images/left_01.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;">图片推荐</td>
  </tr>
  <tr>
    <td height="163" align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE"><%
set rsp=Server.Createobject("Adodb.Recordset")
sql= "Select Top 2 Id,Name,Pic_slt,Tuijiang From Pic Where Tuijiang=1 order by id desc"
rsp.Open sql,Conn
if rsp.bof and rsp.eof then
	
else
%>
        <table width="161" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="161" height="8"></td>
          </tr>
          <tr>
            <td height="111" align="center"><a href="pic_info.asp?id=<%=rsp("id")%>"><img src="admin/<%=rsp("pic_slt")%>" width="150" height="120" border="0" style="border:1px solid #CCCCCC;"></a></td>
          </tr>
          <tr>
            <td height="20"><div align="center"><%=rsp("name")%></div></td>
          </tr>
          <% rsp.movenext %>
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td align="center"><a href="pic_info.asp?id=<%=rsp("id")%>"><img src="admin/<%=rsp("pic_slt")%>" width="150" height="120" border="0" style="border:1px solid #CCCCCC;"></a></td>
          </tr>
          <tr>
            <td height="20"><div align="center"><%=rsp("name")%></div></td>
          </tr>
        </table>
      <%
end if
rsp.close
set rsp=nothing
%></td>
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
    <td height="30" background="images/left_12.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px;">旅游工具</td>
  </tr>
  <tr>
    <td height="253" align="center" background="images/left_bgg.jpg" style="border-left:1px solid #9AD394;border-right:1px solid #9AD394"><table width="90%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><img src="Images/gj1.jpg" width="21" height="17" /></td>
        <td height="26" align="center"><a href="http://www.ctrip.com/supermarket/ctripMap/mapIndex.asp">电子地图</a></td>
        <td align="center"><img src="Images/gj2.jpg" width="21" height="17" /></td>
        <td height="26" align="center"><a href="http://www.ctrip.com/Destinations/weather/moreWeather.asp">天气预报</a></td>
      </tr>
      <tr>
        <td align="center"><img src="Images/gj3.jpg" width="21" height="17" /></td>
        <td height="26" align="center"><a href="#">航班查询</a></td>
        <td align="center"><img src="Images/gj4.jpg" width="21" height="17" /></td>
        <td height="26" align="center"><a href="http://www.ctrip.com/supermarket/train/trainsearch_1.asp">火车查询</a></td>
      </tr>
      <tr>
        <td align="center"><img src="Images/gj5.jpg" width="21" height="17" /></td>
        <td height="26" align="center"><a href="#">汇率查询</a></td>
        <td align="center"><img src="Images/gj6.jpg" width="21" height="17" /></td>
        <td height="26" align="center"><a href="list.asp?tp=76">旅游常识</a></td>
      </tr>
    </table>
        <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="23" align="center" style="border:1px solid #FDD0A0; background-color:#FFECD0; color:#FF6600; font-weight:bold;">旅游小常识</td>
          </tr>
          <tr>
            <td><table width="96%" border="0" cellspacing="0" cellpadding="0">
                <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=76 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr>
                  <td width="14" align="center">·</td>
                  <td height="24"><a href="show.asp?id=<%=rs("id")%>" target="_blank">
                    <% If rs("color")<>"" Then %>
                    <%=left(rs("bt"),14)%>
                    <% Else %>
                    <%=left(rs("bt"),14)%>
                    <% End If %>
                  </a></td>
                </tr>
                <% rs.movenext 
wend 
			 %>
            </table></td>
          </tr>
      </table></td>
  </tr>
  <tr>
    <td><img src="images/left_18.jpg" width="212" height="5" alt="" /></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>
