<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>会员管理</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="admin.js"></script>
<link href="inc/wnd1.css" type="text/css" rel="stylesheet">
<script src="inc/wnd.js" type="text/javascript"></script>
</head>

<body onLoad="PageTurning(1,0,0)">
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="55%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/admin1.png" width="801" height="81" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td height="554" valign="top" background="images/reg2.png">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <form name="form1" method="post" action=""><tr>
        <td width="6%" height="47">&nbsp;</td>
        <td width="90%"><select name="key" id="key">
          <option value="1" selected>按照帐号查询</option>
          <option value="2">按照角色查询</option>
          <option value="3">按照邮箱查询</option>
          <option value="4">按照身份证查询</option>
        </select>
          <input name="keyword" type="text" class="input" id="keyword">
          <input type="button" name="button" id="button" value=" 搜 索 " onClick="searchuser()"></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="165">&nbsp;</td>
        <td valign="top"><span id="userlists"></span></td>
        <td>&nbsp;</td>
      </tr></form>
    </table></td>
  </tr>
</table>
<table width="56%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" height="70" align="right" valign="top"><img src="images/reg3.png" height="70"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/l.png" height="1"></td>
  </tr>
</table>
<!--#include file="foot.asp"-->

<map name="Map"><area shape="rect" coords="731,48,783,75" href="logout_admin.asp"></map></body>
</html>
