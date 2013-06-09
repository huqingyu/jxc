<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert(' 您现在的位置:还没有登录,请登录！');history.go(-1);</script>"
end if
%>
<!--#include file="Connection.asp"-->
<!--#include file="admin/system/WebConfig.asp"-->
<!--#include file="admin/system/Check_SI.asp"-->
<!--#include file="admin/system/md5.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<title><%=webname%>--会员资料</title>
<SCRIPT>
win = "on";
function switchSysBar() {
	if (win == "on") {
		win = "off";
		switchPoint.src = "images/arrow02.gif";
		document.all("leftFrm").style.display = "none";
	} else {
		win = "on";
		switchPoint.src = "images/arrow01.gif";
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
    <td height="60"><TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
      
        <tr>
          <TD width="35%" height="81" align=left 
                  bgColor=#ffffff class=b><div align="center"><img src="<%=weblogo%>"></div></td>
          <TD width="65%" align=middle vAlign=center  
                bgColor=#ffffff class=b><div align="center"><img src="<%=webbanner%>"></div></td>
        </tr>
        <TR vAlign=middle bgcolor="#0F77B1">
          <TD height=27 
                colSpan=2 align=left class=b><TABLE width="100%" height="100%" border=0 
                  align=center cellPadding=0 cellSpacing=0 class=9>
              
                <tr>
                  <TD align=left vAlign=middle background="images/top_bar.gif" class=b>
                    <div align="center"><FONT color=#ffffff><a href="index.asp"><FONT color=#ffffff>首页</Font></a> | <a href="News.asp"><FONT color=#ffffff>新闻动态</Font></a> | <a href="xl.html"><FONT color=#ffffff>度假产品</FONT></a> | <a href="hotel.html"><FONT color=#ffffff>酒店预定</FONT></a> |<a href="ticket.asp"><font color="#FFFFFF"> 机票预定</font></a> | <a href="guide.asp"><font color="#FFFFFF">导游推荐</font></a> | <a href="pic.asp"><font color="#FFFFFF">美图欣赏</font></a> | <a href="Gbook.asp"><font color="#FFFFFF">留下意见</font></a> | <a href="userInfo.asp"><font color="#FFFFFF">会员中心</font></a> | <a href="Help.asp"><font color="#FFFFFF">在线帮助</font></a></FONT> <img src="images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></td>
                </tr>
              
          </TABLE></td>
        </tr>
      
    </TABLE>
      <TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="images/top_nav_menu.gif">
        
          <TR bgColor=#ffffff>
            <TD colSpan=3 height=2></td>
          </tr>
          <tr>
            <TD width="44" height=25 align=right><img src="images/arrow3.gif" width="29" height="11"></td>
            <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="index.asp">网站的首页</a>资料</td>
            <TD width="11">&nbsp;</td>
          </tr>
        
      </TABLE></td>
  </tr>
  <tr>
    <td height="1" bgcolor="#C0C0C0"></td>
  </tr>
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
              <td width="93%"><a href="LoginOut.asp"><font color="#FFFFFF">注销退出</font></a></td>
            </tr>
          </table>
          <%if Response.Cookies("Gemisum")("reglx")=3 then%>
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
          <td style="cursor:hand" onclick=switchSysBar()><img id=switchPoint src="images/arrow01.gif"></td>
          <td bgcolor="#090C11"><img src="" width="1"></td>
         </tr>
      </table></td>
        <td width="98%" style=width:100%><iframe frameborder=0 name=main scrolling=yes src="User_main.asp" style=height:100%;visibility:inherit;width:100%;z-index:1></iframe></td>
      </tr>
    </table>
      </td>
  </tr>
</table>
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
  
    <tr>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
      <TD 
height=25 align=middle background=images/foot_patt01.gif><a href=Default.htm>网站首页</a> | <a href=about.asp?action=about >关于我们</a> | <a href=about.asp?action=lxwm >业务联系</a> | <a href=help.asp?action=shiyongfalv >版权声明</a> | <a href=help.asp?action=fukuan >付款方式</a> | <a href=gbook.asp >留言/建议/投诉</a></td>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></td>
    </tr>
    <tr>
      <TD height=60><div align="center">
          <%dim endtime
endtime=timer()
response.Write "　公司地址："&dizhi&"　邮政编码："&youbian&"<br>"
response.Write "　客服邮箱：<a href=mailto:"&webemail&">"&webemail&"</a>　客服电话："&dianhua&"<br>　"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write " 您现在的位置:："&FormatNumber((endtime-startime)*1000,3)&" 毫秒"
%>
      </div></td>
    </tr>
  
</TABLE>
</div>
</body>
</html>
