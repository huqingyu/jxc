<!DOCTYPE HTML>
<html>
<!--#include file="common/conn.asp"-->
<!--#include file="common/webconfig.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<meta name="author" content="huqingyu@gmail.com,浙林龙哥" />
<meta name="Copyright" content="seirsoft.com" />
<meta name="description" content="中国国旅-CITS" />
<meta content="中国国旅-CITS|中国国旅" name="keywords" />
<title>中国国旅-CITS</title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style1.css" rel="stylesheet" />
<script src="/js/jq1.3.2.js"></script>
</head>
<body>
<div id="J_page" class="w980 center">


<table width="980" border="0" align="center" cellpadding="3" cellspacing="0">
  <tr>

    <td valign="top" bgcolor="#FFFFFF"><table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
	  <form action="xlcx.asp" method="get" name="xlcx" target="_blank">
        <tr>
          <td width="7%" align="center"><img src="img/searchs.gif" tppabs="/img/searchs.gif" width="11" height="11"></td>
          <td width="23%"><span class="menu1">线路查询</span><span class="word1"> 关键字：</span></td>
          <td width="59%"><input name="xlmc" type="text" id="xlmc" style="width:100px;" />
            <span class="word1">&nbsp;&nbsp;&nbsp;范围：</span>
            <select name="xllx" id="xlnx" style="width:100px">
                <option value="1">精品线</option>
                <option value="2">常规线</option>
                <option value="all" selected="selected">不限</option>
              </select></td>
          <td width="11%"><input  name='search' type="image" id='Login' value="查询" src="img/searchb.gif" align="middle" width="48" height="19" tppabs="/img/searchb.gif">		  </td>
        </tr>
		</form>
    </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="top"><table width="50%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="3"><img src="img/abroad.gif" tppabs="/img/abroad.gif" width="240" height="32" border="0" usemap="#Map7"></td>
            </tr>
            <tr>
              <td width="1" bgcolor="#e6e6e6"></td>
              <td align="left"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from xianlu where x_leiid=14 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),11)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
              <td width="1" bgcolor="#e6e6e6"></td>
            </tr>
            <tr>
              <td height="1" colspan="3" bgcolor="#e6e6e6"></td>
            </tr>
          </table></td>
          <td align="center" valign="top"><table width="50%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td colspan="3"><img src="img/home.gif" tppabs="/img/home.gif" width="240" height="32" border="0" usemap="#Map8"></td>
            </tr>
            <tr>
              <td width="1" bgcolor="#e6e6e6"></td>
              <td align="left"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from xianlu where x_leiid=13 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),11)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
              <td width="1" bgcolor="#e6e6e6"></td>
            </tr>
            <tr>
              <td height="1" colspan="3" bgcolor="#e6e6e6"></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table border="0" align="center" cellpadding="5" cellspacing="0">
        <tr>
          <td align="center"><a href="http://www.hncits.org/Xl/Xl_305.html" target="_blank"><img src="/img/guonei.gif" width="240" height="100" border="0"></a></td>
          <td align="center"><a href="http://www.hncits.org/show.asp?id=1300" target="_blank"><img src="/img/chujing.gif" width="240" height="100" border="0"></a></td>
        </tr>
      </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" valign="top"><table width="50%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="3"><img src="img/province.gif" tppabs="/img/province.gif" width="240" height="32" border="0" usemap="#Map9"></td>
              </tr>
              <tr>
                <td width="1" bgcolor="#e6e6e6"></td>
                <td align="left"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from xianlu where x_leiid=12 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),11)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
                <td width="1" bgcolor="#e6e6e6"></td>
              </tr>
              <tr>
                <td height="1" colspan="3" bgcolor="#e6e6e6"></td>
              </tr>
          </table></td>
          <td align="center" valign="top"><table width="50%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="3"><img src="img/dijie.gif" tppabs="/img/dijie.gif" width="240" height="33" border="0" usemap="#Map10"></td>
              </tr>
              <tr>
                <td width="1" bgcolor="#e6e6e6"></td>
                <td align="left"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from xianlu where x_leiid=20 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),11)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
                <td width="1" bgcolor="#e6e6e6"></td>
              </tr>
              <tr>
                <td height="1" colspan="3" bgcolor="#e6e6e6"></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="488" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><a href="hotel.html"><img src="images/body3_05.jpg" alt="" width="488" height="37" border="0"></a></td>
          </tr>
          <tr>
            <td width="488" height="124" valign="top" style="border-left:1px solid #79D4E9;border-right:1px solid #79D4E9">
			<!--酒店开始 -->
			<table border="0" align="center" cellpadding="5" cellspacing="0">
