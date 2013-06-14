<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="212" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="36" background="images/left_01.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;"><a href="list.asp?tp=63"><font color="#FFFFFF">公告信息</font></a></td>
        </tr>
        <tr>
          <td height="163" align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE">
		  <table width="96%" border="0" cellspacing="0" cellpadding="0">
              <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=63 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
              <tr>
                <td height="25" style="border-bottom:1px dotted #D0EDC5;">
		· <a href="show.asp?id=<%=rs("id")%>" target="_blank">
                  <%=left(rs("bt"),14)%>
                </a></td>
              </tr>
              <% rs.movenext 
wend 
			 %>
            </table></td>
        </tr>
        <tr>
          <td height="62" align="center" background="images/left_03.jpg">
		  <!--<div align="center"><marquee direction="up" width="92%" height="76" scrollamount="2" id=info onMouseOver=info.stop() onMouseOut=info.start() >% Call index_gonggao() %>
              </marquee></div> -->
		  <img src="Images/qlwb.gif" width="179" height="39" /></td>
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
          <td><a href="http://ego.lywww.com/show.asp?id=1062" target="_blank"><img src="images/left_06.gif" alt="" width="212" height="52" border="0" /></a></td>
        </tr>
      </table>
      <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"></td>
        </tr>
      </table>
      <table width="212" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" background="images/left_12.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px;">旅游线路查询</td>
        </tr>
        <tr>
          <td height="244" align="center" background="images/left_bgg.jpg" style="border-left:1px solid #9AD394;border-right:1px solid #9AD394"><table width="88%" border="0" cellpadding="0" cellspacing="0">
            <form action="xlcx.asp" method="get" name="xlcx" target="_blank">
              <tr>
                <td width="69">搜索内容：</td>
                <td width="116" height="35"><input name="xlmc" type="text" id="xlmc" style="width:100px;" />
                    <font color="#FF0000">*</font></td>
              </tr>
              <tr>
                <td>线路类型：</td>
                <td height="35">
                  <select name="xllx" id="xlnx" style="width:100px">
                    <option value="1">精品线</option>
                    <option value="2">常规线</option>
                    <option value="all" selected="selected">不限</option>
                  </select></td>
              </tr>
              <tr>
                <td height="35" colspan="2" align="center"><input type="image" src="Images/sub_ly.gif" /></td>
              </tr>
            </form>
              
          </table>
            <table width="88%" border="0" cellspacing="2" cellpadding="5">
              <tr>
                <td align="center"><a href="http://www.51766.com/img/nslyq/" target="_blank"><img src="Images/pop/ytns.jpg" width="160" height="50" border="0" /></a></td>
              </tr>
              <tr>
                <td align="center"><a href="http://www.wulianshan.cn/" target="_blank"><img src="Images/pop/wls.jpg" width="160" height="50" border="0" /></a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td><img src="images/left_10.jpg" width="212" height="5" alt="" /></td>
        </tr>
      </table>
      <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"></td>
        </tr>
      </table>
      <table width="212" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" background="images/left_12.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px;"><a href="list.asp?tp=69"><font color="#FFFFFF">自驾游</font></a></td>
        </tr>
        <tr>
          <td height="244" align="center" valign="top" background="images/left_bgg.jpg" style="border-left:1px solid #9AD394;border-right:1px solid #9AD394"><table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="5"></td>
            </tr>
          </table>
            <table width="93%" border="0" cellspacing="0" cellpadding="2">
                                        <tr>
                                          <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 2 * from news where mytype=69 order by id desc"
rs.open sql,conn,1 
if not rs.eof or bof then
while not rs.eof 
%>
                                          <td align="center"><table border="0" style=" border:1px #EEE solid" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td><a href="show.asp?id=<%= rs("id") %>" target="_blank"><img  src="<%= rs("tu") %>" width="85" height="70" border="0" alt="<%= rs("bt") %>" /></a></td>
                                              </tr>
                                          </table></td>
                                          <% rs.movenext 
