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
                              <td height="40" align="center"><font color=red><strong>���û���ϸ�Ķ�<%=webname%>ע����Լ</strong></font></td>
                            </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><table width="80%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#CCCCCC">
                            <tr bgcolor="#ffffff">
                              <td>
<P>���й��������������</P>
<P>1���й����������������ȷ��</P>
<P>�����й�������������������Ȩ������Ȩ���й�������Ϣ�������޹�˾�����¼��"�й�����"�����С�������������з���Լ������һ������ѡ"ע��"��ͨ��ע����򣬼���ʾ����Ը���ܱ�Э��֮����������ѳ�Ϊ�й���������ע���Ա��<br />2����������</P>
<P>����2.1���й�����������ľ����������й����ø���ʵ������ṩ���й����ö������ṩ֮����ӵ�����ս���Ȩ��<br />����2.2���й��������й��������������Ա�ṩ�����������������������йص��豸������˵��ԡ��ֻ�������������뻥�������ƶ����йص�װ�ã�������ķ��ã���Ϊ���뻥������֧���ĵ绰�Ѽ������ѡ�Ϊʹ���ƶ�����֧�����ֻ��ѣ����ɻ�Ա���и�����</P>
<P><br />3����Ա�ʺż�����</P>
<P>������ע���Ա�ɹ��󣬽��õ�һ���ʺź����롣��Ӧ���Ʊ��ܸ��ʺż����룬�����Ը��ʺŽ��е����л���¼����������Ρ���ڿ���Ϊ���Ա���������ʹ�ʺš����뱻���˷Ƿ�ʹ�õģ��й����ò��е��κ����Ρ����������κηǷ�ʹ�û�Ա�ʺŻ�ȫ©������������������й�������ϵ��</P>
<P><br />4����ԱȨ�� </P>
<P>����4.1����Ա��Ȩ�����й����ù涨�ĳ����Ҫ��ʹ���й��������Ա�ṩ�ĸ���������������Ա�Ը÷��������飬�������й�������ϵ�Ա�õ���ʱ�����<br />����4.2���û�������ʹ���й��������������ʱ���������й��������ṩ׼ȷ�ĸ������ϣ��� �����������κα䶯�����뼰ʱ���¡�<br />����4.3����Ա��ͬ������й�������ͨ�������ʼ���������ʽ���Ա���ʹ��������������ҵ��Ϣ��<br />����4.4����Ա���й�����������ҳ�Ϸ�����Ϣ���������й��������ķ���ʱ������Ϲ��ҵķ��ɷ����Լ����ʷ����йع涨��<br />����4.5�����ڻ�Աͨ���й�������������Ϣƽ̨����������������̳��BBS�����ۣ��ϴ����й���������վ�Ͽɹ�����ȡ������κ����ݣ���Աͬ�������й�������ȫ���緶Χ��������ȫ�ġ���ѵġ������Եġ����ɳ����ġ��Ƕ��ҵ�Ȩ�����Լ�����ɵ�������Ȩ������ʹ�á����ơ��޸ġ��ıࡢ���桢���롢���Դ���������Ʒ�����������ݺ�չʾ�˵����ݣ�����򲿷֣�����/�򽫴˵����ݱ��뵱ǰ��֪�Ļ��Ժ󿪷��������κ���ʽ����Ʒ��ý������С�<br />����4.6����Ա��ŵ�������й�����������Ϣƽ̨����������������̳��BBS�����ۣ����������� Ϣ��<br />������(1) �����ܷ���ȷ���Ļ���ԭ��ģ�<br />������(2) Σ�����Ұ�ȫ��й¶�������ܣ��߸�������Ȩ���ƻ�����ͳһ�ģ�<br />������(3) �𺦹�������������ģ�<br />������(4) ɿ�������ޡ��������ӣ��ƻ������Ž�ģ�<br />������(5) �ƻ������ڽ����ߣ�����а�̺ͷ⽨���ŵģ�<br />������(6) ɢ��ҥ�ԣ�������������ƻ�����ȶ��ģ�<br />������(7) ɢ�����ࡢɫ�顢�Ĳ�����������ɱ���ֲ����߽�������ģ�<br />������(8) ������߷̰����ˣ��ֺ����˺Ϸ�Ȩ��ģ�<br />������(9) ���з��ɡ����������ֹ���������ݵġ�<br />����4.7����Ա����Ϊ�䷢�����й�����������Ϣ�е����Ρ���Ա�����й�������ɢ���ʹ���Υ����Ϣ�������Ա�����ϵͳ��¼�п�����Ϊ��ԱΥ��֤֮�ݡ�<br />����4.8����Ա�������ñ�վ�ķ���������»��<br />������(1) δ����������������Ϣ�������ʹ�ü������Ϣ������Դ��<br />������(2) δ�������Լ������Ϣ���繦�ܽ���ɾ�����޸Ļ������ӣ�<br />������(3) δ�������Խ���������Ϣ�����д洢��������ߴ�������ݺ�Ӧ�ó������ɾ�����޸Ļ������ӣ�<br />������(4) ��������������������������ƻ��Գ���<br />������(5) ����Σ���������Ϣ���簲ȫ����Ϊ��<br />����4.9����Ա�������κη�ʽ���ű�վ�ķ���<br />����4.10����Ա��ŵ���ر�վ�����������涨�ͳ���<br />����4.11�������ԱΥ�������涨���й�������ȨҪ���������ֱ�Ӳ�ȡһ�б�Ҫ��ʩ�������������ڸ��Ļ�ɾ����Ա��������Ϣ���жϻ���ֹ��Աʹ�������Ȩ���ȣ����Լ����Ա������Ϊ����ɵ�Ӱ�졣</P>							  
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
                              <input class="go-wenbenkuang" type=submit value=" ͬ��ע�� " name=Submit>
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
	secs = 6; // Number of secs to delay -CHINA-studio
	wait = secs * 1000;
	document.forms.register.Submit.disabled =true;
	for(i=1;i<=(wait/1000);i++) {
		window.setTimeout("doUpdate(" + i + ")", i * 1000);
	}
	window.setTimeout("Timer()", wait);

	function doUpdate(num) {
		if(num == (wait/1000)) {
			document.forms.register.Submit.value = " ͬ��ע�� ";
		} else {
			wut = (wait/1000)-num;
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

</body>
</html>