<%sql="select top 4 * from hotelb order by id asc"
set rshotel=conn.execute(sql)
if not(rshotel.bof and rshotel.eof) then
%>
              <tr>
<%
i=0
do while not rshotel.eof
i=i+1
set rs_s=server.createobject("adodb.recordset")
sql="select ShengNo,shengname from szSheng where ShengNo='"&rshotel("province")&"'"
rs_s.open sql,conn,1,1
shengname=rs_s("shengname")
%>

                <td align="center"  valign="top">
<!--start hotel-->

<TABLE width="225" border=0 align="left" cellPadding=0 cellSpacing=4 style="border:1px #F3F3F3 solid">
                    
                      
                      <tr>
                        <TD width="97" align=middle><TABLE border=0 align="center" cellPadding=0 cellSpacing=0>
                            
                              <tr>
                                <TD width=77><a href="Hotel/Hotel_<%=rshotel("id")%>.html"><img src="admin/<%=trim(rshotel("logurl"))%>" width="103" height="82" border="0"></a></td>
                              </tr>
                            
                        </TABLE>                        </td>
                        <TD width="109" align=center><TABLE width="109" border=0 cellPadding=2 cellSpacing=2>
                          
                            <tr>
                              <TD height="22" align="center" bgcolor="#F5FBFE"><a href="Hotel/Hotel_<%=rshotel("id")%>.html"><font color=#006699><%=trim(rshotel("c_name"))%></font></a></td>
                            </tr>
                            <tr>
                              <TD height="22" align="center" bgcolor="#F5FBFE"><font color=#006699><%=shengname%></font></td>
                            </tr>
                            <tr>
                              <TD height="22" align="center" bgcolor="#F5FBFE"><font color=#006699><%=rshotel("city")%></font></td>
                            </tr>
                            <tr>
                              <TD height="22" align="center" bgcolor="#F5FBFE"><%if rshotel("level")="无标准" then 
response.write "无标准"
elseif rshotel("level")="一星级" then
response.write "<img src=Star/1x.gif>"	
elseif rshotel("level")="准一星级" then
response.write "<img src=Star/1x.gif>"
response.write"<img src=Star/z.gif>"
elseif rshotel("level")="二星级" then
response.write "<img src=Star/2x.gif>"	
elseif rshotel("level")="准二星级" then
response.write "<img src=Star/2x.gif>"
response.write"<img src=Star/z.gif>"
elseif rshotel("level")="三星级" then
response.write "<img src=Star/3x.gif>"	
elseif rshotel("level")="准三星级" then
response.write "<img src=Star/3x.gif>"
response.write"<img src=Star/z.gif>"
elseif rshotel("level")="四星级" then
response.write "<img src=Star/4x.gif>"	
elseif rshotel("level")="准四星级" then
response.write "<img src=Star/4x.gif>"
response.write"<img src=Star/z.gif>"
elseif rshotel("level")="五星级" then
response.write "<img src=Star/5x.gif>"	
elseif rshotel("level")="准五星级" then
response.write "<img src=Star/5x.gif>"
response.write"<img src=Star/z.gif>"
end if
%></td>
                            </tr>
                          
                        </TABLE></td>
                      </tr>
                    
                </TABLE>		</td>
<!--end hotel-->
<%
if (i mod 2)=0 then response.write "</tr><tr>"
rshotel.movenext
loop
end if%>
            </table>
			<!--酒店结束 -->
            </td>
          </tr>
          <tr>
            <td><img src="images/body3_07.jpg" width="488" height="6" alt=""></td>
          </tr>
      </table><table width="488" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><a href="list.asp?tp=67"><img src="images/body3_01.jpg" alt="" width="488" height="35" border="0"></a></td>
          </tr>
          <tr>
            <td height="200" align="center" style="border-left:1px solid #FF8D87;border-right:1px solid #FF8D87"><% set rs=server.createobject("adodb.recordset") 
	sql="select top 4 * from news where tu<>'' and mytype=67 order by id desc"
rs.open sql,conn,1
if not rs.eof then
 %>
                <table border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <%i=0
  do while not rs.eof
  i=i+1
  %>
                    <td align="center"><table width="117" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center"><table width="106" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td><a href="show.asp?id=<%=rs("id")%>" target="_blank"><img  src="<%=rs("tu")%>" width="105" height="75" border="0" style="border:1px solid #CCCCCC;"></a></td>
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="24" align="center"><a href="show.asp?id=<%=rs("id")%>"><%=left(rs("bt"),8)%></a></td>
                        </tr>
                    </table></td>
                    <%