wend 
end if 
			 %>
                                        </tr>
            </table><table width="93%" border="0" cellspacing="0" cellpadding="0">
            <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=69 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
            <tr>
              <td height="25" style="border-bottom:1px dotted #D0EDC5;">
		· <a href="show.asp?id=<%=rs("id")%>" target="_blank">
                <%=left(rs("bt"),14)%>
              </a></td>
            </tr>
            <tr>
              <td height="1" colspan="2" align="center" background="img/ba.gif"></td>
            </tr>
            <% rs.movenext 
wend 
			 %>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/left_10.jpg" width="212" height="5" alt="" /></td>
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
              <td height="26" align="center"><a href="http://www.ctrip.com/supermarket/ctripMap/mapIndex.asp" target="_blank">电子地图</a></td>
              <td align="center"><img src="Images/gj2.jpg" width="21" height="17" /></td>
              <td height="26" align="center"><a href="http://www.ctrip.com/Destinations/weather/moreWeather.asp" target="_blank">天气预报</a></td>
            </tr>
            <tr>
              <td align="center"><img src="Images/gj3.jpg" width="21" height="17" /></td>
              <td height="26" align="center"><a href="http://www.elong.com/flights/" target="_blank">航班查询</a></td>
              <td align="center"><img src="Images/gj4.jpg" width="21" height="17" /></td>
              <td height="26" align="center"><a href="http://www.ctrip.com/supermarket/train/trainsearch_1.asp" target="_blank">火车查询</a></td>
            </tr>
            <tr>
              <td align="center"><img src="Images/gj5.jpg" width="21" height="17" /></td>
              <td height="26" align="center"><a href="http://tw.stock.yahoo.com/d/c/ex.php" target="_blank">汇率查询</a></td>
              <td align="center"><img src="Images/gj6.jpg" width="21" height="17" /></td>
              <td height="26" align="center"><a href="list.asp?tp=76" target="_blank">旅游常识</a></td>
            </tr>
          </table>
		  <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="23" align="center" style="border:1px solid #FDD0A0; background-color:#FFECD0; color:#FF6600; font-weight:bold;"><a href="list.asp?tp=76"><font color="#FF6600">旅游小常识</font></a></td>
              </tr>
            <tr>
              <td><table width="96%" border="0" cellspacing="0" cellpadding="0">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=76 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                  <tr>
                    <td height="24" style="border-bottom:1px dotted #D0EDC5;">
		· <a href="show.asp?id=<%=rs("id")%>" target="_blank">
                      <%=left(rs("bt"),14)%>
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
      <table width="212" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="36" background="images/left_20.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px; padding-bottom:2px;">推荐信息</td>
        </tr>
        <tr>
          <td align="center" style="border-left:4px solid #E0EFCE;border-right:4px solid #E0EFCE"><table width="80%" border="0" cellspacing="0" cellpadding="10">
              <tr>
                <td align="center"><a href="http://www.lygl.net/" target="_blank"><img src="images/left_23.jpg" alt="" width="156" height="91" border="0" /></a></td>
              </tr>
              <tr>
                <td align="center"><a href="http://www.fuhuapark.com/" target="_blank"><img src="images/left_26.jpg" alt="" width="156" height="63" border="0" /></a></td>
              </tr>
              <tr>
                <td align="center"><a href="http://www.dxdxg.com/" target="_blank"><img src="images/left_28.jpg" alt="" width="156" height="96" border="0" /></a></td>
              </tr>
              <tr>
                <td align="center"><a href="http://www.qingtianhe.cn/" target="_blank"><img src="images/left_30.jpg" alt="" width="156" height="91" border="0" /></a></td>
              </tr>
              <tr>
                <td align="center"><a href="http://www.xschg.china315.com/web/b/2004/11/7/xschg/index.htm" target="_blank"><img src="images/left_32.jpg" alt="" width="156" height="70" border="0" /></a></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/left_35.jpg" width="212" height="8" alt="" /></td>
        </tr>
      </table></td>
  </tr>
</table>
