<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->

<%dim action
action=request.QueryString("action")%>
<html><head><title><%=webname%>--新用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../Style.css" rel="stylesheet" type="text/css">
<script language=JavaScript>
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
</script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function checkuserinfo()
{
   if(checkspace(document.userinfo.username.value)) {
	document.userinfo.username.focus();
    alert("对不起，请填写用户名！");
	return false;
  }
    if(checkspace(document.userinfo.userpassword.value) || document.userinfo.userpassword.value.length < 6 || document.userinfo.userpassword.value.length >20) {
	document.userinfo.userpassword.focus();
    alert("密码长度不能不能这空，在6位到20位之间，请重新输入！");
	return false;
  }
    if(document.userinfo.userpassword.value != document.userinfo.userpassword1.value) {
	document.userinfo.userpassword.focus();
	document.userinfo.userpassword.value = '';
	document.userinfo.userpassword1.value = '';
    alert("两次输入的密码不同，请重新输入！");
	return false;
  }

 if(document.userinfo.useremail.value.length!=0)
    if (document.userinfo.useremail.value.charAt(0)=="." ||        
         document.userinfo.useremail.value.charAt(0)=="@"||       
         document.userinfo.useremail.value.indexOf('@', 0) == -1 || 
         document.userinfo.useremail.value.indexOf('.', 0) == -1 || 
         document.userinfo.useremail.value.lastIndexOf("@")==document.userinfo.useremail.value.length-1 || 
         document.userinfo.useremail.value.lastIndexOf(".")==document.userinfo.useremail.value.length-1)
     {
      alert("Email地址格式不正确！");
      document.userinfo.useremail.focus();
      return false;
      }
if(checkspace(document.userinfo.useremail.value)) {
   alert("Email不能为空！");
   document.userinfo.useremail.focus();
   return false;
   }
   if(checkspace(document.userinfo.userzhenshiname.value)) {
	document.userinfo.userzhenshiname.focus();
    alert("对不起，请填写真实姓名！");
	return false;
  }
   if(checkspace(document.userinfo.idcard.value)) {
	document.userinfo.idcard.focus();
    alert("对不起，请填写真实身份证！");
	return false;
  }
     if(checkspace(document.userinfo.work.value)) {
	document.userinfo.work.focus();
    alert("对不起，请填写你工作！");
	return false;
  }
  if(checkspace(document.userinfo.address.value)) {
	document.userinfo.address.focus();
    alert("对不起，请填写详细地址！");
	return false;
  }
  if(checkspace(document.userinfo.youbian.value)) {
	document.userinfo.youbian.focus();
    alert("对不起，请填写邮编！");
	return false;
  }
  if(document.userinfo.youbian.value.length!=6) {
	document.userinfo.youbian.focus();
    alert("对不起，请正确填写邮编！");
	return false;
  } 
    if(checkspace(document.userinfo.usertel.value)) {
	document.userinfo.usertel.focus();
    alert("对不起，请留下您的联系电话！");
	return false;
  }
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
//-->
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onMouseOver="window.status='【<%=webname%>】<%=weburl%> 如果您喜欢本站,别忘了把本站介绍给您的好友哦！：）';return true">
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR>
          <TD width="35%" height="81" align=left 
                  bgColor=#ffffff class=b><div align="center"><img src="../<%=weblogo%>"></div></TD>
          <TD width="65%" align=middle vAlign=center  
                bgColor=#ffffff class=b><div align="center"><img src="../<%=webbanner%>"></div></TD>
        </TR>
        <TR vAlign=middle bgcolor="#0F77B1">
          <TD height=27 
                colSpan=2 align=left class=b><TABLE width="100%" height="100%" border=0 
                  align=center cellPadding=0 cellSpacing=0 class=9>
              <TBODY>
                <TR>
                  <TD align=left vAlign=middle background="../images/top_bar.gif" class=b>
                  <div align="center"><FONT color=#ffffff><a href="/"><FONT color=#ffffff>首页</Font></a> | <a href="../News.asp"><FONT color=#ffffff>新闻动态</Font></a> | <a href="../xl.html"><FONT color=#ffffff>度假产品</FONT></a> | <a href="../hotel.html"><FONT color=#ffffff>酒店预定</FONT></a> |<a href="../ticket.asp"><font color="#FFFFFF"> 机票预定</font></a> | <a href="../guide.asp"><font color="#FFFFFF">导游推荐</font></a> | <a href="../pic.asp"><font color="#FFFFFF">美图欣赏</font></a> | <a href="../Gbook.asp"><font color="#FFFFFF">留下意见</font></a> | <a href="userInfo.asp"><font color="#FFFFFF">会员中心</font></a> | <a href="../Help.asp"><font color="#FFFFFF">在线帮助</font></a></FONT> <img src="../images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></TD>
                </TR>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
</TABLE>
    <TABLE width="770" border=0  align=center cellPadding=0 cellSpacing=0 background="../images/top_nav_menu.gif">
      <TBODY>
        <TR bgColor=#ffffff>
          <TD colSpan=3 height=2></TD>
        </TR>
        <TR>
          <TD width="44" height=25 align=right><img src="../images/arrow3.gif" width="29" height="11"></TD>
          <TD width="715"><FONT color=#333333>&nbsp;您的位置：&nbsp;</FONT><a href="/">网站的首页</a> &gt;&gt; 会员注册</TD>
          <TD width="11">&nbsp;</TD>
        </TR>
      </TBODY>
    </TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0 style="BORDER-LEFT: #d8d8d8 1px solid;BORDER-RIGHT: #d8d8d8 1px solid;">
  <TBODY>
    <TR>
      <TD class=b vAlign=top align=left width=764><%select case action
case ""%>
        <table width="760" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
          <tr>
            <td height="22" bgcolor="#FFFFFF" bordercolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><table width="80%" align="center" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="40" align="center"><font color=red><strong>请用户仔细阅读<%=webname%>注册条约</strong></font></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="80%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
                            <tr bgcolor="#ffffff">
                              <td><%call tiaoyue()%>
                              </td>
                            </tr>
                        </table></td>
                      </tr>
                    </table>
                      <table name=agree border="0" cellpadding="10" cellspacing="0" align=center width="80%">
                        <tr align=center>
                          <td width="50%" align="right">
						  <FORM name=register method=post action=User_reg.asp?action=yes>
                              <input type="hidden" name="action" value="agree">
                              <INPUT class="go-wenbenkuang" type=submit value=" 同意注册 " name=Submit>
                          </FORM></td>
                          <td width="50%" align="left"><FORM action="/index.asp" method=post>
                              <INPUT class=go-wenbenkuang type=submit value=" 我不同意 ">
                          </FORM></td>
                        </tr>
                    </table></td>
                </tr>
            </table></td>
          </tr>
        </table>
        <SCRIPT>
	secs = 60; // Number of secs to delay -CHINA-studio
	wait = secs * 100;
	document.forms.register.Submit.disabled =true;
	for(i=1;i<=(wait/100);i++) {
		window.setTimeout("doUpdate(" + i + ")", i * 100);
	}
	window.setTimeout("Timer()", wait);

	function doUpdate(num) {
		if(num == (wait/100)) {
			document.forms.register.Submit.value = " 同意注册 ";
		} else {
			wut = (wait/100)-num;
			document.forms.register.Submit.value = " 同意前请先阅读 (" + wut + ")";
		}
	}

	function Timer() {
		document.forms.register.Submit.disabled =false;
}
        </SCRIPT>
        <%case "yes"%>
        <table width="760" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
          <tr>
            <td bgcolor="#FFFFFF" bordercolor="#FFFFFF"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="center"><font color="#FF3300"><b><br>
                    请您务必详细填写您的信息，并核对无误，国内用户请留下您的真实中文姓名。<br>
              未经您的允许，您的个人信息对外保密。(带 <font color=red>**</font> 号为必填项) </b></font>
                      <form name=userinfo method=post action=User_reg.asp?action=save>
                        <table width="80%" border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC" align="center">
                          <tr>
                            <td height=30 colspan=2 background="../Images/topBar_bg.gif"><font color="#FF3300"><img src="../Images/ring01.gif" width="9" height="9"> 用户名和密码</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>用 户 名：</td>
                            <td width=70% class=pad><input class="wenbenkuang" name="username" type="text" id="username" maxLength="18">
                                <font color=red>*</font> 支持中文,不支持特殊符号如:*%#!-&%$</td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>密　　码：</td>
                            <td class=pad><input class="wenbenkuang" name="userpassword" type="password" id="userpassword" maxLength="18">
                                <font color=red>*</font> 不支持特殊符号如:*%#!-&%$</td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>确认密码：</td>
                            <td class=pad><input class="wenbenkuang" name="userpassword1" type="password" id="userpassword1" maxLength="18">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>电子邮箱：</td>
                            <td class=pad><input class="wenbenkuang" name="useremail" type="text" id="useremail">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td height="30" colspan="2" valign="middle" background="../Images/topBar_bg.gif"><font color="#FF3300"><img src="../Images/ring01.gif" width="9" height="9"> 用户详细资料</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>您的真实姓名：</td>
                            <td class=pad><input name="userzhenshiname" type="text" id="userzhenshiname" size="10">
                                <font color=red>*</font> 以便确认 </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>您的身份证号：</td>
                            <td class=pad><input class="wenbenkuang" name="idcard" type="text" id="idcard" maxlength="18" onKeyPress="event.returnValue=IsDigit();">
                              <font color=red>*</font>                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>姓　　别：</td>
                            <td class=pad><input type=radio name=sex id=Select1 value=男 checked>
                              男
                                <input type=radio name=sex id=Select1 value=女>
                                女 </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right> 工作：</td>
                            <td class=pad><input name="work" type="text" id="work" size="15">
                              <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>通讯地址：</td>
                            <td class=pad><input class="wenbenkuang" name="address" type="text" id="address" size="40" maxlength="30">
                                <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>邮　　编：</td>
                            <td class=pad><input class="wenbenkuang" name="youbian" type="text" id="youbian" maxlength="6" size="10" onKeyPress="event.returnValue=IsDigit();">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>联系电话：</td>
                            <td class=pad><input class="wenbenkuang" name="usertel" maxlength="18" type="text" id="usertel">
                                <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align="right"></td>
                            <td class=pad><input class="go-wenbenkuang" onClick="return checkuserinfo();" type=submit name="submit" value=" 提交信息 ">
                                <input class="go-wenbenkuang" onclick="ClearReset()" type=reset name="Clear" value=" 重新填写 ">
                            </td>
                          </tr>
                        </table>
                    </form></td>
                </tr>
            </table></td>
          </tr>
        </table>
        <table width="760" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
          <tr>
            <td bordercolor="#FFFFFF" bgcolor="#FFFFFF"><%case "save"%>
                <!--#include file="md5.asp"-->
                <%call saveuser()%>
                <%end select%>
<%sub tiaoyue()
set rs=server.CreateObject("adodb.recordset")
rs.Open "select regtiaoyue from config",conn,1,1
response.Write trim(rs("regtiaoyue"))
rs.Close
set rs=nothing
end sub

sub saveuser()
if session("regtimes")=1 then
response.Write "<table width=760 border=0 cellspacing=0 cellpadding=0 align=center><tr><td height=300 align=center><font color=red>对不起，您刚注册过用户，请稍后再进行注册!</font></td></tr></table>"
response.End
end if

set rse=server.CreateObject("adodb.recordset")
rse.open "select * from [userb] where email='"&trim(request("useremail"))&"' or username='"&trim(request("username"))&"'",conn,1,1
if rse.recordcount>0 then
call usererr()
rse.close
end if

set rs=server.CreateObject("adodb.recordset")
rs.open "select * from [userb]",conn,1,3
rs.addnew
rs("username")=trim(request("username"))
rs("userpassword")=md5(trim(request("userpassword")))
rs("email")=trim(request("useremail"))
rs("name")=trim(request("userzhenshiname"))
rs("sex")=trim(request("sex"))
rs("telphone")=trim(request("usertel"))
rs("zip")=trim(request("youbian"))
rs("address")=trim(request("address"))
rs("idcard")=trim(request("idcard"))
rs("work")=trim(request("work"))
rs("jifen")=0
rs("lastlogin")=now()
rs("userlastip")=Request.ServerVariables("REMOTE_ADDR")
rs("logins")=1
rs("regdate")=now()
rs("reglx")=1

rs.update
rs.close
set rs=nothing

response.Cookies("Gemisum")("username")=trim(request("username"))
response.Cookies("Gemisum")("reglx")=1
response.Cookies("Gemisum")("yucun")=0
response.Cookies("Gemisum")("jifen")=0
session("regtimes")=1
session.Timeout=1
'发送邮件
'if Forum_Setting(47)=1 then
	on error resume next
	'发送注册邮件
	topic="您在" & webname & "的注册资料"
	getpass=trim(request("userpassword"))
	
	mailbody="<html>"
	mailbody=mailbody & "<title>注册信息</title>"
	mailbody=mailbody & "<body>"
	mailbody=mailbody & "<TABLE border=0 width='95%' align=center><TBODY><TR>"
	mailbody=mailbody & "<TD valign=middle align=top>"
	mailbody=mailbody & trim(request("username"))&"，您好：<br><br>"
	mailbody=mailbody & "欢迎您注册" & webname & "，我们将提供给您最好的服务！<br>"
	mailbody=mailbody & "下面是您在" & webname & "的注册信息：<br><br>"
	mailbody=mailbody & "注册名："&trim(request("username"))&"<br>"
	mailbody=mailbody & "密  码："&getpass&"<br>"
	mailbody=mailbody & "<br><br>"
	mailbody=mailbody & "<center><font color=red>再次感谢您注册" & webname & "！</font>"
	mailbody=mailbody & "</TD></TR></TBODY></TABLE><br><hr width=95% size=1>"
	mailbody=mailbody & "</body>"
	mailbody=mailbody & "</html>"
	
Set JMail=Server.CreateObject("JMail.Message")
	JMail.Charset="gb2312"
	JMail.ContentType = "text/html"
jmail.from = mailsend
jmail.silent = true
jmail.Logging = true
jmail.FromName = mailname
jmail.mailserverusername = mailusername
jmail.mailserverpassword = mailuserpass
jmail.AddRecipient trim(request("useremail"))
jmail.body=mailbody
JMail.Subject=topic
if not jmail.Send ( mailaddress ) then
SendMail=""
else
SendMail="OK"
end if
	if SendMail="OK" then
	sendmsg="<p>· 您的注册信息已经发往您的邮箱，请注意查收!</p>"
	else
	sendmsg="<p>· 系统出错，注册信息资料未能发送到您的邮箱!</p>"
	end if
	'response.write mailbody
'end if

response.Write "<table width=760 align=center border=0 cellspacing=0 cellpadding=0 class=table-zuoyou bordercolor=#CCCCCC><tr><td bordercolor=#FFFFFF bgcolor=#FFFFFF align=center> "
response.Write "<table width=450 border=0 align=center cellpadding=0 cellspacing=0><tr><td height=260>"
response.Write "<p>· <font color=red>用户注册成功!</font></p><p>· 恭喜您注册成为 ["&webname&"] 的正式用户，请记好您的用户名及密码!</p>"
response.Write "<p>· <a href='/'>返回首页</a></p></td></tr></table></td></tr></table>"
end sub

sub usererr()
response.write "<table width=760 align=center border=0 cellspacing=0 cellpadding=0 class=table-zuoyou bordercolor=#CCCCCC><tr><td bordercolor=#FFFFFF bgcolor=#FFFFFF align=center>"
response.write "<table width=450 border=0 align=center cellpadding=2 cellspacing=0><tr><td height=260>"
response.write "<p>· <font color=red>用户注册失败!</font></p><p>· 您输入的用户名或e-mail地址已存在，请返回重新输入!</p><p>· <a href=javascript:history.go(-1)>返回上一页</a></p> </td></tr></table></td></tr></table>"
end sub
%>
            </td>
          </tr>
        </table></TD>
    </TR>
  </TBODY>
</TABLE>
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
  <TBODY>
    <TR>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></TD>
      <TD 
height=25 align=middle background=../images/foot_patt01.gif><a href="/">网站首页</a> | <a href=../about.asp?action=about >关于我们</a> | <a href=../about.asp?action=lxwm >业务联系</a> | <a href=../help.asp?action=shiyongfalv >版权声明</a> | <a href=../help.asp?action=fukuan >付款方式</a> | <a href=../gbook.asp >留言/建议/投诉</a></TD>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></TD>
    </TR>
    <TR>
      <TD height=60><div align="center">
          <%dim endtime
endtime=timer()
response.Write "　公司地址："&dizhi&"　邮政编码："&youbian&"<br>"
response.Write "　客服邮箱：<a href=mailto:"&webemail&">"&webemail&"</a>　客服电话："&dianhua&"<br>　"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write "　页面执行时间："&FormatNumber((endtime-startime)*1000,3)&" 毫秒"
%>
      </div></TD>
    </TR>
  </TBODY>
</TABLE>
</body>
</html>