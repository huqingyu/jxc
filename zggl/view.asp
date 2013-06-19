<!--#include file="common/conn.asp"--> <!--#include file="common/webconfig.asp"-->
                <% set rs= Server.CreateObject("adodb.recordset")
sql="select  * from about where id="&request("id")
rs.open sql,conn,1
bt=rs("bt")
nr=rs("nr")
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title><%=webname%></title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>
</head>
<body>

<!--#include file="top.asp" -->

<table width="1005" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="220" height="32" align="center" valign="top" bgcolor="F0F0F0">
	<!--网站顶部开始 -->
    <!--#include file="left.asp" -->
    <!--网站顶部结束 -->	</td>
    <td width="565" valign="top"><TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
      <tr>
        <TD height="28" background="images/rtop_1.jpg">&nbsp; <a href="index.asp">首页</a> &gt;&gt; <a href="#"><%= bt %></a>内容</td>
        </tr>
      
    </TABLE>
      <table width="100%" border="1" cellpadding="6" cellspacing="3" bordercolor="#EEEEEE">
        <tr>
          <td width="75%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="25" align="center" style="font-size:14px; color:#CC6600; font-weight:bold;" bgcolor="#FBE3B7"><img src="images/bat.gif" width="9" height="7"></td>
              <td width="90" height="26" bgcolor="#FBE3B7" style="font-size:14px; color:#CC6600; font-weight:bold;"><%= bt %></td>
              <td bgcolor="#FBF3DB">&nbsp;</td>
            </tr>
            <tr>
              <td bgcolor="#E29A44"></td>
              <td height="2" bgcolor="#E29A44"></td>
              <td  bgcolor="#EEA93E"></td>
            </tr>
          </table>
          <table width="100%" border="0" cellspacing="0" cellpadding="5"  style="border-left:1px solid #F0D7B1; border-right:1px solid #F0D7B1; border-bottom:1px solid #F0D7B1; line-height:24px;">
            <tr>
              <td align="left" style="font-size:14px; line-height:24px; color:#555"><%= nr %></td>
            </tr>
          </table>          </td>
        </tr>
      </table>
      <!--格线 -->
<table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="3"></td>
        </tr>
      </table>
</td>
    <td valign="top">
	<!--#include file="right.asp" -->
	</td>
  </tr>
</table>

<!--#include file="foot.asp" -->

</body>
</html>
