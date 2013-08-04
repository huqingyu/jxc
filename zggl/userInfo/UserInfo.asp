<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert(' 您现在的位置:还没有登录,请登录！');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->
<!--#include file="../common/md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--会员资料</title>
<SCRIPT>
win = "on";
function switchSysBar() {
	if (win == "on") {
		win = "off";
		switchPoint.innerHTML = "&gt;";
		document.all("leftFrm").style.display = "none";
	} else {
		win = "on";
		switchPoint.innerHTML = "&lt;";
		document.all("leftFrm").style.display = "";
	}
}
</SCRIPT>
</head>
<%
dim uid ,upwd
uid=request.Cookies("Gemisum")("username")
set rs=server.createobject("adodb.recordset")
sqltext="select * from [userb] where username='"&uid&"'"
rs.open sqltext,conn,1,1
%>
<body>
<div align="center">
<table width="770" height="759"border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="100%"><table border=0 cellpadding=0 cellspacing=0 height=100% width=100%>
      <tr>
        <td width="1%" valign=top bgcolor="#0F77B1" id=leftfrm>
          <table border="0" width="150" cellpadding="3" class=main1>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp" target="main"><font color="#FFFFFF">个人资料</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp?action=EditUserinfo" target="main"><font color="#FFFFFF">修改个人资料</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp?action=editpass" target="main"><font color="#FFFFFF">修改口令</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_main.asp?action=payjilu" target="main"><font color="#FFFFFF">我的交易记录</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="logout.asp"><font color="#FFFFFF">注销退出</font></a></td>
            </tr>
          </table>
          <%if Request.Cookies("Gemisum")("reglx")=3 then%>
		  <table border="0" width="100%" cellpadding="3" class=main1>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_Addxl.asp?action=add" target="main"><font color="#FFFF00">发布线路信息</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="User_hotelReg.asp" target="main"><font color="#FFFF00">发布酒店信息</font></a></td>
            </tr>
            <tr>
              <td></td>
              <td><a href="User_Addxl.asp?action=Edit" target="main"><font color="#FFFF00">线路信息管理</font></a></td>
            </tr>
            <tr>
              <td></td>
              <td><a href="User_HotelInfo.asp" target="main"><font color="#FFFF00">酒店信息管理</font></a></td>
            </tr>
          </table>
		  <%End if%></td>
        <td width="1%" bgcolor="#C0C0C0">
      <table border=0 cellpadding=0 cellspacing=0 height=100%>
        <tr>
          <td style="cursor:hand" onclick=switchSysBar()><span id="switchPoint">&lt;</span></td>
          <td></td>
         </tr>
      </table></td>
        <td width="98%" style=width:100%>
		<iframe frameborder=0 name="main" scrolling=yes src="User_main.asp" style=height:100%;visibility:inherit;width:100%;z-index:1></iframe></td>
      </tr>
    </table>
      </td>
  </tr>
</table>
</div>
</body>
</html>
