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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<TABLE width="770" border=0 align="center" cellPadding=0 cellSpacing=0>
      <TBODY>
        <TR vAlign=middle bgcolor="#0F77B1">
          <TD height=27 
                colSpan=2 align=left class=b>
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
                              <td>
<P>《中国国旅网服务条款》</P>
<P>1．中国国旅网服务条款的确认</P>
<P>　　中国国旅网各项服务的所有权与运作权归中国国旅信息技术有限公司（以下简称"中国国旅"）所有。本服务条款具有法律约束力。一旦您点选"注册"并通过注册程序，即表示您自愿接受本协议之所有条款，并已成为中国国旅网的注册会员。<br />2．服务内容</P>
<P>　　2.1　中国国旅网服务的具体内容由中国国旅根据实际情况提供，中国国旅对其所提供之服务拥有最终解释权。<br />　　2.2　中国国旅在中国国旅网上向其会员提供相关网络服务，与相关网络服务有关的设备（如个人电脑、手机、及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费）均由会员自行负担。</P>
<P><br />3．会员帐号及密码</P>
<P>　　您注册会员成功后，将得到一个帐号和密码。您应妥善保管该帐号及密码，并对以该帐号进行的所有活动及事件负法律责任。因黑客行为或会员保管疏忽致使帐号、密码被他人非法使用的，中国国旅不承担任何责任。如您发现任何非法使用会员帐号或安全漏洞的情况，请立即与中国国旅联系。</P>
<P><br />4．会员权责 </P>
<P>　　4.1　会员有权按照中国国旅规定的程序和要求使用中国国旅向会员提供的各项网络服务，如果会员对该服务有异议，可以与中国国旅联系以便得到及时解决。<br />　　4.2　用户在申请使用中国国旅网网络服务时，必须向中国国旅网提供准确的个人资料，如 个人资料有任何变动，必须及时更新。<br />　　4.3　会员须同意接受中国国旅网通过电子邮件或其他方式向会员发送促销或其他相关商业信息。<br />　　4.4　会员在中国国旅网的网页上发布信息或者利用中国国旅网的服务时必须符合国家的法律法规以及国际法的有关规定。<br />　　4.5　对于会员通过中国国旅网网上消息平台（包括但不限于论坛、BBS、评论）上传到中国国旅网网站上可公开获取区域的任何内容，会员同意授予中国国旅在全世界范围内享有完全的、免费的、永久性的、不可撤销的、非独家的权利，以及再许可第三方的权利，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知的或以后开发的其他任何形式的作品、媒体或技术中。<br />　　4.6　会员承诺不会在中国国旅网的消息平台（包括但不限于论坛、BBS、评论）发布如下信 息：<br />　　　(1) 反对宪法所确定的基本原则的；<br />　　　(2) 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br />　　　(3) 损害国家荣誉和利益的；<br />　　　(4) 煽动民族仇恨、民族歧视，破坏民族团结的；<br />　　　(5) 破坏国家宗教政策，宣扬邪教和封建迷信的；<br />　　　(6) 散布谣言，扰乱社会秩序，破坏社会稳定的；<br />　　　(7) 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br />　　　(8) 侮辱或者诽谤他人，侵害他人合法权益的；<br />　　　(9) 含有法律、行政法规禁止的其他内容的。<br />　　4.7　会员单独为其发布在中国国旅网上信息承担责任。会员若在中国国旅网散布和传播违法信息，网络会员服务的系统记录有可能作为会员违法之证据。<br />　　4.8　会员不得利用本站的服务从事以下活动：<br />　　　(1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源；<br />　　　(2) 未经允许，对计算机信息网络功能进行删除、修改或者增加；<br />　　　(3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加；<br />　　　(4) 故意制作、传播计算机病毒等破坏性程序；<br />　　　(5) 其他危害计算机信息网络安全的行为。<br />　　4.9　会员不得以任何方式干扰本站的服务。<br />　　4.10　会员承诺遵守本站的所有其他规定和程序。<br />　　4.11　如果会员违反上述规定，中国国旅有权要求其改正或直接采取一切必要措施（包括但不限于更改或删除会员发布的信息、中断或终止会员使用网络的权利等），以减轻会员不当行为所造成的影响。</P>							  
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
                              <input class="go-wenbenkuang" type=submit value=" 同意注册 " name=Submit>
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
	secs = 6; // Number of secs to delay -CHINA-studio
	wait = secs * 1000;
	document.forms.register.Submit.disabled =true;
	for(i=1;i<=(wait/1000);i++) {
		window.setTimeout("doUpdate(" + i + ")", i * 1000);
	}
	window.setTimeout("Timer()", wait);

	function doUpdate(num) {
		if(num == (wait/1000)) {
			document.forms.register.Submit.value = " 同意注册 ";
		} else {
			wut = (wait/1000)-num;
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
                <!--#include file="../common/md5.asp"-->
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

</body>
</html>