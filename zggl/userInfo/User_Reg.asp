<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->

<%dim action
action=request.QueryString("action")%>
<html><head><title><%=webname%>--���û�ע��</title>
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
    alert("�Բ�������д�û�����");
	return false;
  }
    if(checkspace(document.userinfo.userpassword.value) || document.userinfo.userpassword.value.length < 6 || document.userinfo.userpassword.value.length >20) {
	document.userinfo.userpassword.focus();
    alert("���볤�Ȳ��ܲ�����գ���6λ��20λ֮�䣬���������룡");
	return false;
  }
    if(document.userinfo.userpassword.value != document.userinfo.userpassword1.value) {
	document.userinfo.userpassword.focus();
	document.userinfo.userpassword.value = '';
	document.userinfo.userpassword1.value = '';
    alert("������������벻ͬ�����������룡");
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
      alert("Email��ַ��ʽ����ȷ��");
      document.userinfo.useremail.focus();
      return false;
      }
if(checkspace(document.userinfo.useremail.value)) {
   alert("Email����Ϊ�գ�");
   document.userinfo.useremail.focus();
   return false;
   }
   if(checkspace(document.userinfo.userzhenshiname.value)) {
	document.userinfo.userzhenshiname.focus();
    alert("�Բ�������д��ʵ������");
	return false;
  }
   if(checkspace(document.userinfo.idcard.value)) {
	document.userinfo.idcard.focus();
    alert("�Բ�������д��ʵ���֤��");
	return false;
  }
     if(checkspace(document.userinfo.work.value)) {
	document.userinfo.work.focus();
    alert("�Բ�������д�㹤����");
	return false;
  }
  if(checkspace(document.userinfo.address.value)) {
	document.userinfo.address.focus();
    alert("�Բ�������д��ϸ��ַ��");
	return false;
  }
  if(checkspace(document.userinfo.youbian.value)) {
	document.userinfo.youbian.focus();
    alert("�Բ�������д�ʱ࣡");
	return false;
  }
  if(document.userinfo.youbian.value.length!=6) {
	document.userinfo.youbian.focus();
    alert("�Բ�������ȷ��д�ʱ࣡");
	return false;
  } 
    if(checkspace(document.userinfo.usertel.value)) {
	document.userinfo.usertel.focus();
    alert("�Բ���������������ϵ�绰��");
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onMouseOver="window.status='��<%=webname%>��<%=weburl%> �����ϲ����վ,�����˰ѱ�վ���ܸ����ĺ���Ŷ������';return true">
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
                  <div align="center"><FONT color=#ffffff><a href="/"><FONT color=#ffffff>��ҳ</Font></a> | <a href="../News.asp"><FONT color=#ffffff>���Ŷ�̬</Font></a> | <a href="../xl.html"><FONT color=#ffffff>�ȼٲ�Ʒ</FONT></a> | <a href="../hotel.html"><FONT color=#ffffff>�Ƶ�Ԥ��</FONT></a> |<a href="../ticket.asp"><font color="#FFFFFF"> ��ƱԤ��</font></a> | <a href="../guide.asp"><font color="#FFFFFF">�����Ƽ�</font></a> | <a href="../pic.asp"><font color="#FFFFFF">��ͼ����</font></a> | <a href="../Gbook.asp"><font color="#FFFFFF">�������</font></a> | <a href="userInfo.asp"><font color="#FFFFFF">��Ա����</font></a> | <a href="../Help.asp"><font color="#FFFFFF">���߰���</font></a></FONT> <img src="../images/b_start.gif" width=122 height=16 border=0 align="absmiddle"></div></TD>
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
          <TD width="715"><FONT color=#333333>&nbsp;����λ�ã�&nbsp;</FONT><a href="/">��վ����ҳ</a> &gt;&gt; ��Աע��</TD>
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
                              <td height="40" align="center"><font color=red><strong>���û���ϸ�Ķ�<%=webname%>ע����Լ</strong></font></td>
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
                              <INPUT class="go-wenbenkuang" type=submit value=" ͬ��ע�� " name=Submit>
                          </FORM></td>
                          <td width="50%" align="left"><FORM action="/index.asp" method=post>
                              <INPUT class=go-wenbenkuang type=submit value=" �Ҳ�ͬ�� ">
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
			document.forms.register.Submit.value = " ͬ��ע�� ";
		} else {
			wut = (wait/100)-num;
			document.forms.register.Submit.value = " ͬ��ǰ�����Ķ� (" + wut + ")";
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
                    ���������ϸ��д������Ϣ�����˶����󣬹����û�������������ʵ����������<br>
              δ�������������ĸ�����Ϣ���Ᵽ�ܡ�(�� <font color=red>**</font> ��Ϊ������) </b></font>
                      <form name=userinfo method=post action=User_reg.asp?action=save>
                        <table width="80%" border="0" cellpadding="5" cellspacing="1" bgcolor="#CCCCCC" align="center">
                          <tr>
                            <td height=30 colspan=2 background="../Images/topBar_bg.gif"><font color="#FF3300"><img src="../Images/ring01.gif" width="9" height="9"> �û���������</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>�� �� ����</td>
                            <td width=70% class=pad><input class="wenbenkuang" name="username" type="text" id="username" maxLength="18">
                                <font color=red>*</font> ֧������,��֧�����������:*%#!-&%$</td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>�ܡ����룺</td>
                            <td class=pad><input class="wenbenkuang" name="userpassword" type="password" id="userpassword" maxLength="18">
                                <font color=red>*</font> ��֧�����������:*%#!-&%$</td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>ȷ�����룺</td>
                            <td class=pad><input class="wenbenkuang" name="userpassword1" type="password" id="userpassword1" maxLength="18">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>�������䣺</td>
                            <td class=pad><input class="wenbenkuang" name="useremail" type="text" id="useremail">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td height="30" colspan="2" valign="middle" background="../Images/topBar_bg.gif"><font color="#FF3300"><img src="../Images/ring01.gif" width="9" height="9"> �û���ϸ����</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>������ʵ������</td>
                            <td class=pad><input name="userzhenshiname" type="text" id="userzhenshiname" size="10">
                                <font color=red>*</font> �Ա�ȷ�� </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>�������֤�ţ�</td>
                            <td class=pad><input class="wenbenkuang" name="idcard" type="text" id="idcard" maxlength="18" onKeyPress="event.returnValue=IsDigit();">
                              <font color=red>*</font>                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>�ա�����</td>
                            <td class=pad><input type=radio name=sex id=Select1 value=�� checked>
                              ��
                                <input type=radio name=sex id=Select1 value=Ů>
                                Ů </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right> ������</td>
                            <td class=pad><input name="work" type="text" id="work" size="15">
                              <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>ͨѶ��ַ��</td>
                            <td class=pad><input class="wenbenkuang" name="address" type="text" id="address" size="40" maxlength="30">
                                <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>�ʡ����ࣺ</td>
                            <td class=pad><input class="wenbenkuang" name="youbian" type="text" id="youbian" maxlength="6" size="10" onKeyPress="event.returnValue=IsDigit();">
                                <font color=red>*</font></td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align=right>��ϵ�绰��</td>
                            <td class=pad><input class="wenbenkuang" name="usertel" maxlength="18" type="text" id="usertel">
                                <font color=red>*</font> </td>
                          </tr>
                          <tr bgcolor="#FFFFFF">
                            <td width=30% align="right"></td>
                            <td class=pad><input class="go-wenbenkuang" onClick="return checkuserinfo();" type=submit name="submit" value=" �ύ��Ϣ ">
                                <input class="go-wenbenkuang" onclick="ClearReset()" type=reset name="Clear" value=" ������д ">
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
response.Write "<table width=760 border=0 cellspacing=0 cellpadding=0 align=center><tr><td height=300 align=center><font color=red>�Բ�������ע����û������Ժ��ٽ���ע��!</font></td></tr></table>"
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
'�����ʼ�
'if Forum_Setting(47)=1 then
	on error resume next
	'����ע���ʼ�
	topic="����" & webname & "��ע������"
	getpass=trim(request("userpassword"))
	
	mailbody="<html>"
	mailbody=mailbody & "<title>ע����Ϣ</title>"
	mailbody=mailbody & "<body>"
	mailbody=mailbody & "<TABLE border=0 width='95%' align=center><TBODY><TR>"
	mailbody=mailbody & "<TD valign=middle align=top>"
	mailbody=mailbody & trim(request("username"))&"�����ã�<br><br>"
	mailbody=mailbody & "��ӭ��ע��" & webname & "�����ǽ��ṩ������õķ���<br>"
	mailbody=mailbody & "����������" & webname & "��ע����Ϣ��<br><br>"
	mailbody=mailbody & "ע������"&trim(request("username"))&"<br>"
	mailbody=mailbody & "��  �룺"&getpass&"<br>"
	mailbody=mailbody & "<br><br>"
	mailbody=mailbody & "<center><font color=red>�ٴθ�л��ע��" & webname & "��</font>"
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
	sendmsg="<p>�� ����ע����Ϣ�Ѿ������������䣬��ע�����!</p>"
	else
	sendmsg="<p>�� ϵͳ����ע����Ϣ����δ�ܷ��͵���������!</p>"
	end if
	'response.write mailbody
'end if

response.Write "<table width=760 align=center border=0 cellspacing=0 cellpadding=0 class=table-zuoyou bordercolor=#CCCCCC><tr><td bordercolor=#FFFFFF bgcolor=#FFFFFF align=center> "
response.Write "<table width=450 border=0 align=center cellpadding=0 cellspacing=0><tr><td height=260>"
response.Write "<p>�� <font color=red>�û�ע��ɹ�!</font></p><p>�� ��ϲ��ע���Ϊ ["&webname&"] ����ʽ�û�����Ǻ������û���������!</p>"
response.Write "<p>�� <a href='/'>������ҳ</a></p></td></tr></table></td></tr></table>"
end sub

sub usererr()
response.write "<table width=760 align=center border=0 cellspacing=0 cellpadding=0 class=table-zuoyou bordercolor=#CCCCCC><tr><td bordercolor=#FFFFFF bgcolor=#FFFFFF align=center>"
response.write "<table width=450 border=0 align=center cellpadding=2 cellspacing=0><tr><td height=260>"
response.write "<p>�� <font color=red>�û�ע��ʧ��!</font></p><p>�� ��������û�����e-mail��ַ�Ѵ��ڣ��뷵����������!</p><p>�� <a href=javascript:history.go(-1)>������һҳ</a></p> </td></tr></table></td></tr></table>"
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
height=25 align=middle background=../images/foot_patt01.gif><a href="/">��վ��ҳ</a> | <a href=../about.asp?action=about >��������</a> | <a href=../about.asp?action=lxwm >ҵ����ϵ</a> | <a href=../help.asp?action=shiyongfalv >��Ȩ����</a> | <a href=../help.asp?action=fukuan >���ʽ</a> | <a href=../gbook.asp >����/����/Ͷ��</a></TD>
      <TD width="1" rowspan="2" align=middle vAlign=bottom bgcolor="#CCCCCC"></TD>
    </TR>
    <TR>
      <TD height=60><div align="center">
          <%dim endtime
endtime=timer()
response.Write "����˾��ַ��"&dizhi&"���������룺"&youbian&"<br>"
response.Write "���ͷ����䣺<a href=mailto:"&webemail&">"&webemail&"</a>���ͷ��绰��"&dianhua&"<br>��"
response.Write "  <font color=#000000><b>"&weburl&"</b></font> &copy; <font color=red> "&copyright&" </font>"
response.Write "��ҳ��ִ��ʱ�䣺"&FormatNumber((endtime-startime)*1000,3)&" ����"
%>
      </div></TD>
    </TR>
  </TBODY>
</TABLE>
</body>
</html>