rs.movenext
if i>=6 then exit do
loop%>
                  </tr>
                </table>
            <%end if %><table width="475" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="260" height="26" style="border:1px solid #FEC1BF; background-color:#FFECEA; color:#FF3333; font-weight:bold; padding-left:10px;"><marquee height=1 width=8 SCROLLAMOUNT=3000 SCROLLDELAY=20000>
</MARQUEE><a href="/list.asp?tp=70"><font color="#FF3333">旅游指南</font></a></td>
                    <td width="5" rowspan="2"><img src="Images/ba.gif" width="6" height="6"></td>
                    <td width="260" height="26" style="border:1px solid #FEC1BF; background-color:#FFECEA; color:#FF3333; font-weight:bold; padding-left:10px;"><a href="/list.asp?tp=66"><font color="#FF3333">签证</font></a></td>
                  </tr>
                  <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 4 * from news where mytype=70 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                        <tr>
                          <td height="24" style="border-bottom:1px dotted #FFDFDF; color:#FF3333;">· <a href="show.asp?id=<%=rs("id")%>" target="_blank"> <font color="#FF3333"><%=left(rs("bt"),18)%></font> </a></td>
                        </tr>
                        <% rs.movenext 
wend 
			 %>
                      </table></td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 4 * from news where mytype=66 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                        <tr>
                          <td height="24" style="border-bottom:1px dotted #FFDFDF; color:#FF3333;">· <a href="show.asp?id=<%=rs("id")%>" target="_blank"> <font color="#FF3333"><%=left(rs("bt"),18)%></font> </a></td>
                        </tr>
                        <% rs.movenext 
wend 
			 %>
                      </table></td>
                  </tr>
              </table></td>
          </tr>
          <tr>
            <td><img src="images/body3_03.jpg" width="488" height="5" alt=""></td>
          </tr>
        </table></td>
    <td width="24%" valign="top" bgcolor="DBECF5"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><a href="/xl_list.asp?action=edit&id=11"><img src="img/guolv.gif" tppabs="/img/guolv.gif" width="100%" height="32" border="0" usemap="#Map"></a></td>
        </tr>
        <tr>
          <td align="left" background="img/rbg1.gif" tppabs="/img/rbg1.gif"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 10 * from xianlu where x_leiid=11 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),9)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="img/Special-price.gif" tppabs="/img/Special-price.gif" width="100%" height="31" border="0" usemap="#Map2"></td>
        </tr>
        <tr>
          <td align="left" background="img/rbg2.gif" tppabs="/img/rbg2.gif"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 10 * from xianlu where x_leiid=15 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),9)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
      </table>
      <table width="217" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="img/newest.gif" tppabs="/img/newest.gif" width="100%" height="31" border="0" usemap="#Map3"></td>
        </tr>
        <tr>
          <td align="left" background="img/rbg3.gif" tppabs="/img/rbg3.gif"><table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 10 * from xianlu order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=left(rs("x_name"),9)%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=left(rs("x_Baojia"),7)%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table>
		  </td>
        </tr>
      </table>
      <table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr>
          <td><a href="changshi.asp.htm" tppabs="/changshi.asp" onMouseMove="cssChange1()"></a><a href="zhinan.asp.htm" tppabs="/zhinan.asp" onMouseMove="cssChange2()"></a>
<!--自动切换开始-->
  
<TABLE cellSpacing=0 cellPadding=0 width=217 border=0>


          <TD vAlign=top align=left>
            <table width="217" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="img/newest1.gif" tppabs="/img/newest1.gif" width="100%" height="31" border="0" usemap="#Map3"></td>
        </tr>
        <tr>
          <td align="left"><table width="96%" border="0" cellspacing="0" cellpadding="0">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 6 * from news where mytype=75 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                  <tr>
                    <td height="24" bgcolor="#F4FAFE" style="border-bottom:1px dotted #D0EDC5;">
		· <a href="show.asp?id=<%=rs("id")%>" target="_blank">
                      <%=left(rs("bt"),14)%>
                    </a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table>
		  </td>
        </tr>
      </table>
</td>
          </tr>

      </TABLE>

<!--自动切换结束-->
       </td>
        </tr>
    </table></td>
  </tr>
</table>

<!--#include file="foot.asp" -->
</div>

</body>
</html>