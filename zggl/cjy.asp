<!--#include file="common/conn.asp"--> <!--#include file="common/webconfig.asp"-->
<% tp=request("tp") %>
<!DOCTYPE HTML>
<html>
<head>
<title>出境游-<%=webname%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>
</head>
<body> 
<div id="J_page" class="w980 center">
<!--#include file="top.asp" -->

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" align="center" valign="top" bgcolor="#FFFFFF"><!--#include file="left.asp" -->
		</td>
    <td align="center" valign="top"><TABLE WIDTH=98% BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <tr>
          <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>您现在的位置:</b><a href="index.asp">首页</a> &gt;&gt; 出境游</td>
        </tr>
      </TABLE>
      <table width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="565" align="center" valign="top"><table border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="6"></td>
            </tr>
          </table>
          <table width="100%" border="0" cellpadding="0" cellspacing="0" background="Images/pic16.gif" style="border:1px solid #CCCCCC;">
            <tr>
              <td width="45" height="28" align="center" style="font-size:14px; color:#CC6600; font-weight:bold;">&nbsp;</td>
              <td width="82" style="font-size:14px; font-weight:bold;"><span class="STYLE7">出境游</span></td>
              <td width="379">&nbsp;</td>
            </tr>
          </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="2" bgcolor="#FFFFFF">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select * from xianlu where x_leiid=14 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                <tr align="center" bgcolor="#f5f5f5"> </tr>
                  <tr bgcolor="#FFFFFF">
                    <td height="24" bgcolor="#F4FAFE">&nbsp;<img src="images/ping.gif"><a href="Xl/Xl_<%=rs("id")%>.html" target="_blank"><%=rs("x_name")%></a></td>
                    <td align="center" bgcolor="#F4FAFE"><a href="Giveme.asp?id=<%=rs("id")%>" title='预定' target="_blank" class="STYLE1"><%=rs("x_Baojia")%></a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
        </tr>
      </table>
      </td>
    <td valign="top">
	<!--#include file="right_i.asp" -->
	</td>
  </tr>
</table>

      

<!--#include file="foot.asp" -->
</div>
</body>
</html>
