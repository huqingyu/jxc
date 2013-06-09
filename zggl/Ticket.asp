<!--#include file="Connection.asp"-->
<!--#include file="admin/system/WebConfig.asp"-->
<!--#include file="admin/system/Check_SI.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--票务中心</title>
</head>
<script language="JavaScript" src="admin/system/indexdatejs.js"></script>

<!--#include file="top.asp" -->

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="212" valign="top"><!--#include file="pw_left.asp" --></td>
    <td valign="top"><div align="center">
      <table width="98%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="542" height="100" background="Images/piao.jpg" style="border:1px solid #59B3E1;">&nbsp;</td>
        </tr>
        <tr>
          <td height="5"></td>
        </tr>
      </table>
</div>      
      <table width="98%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#EFEFEF" borderColorDark=#ffffff bgcolor="#F9F9F9">
      <tr>
          <td height="30" colspan="3" background="Images/topBar_bg.gif">&nbsp;<img src="Images/ring01.gif" width="9" height="9"> 查询</td>
        </tr>
        <tr>
          <td height="125" colspan="3">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
<form action="Searchticket.asp" method="post" name="form1" target="_blank">
<tr>
              <td width="14%" height="30">航空公司：</td>
              <td width="21%"><select name="hankonggongsi" id="hankonggongsi">
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
              </select></td>
              <td width="16%"> &nbsp;航段类型： </td>
              <td width="16%"><select name="hdtype" id="hdtype">
                <option value="直达" selected>直达</option>
                <option value="">所有</option>
                                                  </select></td>
              <td width="15%">&nbsp;出发日期： </td>
              <td width="18%"><input name="textfield" type="text" size="16" onFocus="javascript:setday(this)" value="点击选择日期"></td>
            </tr>
            <tr>
              <td height="30">出发城市：</td>
              <td><select name="chufachenshi" id="chufachenshi">
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
</select>              <font color="red"> *</font></td>
              <td> 单程/往返： </td>
              <td><select name="type" id="type">
                <option value="单程" selected>单程</option>
                <option value="往返">往返</option>
                <option value="联程">联程</option>
              </select></td>
              <td>&nbsp;反程日期： </td>
              <td><input name="textfield2" type="text" size="16" onFocus="javascript:setday(this)" value="点击选择日期">                </td>
            </tr>
            <tr>
              <td height="30">到达城市：</td>
              <td><select name="mudichenshi" id="mudichenshi">
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
              </select>              <font color="red"> *</font></td>
              <td> &nbsp;乘舱类型： </td>
              <td><select name="cctype2" id="cctype2">
                <option value="1" selected>经济舱</option>
                <option value="2">公务舱</option>
                <option value="3">头等舱</option>
              </select></td>
              <td colspan="2"> <div align="center"><font color="red"> 您现在的位置:择反程日期</font></div></td>
            </tr>
            <tr>
              <td height="30">航班类型：</td>
              <td colspan="2">国内航班
                <input name="hbtype" type="radio" value="1" checked>
                国际航班
                <input name="hbtype" type="radio" value="2"></td>
              <td colspan="3"><div align="center">
    <input type="submit" name="Submit" value="提交查询">
&nbsp;&nbsp;
    <input type="reset" name="Submit2" value="重置">
              </div></td>
            </tr>
          </form>
</table></td>
        </tr>
        <tr>
          <td width="50%" height="30" background="Images/topBar_bg.gif"><table width="97%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;<img src="Images/ring01.gif" width="9" height="9"> 您现在的位置:息 </td>
                <td><div align="right"><a href="ticket_1.asp"><font color="#0000FF">更多国内航班</font></a></div></td>
              </tr>
            </table></td>
          <td width="2%" rowspan="2">&nbsp;</td>
          <td width="48%" background="Images/topBar_bg.gif"><table width="97%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td>&nbsp;<img src="Images/ring01.gif" width="9" height="9"> 您现在的位置:息 </td>
              <td><div align="right"><a href="ticket_2.asp"><font color="#0000FF">更多国际航班</font></a></div></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td height="135" valign="top"><%set rs=server.createobject("adodb.recordset")
