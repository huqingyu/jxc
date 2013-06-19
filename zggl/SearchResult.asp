<!--#include file="common/conn.asp"--> <!--#include file="common/webconfig.asp"-->
<%
xlmc=trim(request.querystring("xlmc"))
xllx=trim(request.querystring("xllx"))
%>
<!DOCTYPE HTML>
<html>
<head>
<title><%=webname%>--酒店查询结果</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>

</head>
<body>

<!--#include file="top.asp" -->

<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="center" valign="top" bgcolor="#FFFFFF"><!--#include file="left.asp" -->
		</td>
    <td align="center" valign="top"><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
          <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>您现在的位置:</b><a href="/index.asp">首页</a>预定查询结果</td>
        </tr>
      </TABLE>
      <%
session("starttime")=request.form("starttime")
session("deptime")=request.form("deptime")
star=request.form("star")
jiage=request.form("jiage")
shucity=request.form("shucity")
hotelname=request.form("name")
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where city like '%"&shucity&"%' and c_name like '%"&hotelname&"%'" 

if star="all" then
else
	sqltext=sqltext &"and ( "
	if star=0 then
		sqltext=sqltext &" level='无标准' or"
	end if
	if star=1 then
		sqltext=sqltext &" level='一星级' or level='准一星级' or"
	end if
	if star=2 then
		sqltext=sqltext &" level='二星级' or level='准二星级' or"
	end if
	if star=3 then
		sqltext=sqltext &" level='三星级' or level='准三星级' or"
	end if
	if star=4 then
		sqltext=sqltext &" level='四星级' or level='准四星级' or"
	end if
	if star=5 then
		sqltext=sqltext &" level='五星级' or level='准五星级' or"
	end if
	sqltext=sqltext & " level='其他')"
end if

sqltext=sqltext & "order by id desc"
rs.open sqltext,conn
%>
<script language="javascript">
function OpenSmallWindows(strURL)
{
window.open (strURL,"_blank",
"status=no,resizable=0,toolbar=no,menubar=no,scrollbars=no,width=780,height=300,left=2,top=100");
}
</script>
    <table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30">&nbsp;&nbsp; 您现在的位置:询的结果：</td>
      </tr>
</table>
    <%
  if rs.eof then 
  	response.write "<script language=JavaScript>{window.alert(' 您现在的位置: 您现在的位置:返回重新查找!');window.history.go(-1);}</script>"
  	response.end
  end if
  if not rs.eof then
  	
  	do while not rs.eof 
  	
	c_id=rs("id")
	set rsroom=server.createobject("adodb.recordset")
	sqltext="select * from roomb where c_id="&c_id&"" 
	
	if jiage="all" then
	else
		sqltext=sqltext & " and ( "
		if jiage<>"" then
			sqltext=sqltext & jiage &" or "
		end if
		sqltext=sqltext & " breakfast='其他')"
	end if
	
	sqltext=sqltext & " order by id asc"
	rsroom.open sqltext,conn
  if not rsroom.eof then
  %>
  <table width="770" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
    <tr>
            <td width="35%" height="31" background="images/topBar_bg.gif">
      <font class="medium" color="#000080">
      <b><%=rs("c_name")%></b></font>      </td>
            <td width="20%"><div align="center">酒店星级:<font color="#FF0000">
            <%if rs("level")="无标准" then 
      		response.write "无标准"
      	elseif rs("level")="一星级" then
      		response.write "★"	
      	elseif rs("level")="准一星级" then
      		response.write "★"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="二星级" then
      		response.write "★★"	
      	elseif rs("level")="准二星级" then
      		response.write "★★"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="三星级" then
      		response.write "★★★"	
      	elseif rs("level")="准三星级" then
      		response.write "★★★"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="四星级" then
      		response.write "★★★★"	
      	elseif rs("level")="准四星级" then
      		response.write "★★★★"
      		response.write"<img src=star/zhun.gif>"
      	elseif rs("level")="五星级" then
      		response.write "★★★★★"	
      	elseif rs("level")="准五星级" then
      		response.write "★★★★★"
      		response.write"<img src=star/zhun.gif>"
      	end if
      %>
        </font></div></td>
        <td width="21%" height="31"><div align="center"><span class="main1">所在省份:<%=rs("province")%></span></div></td>
      <td width="24%" height="31"><div align="center"><span lang="zh-cn">所在城市：<%=rs("city")%></span></div></td>
    </tr>
    <tr>
      <td colspan="5" height="16">
      <table width="100%" border=1 cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
       <tr>
          <td width="23%" height="25" background="images/topBar_bg.gif"><div align="center">房型</div></td>
          <td width="7%" height="25" background="images/topBar_bg.gif">
          <p align="center">早餐</td>
          <td width="11%" height="25" background="images/topBar_bg.gif"><div align="center">门市价</div></td>
          <td width="22%" height="25" colspan="2" background="images/topBar_bg.gif"><div align="center">前台现付价</div></td>
          <td width="12%" height="25" background="images/topBar_bg.gif"><div align="center">网上支付价</div></td>
          <td width="13%" height="25" background="images/topBar_bg.gif"><div align="center">支付方式</div></td>
          <td width="12%" height="25" background="images/topBar_bg.gif">
          <p align="center">首日房态</td>
        </tr>
      <%if not rsroom.eof then
      do while not rsroom.eof%>
        <tr>
          <td width="23%" height="14"><%=rsroom("type")%></td>
          <td width="7%" height="14">
          <p align="center"><%=rsroom("breakfast")%></td>
          <td width="11%" height="14">RMB <%=rsroom("marketprice")%></td>
          <td width="12%" height="14">RMB <%=rsroom("stageprice")%></td>
          <td width="10%" height="14">
          <p align="center">
          <a href="userinfo/login.asp?hotelid=<%=rs("id")%>&roomid=<%=rsroom("id")%>"><strong><font color="#FF0000">预订</font></strong></a></td>
          <td width="12%" height="14">RMB <%=rsroom("netprice")%></td>
          <td width="13%" height="14"><%=rsroom("paytype")%></td>
          <td width="12%" height="14">
          <p align="center"><%=rsroom("state")%></td>
        </tr>
        <%
        rsroom.movenext
        loop
        rsroom.close
        end if%>
      </table>
      </td>
    </tr>
    <tr bgcolor="#EBEBEB">
      <td height="30" colspan="5">
      <p align="right"><a href="#" onClick="Javascript:OpenSmallWindows('HotelRoomAll.asp?id=<%=rs("Id")%>')" >全部房型</a></td>
    </tr>
</table>
  <%
  end if
  rs.movenext
  loop
  end if
  rs.close
  conn.close
  %>
      </td>
  </tr>
</table>

      

<!--#include file="foot.asp" -->

</body>
</html>