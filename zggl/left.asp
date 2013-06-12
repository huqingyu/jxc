<div style="width:212px; padding-right:5px;">
	<div class="J_left1">
		<div class="J_left_header">旅游工具</div>
		<div style="border:1px solid #6699CC;">
			<table width="200">
            <tr>
              <td><img src="Images/gj1.jpg" width="21" height="17" /></td>
              <td height="26"><a href="http://www.ctrip.com/supermarket/ctripMap/mapIndex.asp" target="_blank">电子地图</a></td>
              <td><img src="Images/gj2.jpg" width="21" height="17" /></td>
              <td height="26"><a href="http://www.ctrip.com/Destinations/weather/moreWeather.asp" target="_blank">天气预报</a></td>
            </tr>
            <tr>
              <td><img src="Images/gj3.jpg" width="21" height="17" /></td>
              <td height="26"><a href="http://www.elong.com/flights/" target="_blank">航班查询</a></td>
              <td><img src="Images/gj4.jpg" width="21" height="17" /></td>
              <td height="26"><a href="http://www.ctrip.com/supermarket/train/trainsearch_1.asp" target="_blank">火车查询</a></td>
            </tr>
            <tr>
              <td><img src="Images/gj5.jpg" width="21" height="17" /></td>
              <td height="26"><a href="http://tw.stock.yahoo.com/d/c/ex.php" target="_blank">汇率查询</a></td>
              <td><img src="Images/gj6.jpg" width="21" height="17" /></td>
              <td height="26"><a href="list.asp?tp=76" target="_blank">旅游常识</a></td>
            </tr>
			</table>
			<div style="margin-top:20px;"></div>
            <table width="200">
              <tr>
                <td style="border-bottom:1px solid #9AD394; color:#FF6600; font-weight:bold;text-align:center"><a href="list.asp?tp=76">旅游小常识</a>
				</td>
              </tr>
              <tr>
                <td><table width="96%" border="0" cellspacing="0" cellpadding="0">
                    <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=76 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                    <tr>
                      <td height="24" style="border-bottom:1px dotted #D0EDC5;"> · <a href="show.asp?id=<%=rs("id")%>" target="_blank"> <%=left(rs("bt"),14)%> </a></td>
                    </tr>
                    <% rs.movenext 
wend 
			 %>
                </table></td>
              </tr>
          </table>
		</div>
	</div>
	<div class="J_left1">
		<div class="J_left_header">推荐信息</div>
		<div style="border:1px solid #6699CC;text-align:center">
		<ul>
			<li><a href="http://www.lygl.net/" target="_blank"><img src="images/left_23.jpg" alt="" width="156" border="0" /></a></li>
			<li><a href="http://www.fuhuapark.com/" target="_blank"><img src="images/left_26.jpg" alt="" width="156" border="0" /></a></li>
			<li><a href="http://www.dxdxg.com/" target="_blank"><img src="images/left_28.jpg" alt="" width="156" border="0" /></a></li>
			<li><a href="http://www.qingtianhe.cn/" target="_blank"><img src="images/left_30.jpg" alt="" width="156" border="0" /></a></li>
			<li><a href="http://www.xschg.china315.com/web/b/2004/11/7/xschg/index.htm" target="_blank"><img src="images/left_32.jpg" alt="" width="156" border="0" /></a>
			</li>
		</div>		
	</div>
</div>