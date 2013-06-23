<%
'#####################查询模块#####################'
Sub Index_select()
%>
<style type="text/css">
<!--
.boardMain {
	BORDER-RIGHT: #94DCFE 1px solid;
	BORDER-TOP: #94DCFE 1px solid;
	PADDING-BOTTOM: 5px;
	BORDER-LEFT: #94DCFE 1px solid;
	LINE-HEIGHT: 150%;
	PADDING-TOP: 5px;
	BORDER-BOTTOM: #94DCFE 1px solid;
}
.cardNormal {background-image: url(Images/2_r2_c5.gif);}
.cardSelected1 {background-image: url(Images/2_r2_c2.gif);COLOR: #ffffff;}
-->
</style>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>
<script language="javascript">
function checkform(){
if(ListItemForSale.shucity.value==''){
alert("请输入你所要查询的城市！");
ListItemForSale.shucity.focus();
return false;
}
if(ListItemForSale.arrive_date.value=='点击选择日期'){
alert("请选择入住日期！");
ListItemForSale.arrive_date.focus();
return false;
}
if(ListItemForSale.leave_date.value=='点击选择日期'){
alert("请选择退房日期！");
ListItemForSale.leave_date.focus();
return false;
}
}
</script>
<SCRIPT language=javascript>
 function secCard(n)
  {
	if(n==1)
	{
	   secTable.cells[0].className="cardSelected1";
	   secTable.cells[2].className="cardNormal";
	}
	if(n==2)
	{
	   secTable.cells[0].className="cardNormal";
	   secTable.cells[2].className="cardSelected1";
	}
  }
  function secBoard(n)
  {
    for(i=0;i<mainTable.tBodies.length;i++)
		mainTable.tBodies[i].style.display="none";
	mainTable.tBodies[n].style.display="";
  }
</SCRIPT>
<table width="270" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><TABLE class=cardFont id=secTable cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
          <TR align=middle>
            <TD class=cardSelected1 onclick=secCard(1);secBoard(0); width=132 height=30><div align="center">酒店查询</div></TD>
            <TD width=6 ></TD>
            <TD class=cardNormal onclick=secCard(2);secBoard(1); width=132 height=30><div align="center">航班查询</div></TD>
          </TR>
        </TBODY>
      </TABLE>
        <table class=boardMain id=mainTable cellspacing=0 cellpadding=0 width="100%" border=0>
          <tbody>
            <tr>
              <td bgcolor="#D9F5FF">
			  
			  <table width="268" height="210" border="0" cellpadding="0" cellspacing="3">
  <form action=SearchResult.asp method=post name=ListItemForSale onSubmit="return checkform();" target="_blank"><tr>
    <td width="263" height="25"><img src="images/in4_03.gif" width="21" height="20" align="absmiddle"><font color=#006699>输入城市：</font>
        <input name="shucity" type="text" id="shucity" style="width:130px;"> <font color="#FF0000">*</font></td>
  </tr>
  <tr>
    <td height="25"><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">价格范围：
          <select name="jiage" id="jiage" style="width:130px">
<option value="stageprice &amp;gt;= 0 and stageprice &amp;lt;= 250">250以下</option>
<option value="stageprice &gt;= 250 and stageprice &lt;= 400">250-400</option>
<option value="stageprice &gt;= 400 and stageprice &lt;= 600">400-600</option>
<option value="stageprice &gt;= 600 and stageprice &lt;= 800">600-800</option>
<option value="stageprice &gt;= 1200">1200以上</option>
<option value="all" selected>不限</option>
          </select>
    </font></td>
  </tr>
  <tr>
    <td height="25"><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">选择星级：
          <select name="star" style="width:130px">
            <option value="all" selected>不限</option>
            <option value="5">5星级</option>
            <option value="4">4星级</option>
            <option value="3">3星级</option>
            <option value="2">2星级</option>
            <option value="1">1星级</option>
            <option value="0">青年旅馆</option>
            <option value="9">客栈</option>
          </select>
    </font></td>
  </tr>
  <tr>
    <td height="25"><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">入住日期：
          <input name="arrive_date" type="text" id="arrive_date" size="15"value="点击选择日期" onfocus="javascript:setday(this)">
          </font></td>
  </tr>
  <tr>
    <td height="25"><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">离店日期：
          <input name="leave_date" type="text" id="leave_date" size="15" value="点击选择日期" onfocus="javascript:setday(this)">
          </font></td>
  </tr>
  <tr>
    <td height="25" style="color:#006699;"><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">酒店名称：
        <input name="name" type="text" id="name" size="20">        </td>
  </tr>
  <tr>
    <td height="25" align="center"><input name="Button1" type="image" src="Images/2_r4_c3.gif"></td>
  </tr>
</form></table></td>
            </tr>
          </tbody>
          <tbody style="DISPLAY: none">
            <tr>
              <td bgcolor="#D9F5FF"><table width="268" height="210" border="0" cellpadding="0" cellspacing="3">
<form action="Searchticket.asp" method="post" name="form1" target="_blank">
<tr>
                  <td width="264"><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">出发城市：
                        <select name="chufachenshi" id="chufachenshi">
<%
set rs=server.createobject("adodb.recordset")
rs.open "select DISTINCT chufachenshi from dingbiao",conn,1,1
do while not rs.eof %>
                          <option value="<%=rs("chufachenshi")%>"><%=rs("chufachenshi")%></option>
                          <%
rs.movenext
loop
rs.close
set rs=nothing
%>
                        </select>
                        <font color="red"> *</font></font></td>
                </tr>

                <tr>
                  <td><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">目的城市：
                        <select name="mudichenshi" id="mudichenshi">
                          <%
set rs=server.createobject("adodb.recordset")
rs.open "select DISTINCT mudichenshi from dingbiao",conn,1,1
do while not rs.eof %>
                          <option value="<%=rs("mudichenshi")%>"><%=rs("mudichenshi")%></option>
                          <%
rs.movenext
loop
rs.close
set rs=nothing
%>
                        </select>
                        <font color="red"> *</font></font></td>
                </tr>
                <tr>
                  <td><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">航空公司：      
                      <select name="hankonggongsi" id="hankonggongsi">
<option value="" selected>不限</option>
<%
set rs=server.createobject("adodb.recordset")
rs.open "select DISTINCT hankonggongsi from dingbiao",conn,1,1
do while not rs.eof %>
                        <option value="<%=rs("hankonggongsi")%>"><%=rs("hankonggongsi")%></option>
                        <%
rs.movenext
loop
rs.close
set rs=nothing
%>
                      </select>
                      </font></td>
                </tr>
                <tr>
                  <td><font color=#006699>
                    <img src="images/in4_03.gif" width="21" height="20" align="absmiddle">单程/往返：
                      <select name="type" id="type">
                      <option value="单程" selected>单程</option>
                      <option value="往返">往返</option>
                      <option value="联程">联程</option>
                    </select>
                  </font></td>
                </tr>
                <tr>
                  <td><font color=#006699><img src="images/in4_03.gif" width="21" height="20" align="absmiddle">航段类型：
                      <input name="hdtype" type="radio" value="直达">
直达　
<input name="hdtype" type="radio" value="" checked>
所有</font> </td>
                </tr>
                <tr>
                  <td><img src="images/in4_03.gif" width="21" height="20" align="absmiddle"><font color=#006699>航班类型：</font>
                    <input name="hbtype" type="radio" value="1" checked>
<font color=#006699>国内　 
<input name="hbtype" type="radio" value="2">
国际</font></td>
                </tr>
                <tr>
                  <td align="center"><input name="Button2" type="image" src="Images/2_r4_c3.gif"> </td>
                </tr>
              </form>
</table></td>
            </tr>
          </tbody>
      </table></td>
  </tr>
</table>
<%
End Sub
'#######################新闻##########################
Sub Index_News()
%>
<%set rsn=server.createobject("adodb.recordset")
sql="select top 11 id,title from news ORDER BY id DESC"
rsn.open sql,conn,1,1
if Rsn.eof or Rsn.bof then
response.write"<div align='center'>还没有添加信息<div>"
end if 
do while not rsn.eof
%>
                              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="6%" height="18">
                                    <div align="center"><a href="News/News_<%response.write rsn(0)%>.html" title="<%=rsn("title")%>"> </a><img src="images/doc.gif" width="10" height="12" align="top"></div></td>
                                  <td align="left"><a href="News/News_<%response.write rsn(0)%>.html" title="<%=rsn("title")%>">
<%if len(rsn("title"))>18 then%>
<%=left(rsn("title"),18)%>...
<%else%>
<%=rsn("title")%>
<%end if%>
                                  </a></td>
                                </tr>
                              </table>
<% Rsn.movenext  
loop  
Rsn.close 
%>
<%
End Sub
'#######################导游模块######################
Sub Index_Guide()
%>
<table width="100%" height="25"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7">
  <tr>
    <td width="34%"><div align="center">姓名</div></td>
    <td width="25%"><div align="center">性别</div></td>
    <td width="41%"><div align="center">会员类型</div></td>
  </tr>
</table>
<table width="100%"  border="0" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000">
                  <%
	topb="select top 6 id,d_name,sex,vip from daoyou"
	set vrs=conn.execute (topb)
	while not vrs.eof
	%>
                  <tr>
                    <td width="34%" height="21" valign="middle"><div align="center"><a href="daoyouinfo.asp?id=<%=vrs("id")%>" target =_blank><%=vrs("d_name")%></a></div></td>
                    <td width="25%"><div align="center"><font color="#666666">
                        <%if vrs("sex")="1" then 
      		response.write "男"
      	elseif vrs("sex")="0" then
      		response.write "女"
      	      	end if
      %>
                    </font></div></td>
                    <td width="41%"><div align="center">
                    <font color="#006699"><%if vrs("vip")="1" then 
      		response.write "普通会员"
      	elseif vrs("vip")="2" then
      		response.write "高级会员"
      	elseif vrs("vip")="3" then
      		response.write "铂金会员"
      	      	end if
      %></font></div></td></tr>
                  <tr bgcolor="#CACACA">
                    <td height="1" colspan="3" valign="top" bgcolor="#E8E8E8"></td>
                  </tr>
<%
	vrs.movenext
	wend
	vrs.close
		%></table>
<%
End Sub
'#######################酒店模块####################
Sub Index_hotel()
sql="select top 4 * from Hotelb where Audit=True"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
%>
<script language="javascript">
function OpenSmallWindows(strURL)
{
window.open (strURL,"_blank",
"status=no,resizable=0,toolbar=no,menubar=no,scrollbars=no,width=780,height=300,left=2,top=100");
}
</script>
<table width="100%" height="140" border="0" align="center" cellpadding="0" cellspacing="0">
<%
n=0
do while not rs.eof
set rs_s=server.createobject("adodb.recordset")
sql="select ShengNo,shengname from szSheng where ShengNo='"&rs("province")&"'"
rs_s.open sql,conn,1,1
shengname=rs_s("shengname")
%>		  
<tr>
                <td height="136" align="center"  valign="top"><TABLE width=94% border=0 align="left" cellPadding=0 cellSpacing=0>
                    <TBODY>
                      <TR align=middle>
                        <TD colSpan=2 height=24>
                          <TABLE width="180" border=1 cellPadding=0 cellSpacing=0 bordercolor=#9AD8EC borderColorDark=#ffffff>
                            <TBODY>
                              <TR>
                                <TD width=207 height="22" align=middle bgcolor="#EEFAFF">
                                  <div align="center"><font color=#006699>
                                    <%if len(rs("c_name"))>17 then%>
                                    <%=left(rs("c_name"),15)%>...
                                    <%else%>
                                    <%=rs("c_name")%>
                                    <%end if%>
                                </font></div></TD>
                              </TR>
                            </TBODY>
                        </TABLE></TD>
                      </TR>
                      <TR>
                        <TD align=middle width=81 height=85>
                          <TABLE width=77 border=0 align="center" cellPadding=0 cellSpacing=0>
                            <TBODY>
                              <TR>
                                <TD width=77><img src="admin\<%=rs("logurl")%>" width="77" height="72" border="0"></TD>
                              </TR>
                            </TBODY>
                        </TABLE></TD>
                        <TD>
                          <TABLE cellSpacing=0 cellPadding=0 border=0>
                            <TBODY>
                              <TR>
                                <TD width=35 height=22><font color=#006699>省份:</font></TD>
                                <TD><font color=#006699><%=shengname%></font></TD>
                              </TR>
                              <TR>
                                <TD height=22><font color=#006699>县市:</font></TD>
                                <TD><font color=#006699><%=rs("city")%></font></TD>
                              </TR>
                              <TR>
                                <TD height=22><font color=#006699>星级:</font></TD>
                                <TD><%if rs("level")="无标准" then 
response.write "无标准"
elseif rs("level")="一星级" then
response.write "<img src=Star/1x.gif>"	
elseif rs("level")="准一星级" then
response.write "<img src=Star/1x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="二星级" then
response.write "<img src=Star/2x.gif>"	
elseif rs("level")="准二星级" then
response.write "<img src=Star/2x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="三星级" then
response.write "<img src=Star/3x.gif>"	
elseif rs("level")="准三星级" then
response.write "<img src=Star/3x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="四星级" then
response.write "<img src=Star/4x.gif>"	
elseif rs("level")="准四星级" then
response.write "<img src=Star/4x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="五星级" then
response.write "<img src=Star/5x.gif>"	
elseif rs("level")="准五星级" then
response.write "<img src=Star/5x.gif>"
response.write"<img src=Star/z.gif>"
end if
%></TD>
                              </TR>
                            </TBODY>
                        </TABLE></TD>
                      </TR>
                      <TR>
                        <TD align=middle colSpan=2 height=21>
                          <TABLE width=100% border=0 align="center" cellPadding=0 cellSpacing=0>
                            <TBODY>
                              <TR align=middle>
                                <TD><div align="left"><a href="Hotel/Hotel_<%=rs("id")%>.html"><img src="images/b1.gif" border="0"></a></div></TD>
                                <TD><div align="right"><a href="#" onclick="Javascript:OpenSmallWindows('HotelRoomAll.asp?id=<%=rs("Id")%>')" ><img src="images/b2.gif" border="0"></a></div></TD>
                              </TR>
                            </TBODY>
                        </TABLE></TD>
                      </TR>
                    </TBODY>
                </TABLE></td>
                <%
rs_s.close
rs.movenext
if rs.eof or rs.bof then 
response.write "<td width='210'></td>"
exit do
end if
set rs_s=server.createobject("adodb.recordset")
sql="select ShengNo,shengname from szSheng where ShengNo='"&rs("province")&"'"
rs_s.open sql,conn,1,1
shengname=rs_s("shengname")
%>
                
                <td  valign="top"><TABLE width=94% border=0 align="right" cellPadding=0 cellSpacing=0>
                  <TBODY>
                    <TR align=middle>
                      <TD colSpan=2 height=24>
                        <TABLE width="180" border=1 cellPadding=0 cellSpacing=0 bordercolor=#9AD8EC borderColorDark=#ffffff>
                          <TBODY>
                            <TR>
                              <TD width=207 height="22" align=middle bgcolor="#EEFAFF">
                                <div align="center"><font color=#006699>
                                  <%if len(rs("c_name"))>17 then%>
                                  <%=left(rs("c_name"),15)%>...
                                  <%else%>
                                  <%=rs("c_name")%>
                                  <%end if%>
                              </font></div></TD>
                            </TR>
                          </TBODY>
                      </TABLE></TD>
                    </TR>
                    <TR>
                      <TD align=middle width=81 height=85>
                        <TABLE width=77 border=0 align="center" cellPadding=0 cellSpacing=0>
                          <TBODY>
                            <TR>
                              <TD width=77><img src="admin\<%=rs("logurl")%>" width="77" height="72" border="0"></TD>
                            </TR>
                          </TBODY>
                      </TABLE></TD>
                      <TD>
                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                          <TBODY>
                            <TR>
                              <TD width=35 height=22><font color=#006699>省份:</font></TD>
                              <TD><font color=#006699><%=shengname%></font></TD>
                            </TR>
                            <TR>
                              <TD height=22><font color=#006699>县市:</font></TD>
                              <TD><font color=#006699><%=rs("city")%></font></TD>
                            </TR>
                            <TR>
                              <TD height=22><font color=#006699>星级:</font></TD>
                              <TD><%if rs("level")="无标准" then 
response.write "无标准"
elseif rs("level")="一星级" then
response.write "<img src=Star/1x.gif>"	
elseif rs("level")="准一星级" then
response.write "<img src=Star/1x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="二星级" then
response.write "<img src=Star/2x.gif>"	
elseif rs("level")="准二星级" then
response.write "<img src=Star/2x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="三星级" then
response.write "<img src=Star/3x.gif>"	
elseif rs("level")="准三星级" then
response.write "<img src=Star/3x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="四星级" then
response.write "<img src=Star/4x.gif>"	
elseif rs("level")="准四星级" then
response.write "<img src=Star/4x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="五星级" then
response.write "<img src=Star/5x.gif>"	
elseif rs("level")="准五星级" then
response.write "<img src=Star/5x.gif>"
response.write"<img src=Star/z.gif>"
end if
%></TD>
                            </TR>
                          </TBODY>
                      </TABLE></TD>
                    </TR>
                    <TR>
                      <TD align=middle colSpan=2 height=21>
                        <TABLE width=100% border=0 align="center" cellPadding=0 cellSpacing=0>
                          <TBODY>
                            <TR align=middle>
                              <TD><div align="left"><a href="Hotel/Hotel_<%=rs("id")%>.html"><img src="images/b1.gif" border="0"></a></div></TD>
                              <TD><div align="right"><a href="#" onclick="Javascript:OpenSmallWindows('HotelRoomAll.asp?id=<%=rs("Id")%>')" ><img src="images/b2.gif" border="0"></a></div></TD>
                            </TR>
                          </TBODY>
                      </TABLE></TD>
                    </TR>
                  </TBODY>
                </TABLE></td>
</tr>
<tr>
<td height="2" colspan="4"></td>
</tr>
<%

rs.movenext                                                 
loop
rs_s.close
rs.close
%>
</table>
<%
End Sub
'########################推荐酒店############
Sub Index_TopHotel()
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="162" height="20"> 城市</td>
<td width="356"> 酒店名称</td>
<td width="105"> 星级</td>
<td width="142"> 会员价</td>
</tr>
<%
sql="select top 12 * from Hotelb where Audit=True order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn
n=0
do while not rs.eof
c_id=rs("id")
set rsroom=server.createobject("adodb.recordset")
sqltext="select top 1 c_id,stageprice from roomb where c_id="&c_id&"" 
rsroom.open sqltext,conn
if rsroom.eof and rsroom.bof then
stageprice="NoRoom"
Else
stageprice="＄"&rsroom("stageprice")
End if
%>
<tr>
<td height="20">[<%=rs("city")%>]</td>
<td><font color="#666666">
<a href="Hotel/Hotel_<%=rs("id")%>.html">
<%if len(rs("c_name"))>9 then%>
<%=left(rs("c_name"),9)%>...
<%else%>
<%=rs("c_name")%>
<%end if%>
</a>
</font></td>
<td>
<%if rs("level")="无标准" then 
response.write "无标准"
elseif rs("level")="一星级" then
response.write "<img src=Star/1x.gif>"	
elseif rs("level")="准一星级" then
response.write "<img src=Star/1x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="二星级" then
response.write "<img src=Star/2x.gif>"	
elseif rs("level")="准二星级" then
response.write "<img src=Star/2x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="三星级" then
response.write "<img src=Star/3x.gif>"	
elseif rs("level")="准三星级" then
response.write "<img src=Star/3x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="四星级" then
response.write "<img src=Star/4x.gif>"	
elseif rs("level")="准四星级" then
response.write "<img src=Star/4x.gif>"
response.write"<img src=Star/z.gif>"
elseif rs("level")="五星级" then
response.write "<img src=Star/5x.gif>"	
elseif rs("level")="准五星级" then
response.write "<img src=Star/5x.gif>"
response.write"<img src=Star/z.gif>"
end if
%>
</td>
<td><b><font color="red"><%=stageprice%></font></b></td>
</tr>
<tr>
  <td height="1" colspan="4" bgcolor="#CCCCCC"></td>
  </tr>
<%
rs.movenext                                                 
loop
rs.close
rsroom.close
%>
</table>
<%
End Sub
'#############################机票
Sub Index_JiPiao()
%>
<table width="100%" height="25" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7">
<tr>
<td width="35%"><div align="center">航程</div></td>
<td width="34%"><div align="center">航段类型</div></td>
<td width="31%"><div align="center">实付价</div></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<%
set Rsf=server.createobject("adodb.recordset")
sqltext="select top 6 id,chufachenshi,mudichenshi,hdtype,shichanjia from dingbiao order by id DESC" 
Rsf.open sqltext,conn,1,1
if Rsf.eof then
response.write "<table><tr><td>暂时还没有任何票信息</td></tr></table>"
response.end
end if
if not Rsf.eof then
do while not Rsf.eof
%>
<tr bgcolor="#FFFFFF">
<td width="35%" height="21" align="center" bgcolor="#FFFFFF"><a href="Ticketinfo.asp?id=<%=Rsf("id")%>"><%=Rsf("chufachenshi")%>-<%=Rsf("mudichenshi")%></a></td>
<td width="34%" align="center" bgcolor="#FFFFFF"><%=Rsf("hdtype")%></td>
<td width="31%" align="center"><font color="Red">＄<%=Rsf("shichanjia")%></font></td>
</tr>
<tr bgcolor="#eeeeee">
  <td height="1" colspan="3" ></td>
  </tr>
<%
Rsf.movenext
Loop
End if
Rsf.close
%>
</table>
<%
End Sub
'#######################线路###
Sub Index_Xl()
%>
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
<%
sql="select top 3 id,x_jingdiantupian,x_name,x_baojia,x_shijian,x_leixun from xianlu where Audit=True order by id DESC"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
n=0
do while not rs.eof 
%>
<tr><td width="34%" rowspan="4"><TABLE width=130 height="89" border=0 cellPadding=0 cellSpacing=0><TBODY>
<TR>
<TD width="122"><div align="center"><img src="admin/<%=rs("x_jingdiantupian")%>" width="122" height="86" border="0"></div></TD>
<TD width="10"><IMG src="images/mfk_97.gif" width="8" height="88"></TD>
</TR></TBODY></TABLE></td><td width="16%" height="18">线路名称：</td><td colspan="3"><font color="#006699">
<%if len(rs("x_name"))>13 then%>
<%=left(rs("x_name"),13)%>...
<%else%>
<%=rs("x_name")%>
<%end if%>
</font></td></tr><tr><td height="18">特惠价格：</td><td width="15%"><%=rs("x_baojia")%></td>
<td width="16%"> 所需时日： </td><td width="19%"><%=rs("x_shijian")%></td></tr><tr>
<td height="18"> 线路类型：</td><td height="18"><%=rs("x_leixun")%></td>
<td height="18">&nbsp;</td><td height="18">&nbsp;</td>
</tr><tr>
<td height="27" colspan="4"><table width="97%" height="22" border="0" cellpadding="0" cellspacing="0"><tr>
<td><div align="left"><a href="Xl/Xl_<%=rs("id")%>.html"><img src="images/9.png" width="67" height="21" border="0"></a></div></td>
<td><div align="right"><a href="giveme.asp?id=<%=rs("id")%>"><img src="images/10.png" width="67" height="21" border="0"></a></div></td>
</tr></table></td></tr><tr bgcolor="#CCCCCC"><td height="1" colspan="5"></td></tr>
<%
Rs.movenext
Loop
Rs.close
%>
</table>
<%
End Sub
'####################推荐线路####
Sub Index_TopXl()
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr><td width="821" height="20"> 名称</td><td width="152"> 会员价</td></tr>
<%
sql="select top 12 id,x_name,x_baojia from xianlu where Audit=True order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
n=0
do while not rs.eof
%>
<tr><td height="20"><a href="Xl/Xl_<%=rs("id")%>.html">
<%if len(rs("x_name"))>19 then%>
<%=left(rs("x_name"),19)%>...
<%else%>
<%=rs("x_name")%>
<%end if%>
</a></td><td>
<font color="red">
<%=rs("x_baojia")%>
</font></td></tr><tr bgcolor="#cccccc"><td height="1" colspan="2"></td></tr>
<%
rs.movenext                                                 
loop
rs.close
%>
</table>
<%
End Sub
'#####################################图片信息#######
Sub index_pic() %>
<table width="100%" height="25"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7">
<tr><td width="59%"><div align="center">图片名称</div></td><td width="41%"><div align="center">图片类别</div></td></tr></table><table width="100%"  border="0" align="center" cellpadding="1" cellspacing="0" bordercolor="#000000">
<%
	topb="select top 6 id,name,leixing from pic"
	set vrs=conn.execute (topb)
	while not vrs.eof
	%><tr><td width="59%" height="21"><div align="center"><a href="pic_info.asp?id=<%=vrs("id")%>" target =_blank>
<%if len(vrs("name"))>9 then%>
<%=left(vrs("name"),9)%>...
<%else%>
<%=vrs("name")%>
<%end if%></a></div></td><td width="41%"><div align="center">
<%
set rs=server.createobject("adodb.recordset")
sql="select * from picboard where id ="&vrs("leixing")&""
rs.open sql, conn, 1, 1
if not rs.eof then
response.write "<center><font color=#006699>"&rs("board")&"</font></center>"
end if
rs.close
%>
</div></td></tr><tr bgcolor="#CACACA"><td height="1" colspan="2" valign="top" bgcolor="#E8E8E8"></td></tr>
<%
	vrs.movenext
	wend
	vrs.close
%></table>
<% End Sub
'##############################公告###########
Sub index_gonggao()
sql="select gonggao from config"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
if rs.eof then
response.write "暂时还没有任何公告!"
Else
response.write ""&rs("gonggao")&""
end if
rs.close
End Sub
%>

