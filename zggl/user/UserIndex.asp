<!--#include file="conn.asp"-->
<%
if membername="" then
  response.Write "登陆超时或者没有登陆"
  response.End()
end if%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=membername%> 欢迎登陆千年会员中心</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="member.js"></script>
</head>

<body onLoad="member1(1)">
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="801" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="795" height="81" valign="top" background="images/mem1.png"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="48" colspan="5" valign="top"><table width="767" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="14" colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td width="59" height="27">&nbsp;</td>
            <td width="708" style="color:#FF0000;font-size:14px"><b><img src="images/6.png" width="16" height="12" hspace="4" border="0" align="absmiddle"><%=membername%></b></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="27" align="center" style="font-size:14px"><A href="javascript:" onClick="member1(1)"><img src="images/1.png" width="22" height="22" hspace="4" border="0" align="absmiddle"><b>帐号信息</b></A></td>
        <td align="center" style="font-size:14px"><A href="javascript:" onClick="member1(5)"><img src="images/2.png" width="22" height="22" hspace="4" border="0" align="absmiddle"><b>修改密码</b></A></td>
        <td align="center" style="font-size:14px"><A href="javascript:" onClick="member1(3)"><img src="images/3.png" width="22" height="22" hspace="4" border="0" align="absmiddle"><b>充值记录</b></A></td>
        <td align="center" style="font-size:14px"><A href="javascript:" onClick="member1(4)"><img src="images/4.png" width="22" height="22" hspace="4" border="0" align="absmiddle"><b>游戏充值</b></A></td>
        <td align="center" style="font-size:14px"><A href="logout.asp"><img src="images/5.png" width="22" height="22" hspace="4" border="0" align="absmiddle"><b>退出登陆</b></A></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="554" valign="top" background="images/reg2.png"><table width="690" height="513" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="316" height="29">&nbsp;</td>
        <td width="373">&nbsp;</td>
      </tr>
      <tr>
        <td height="484" colspan="2" valign="top"><span id="showvalues"></span></td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="56%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="70" align="right" valign="top" bgcolor="#EDF6FB"><img src="images/reg3.png" height="70"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/l.png" height="1"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->
</body>
</html>
