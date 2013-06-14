<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登陆--1000y通行证</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chk.js"></script>
</head>

<body>
<p>&nbsp;</p>
<br />
<table width="812" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="829" height="551" align="center" valign="top" background="images/bg.jpg"><table width="99%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="58%" height="83">&nbsp;</td>
        <td width="42%">&nbsp;</td>
      </tr>
      <tr>
        <td height="159">&nbsp;</td>
        <td valign="top"><table width="291" border="0" cellspacing="0" cellpadding="0">
          <form id="form1" name="form1" method="post" action="">
          <tr>
            <td width="93" height="40" align="right" style="color:#666666;font-size:14px">通行证账号：</td>
            <td colspan="2" align="left"><input name="UserName" type="text" class="input" id="UserName" size="25" /></td>
          </tr>
          <tr>
            <td height="40" align="right" style="color:#666666;font-size:14px">密码：</td>
            <td colspan="2" align="left"><input name="PassWord" type="password" class="input" id="PassWord" size="25" onkeydown="if(event.keyCode==13){loginchk();}"/></td>
          </tr>
          <tr>
            <td height="68">&nbsp;</td>
            <td width="89" align="right"><img src="images/btn.png" width="89" height="40" onclick="loginchk()" style="cursor:pointer" /></td>
            <td width="109" align="left"><a href="LostPassword.asp" target="_blank">&nbsp;找回密码</a></td>
          </tr></form>
        </table></td>
      </tr>
      <tr>
        <td height="65">&nbsp;</td>
        <td><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="50%" align="center" style="color:#666666;font-size:14px">没有注册通行证？</td>
            <td width="50%" align="center"><a href="register.asp"><img src="images/reg.png" width="97" height="34" border="0" /></a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
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