rs.open "select top 8 id,hbtype,chufachenshi,mudichenshi,type,shichanjia,tuijiang from dingbiao where tuijiang=1 and hbtype=1",conn
if err.number<>0 then
response.write " 您现在的位置:！"
end if
do while not rs.eof
%>
            <table width="99%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                <td width="35%"><%=rs("chufachenshi")%>-<%=rs("mudichenshi")%></td>
                <td width="25%"><%=rs("type")%></td>
                <td width="24%"><font color="#FF0000">＄<%=rs("shichanjia")%></font></td>
                <td width="14%"><a href="Ticketinfo.asp?id=<%=rs("id")%>">预定</a></td>
              </tr>
            </table>
            <%
rs.movenext
loop
rs.close
set rs=nothing
%></td>
          <td height="135" valign="top"><%set rs=server.createobject("adodb.recordset")
rs.open "select top 8 id,hbtype,chufachenshi,mudichenshi,type,shichanjia,tuijiang from dingbiao where tuijiang=1 and hbtype=2",conn
if err.number<>0 then
response.write " 您现在的位置:！"
end if
do while not rs.eof
%>
            <table width="99%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                <td width="35%"><%=rs("chufachenshi")%>-<%=rs("mudichenshi")%></td>
                <td width="25%"><%=rs("type")%></td>
                <td width="24%"><font color="#FF0000">＄<%=rs("shichanjia")%></font></td>
                <td width="14%"><a href="Ticketinfo.asp?id=<%=rs("id")%>">预定</a></td>
              </tr>
            </table>
            <%
rs.movenext
loop
rs.close
set rs=nothing
%></td>
        </tr>
        <tr>
          <td height="30" colspan="3" background="Images/topBar_bg.gif">&nbsp;<img src="Images/ring01.gif" width="9" height="9"> 最新航班信息</td>
        </tr>
        <tr>
          <td height="340" colspan="3" valign="top">
            <table width="100%" height="19" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#DFEFCA">
              <tr>
                <td width="22%" height="26"> &nbsp;航空公司</td>
                <td width="17%"> &nbsp;航段</td>
                <td width="12%">航段类型</td>
                <td width="14%">单程/往返</td>
                <td width="14%">航班类型</td>
                <td width="11%">价格</td>
                <td width="10%">预定</td>
              </tr>
              <tr bgcolor="#CCCCCC">
                <td height="1" colspan="8"></td>
              </tr>
            </table>
            <%set rs=server.createobject("adodb.recordset")
rs.open "select top 20 * from dingbiao",conn,1,1
if err.number<>0 then
response.write " 您现在的位置:！"
end if
do while not rs.eof
%>
  <table width="99%" height="19" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="22%" height="24"><%=rs("hankonggongsi")%></td>
      <td width="17%"><%=rs("chufachenshi")%>-<%=rs("mudichenshi")%></td>
      <td width="12%"><%=rs("hdtype")%></td>
      <td width="14%"><%=rs("type")%></td>
      <td width="14%"><% if rs("hbtype")="1" then 
response.write "国内航班"
else
response.write "国际航班"
end if
%></td>
      <td width="11%"><font color="#FF0000">＄<%=rs("shichanjia")%></font></td>
      <td width="10%"><a href="Ticketinfo.asp?id=<%=rs("id")%>">预定</a></td>
    </tr>
    <tr>
      <td height="1" colspan="8" background="Images/line_bg.gif"></td>
      </tr>
  </table>
  <%
rs.movenext
loop
rs.close
set rs=nothing
%></td>
        </tr>
    </table>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="8"></td>
        </tr>
    </table></td>
    <td width="214" valign="top"><!--#include file="right_i.asp" --></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>

<!--#include file="foot.asp" -->

