<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->

<!--#include file="md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css">
<title><%=webname%>--��Ա����</title>
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
          <TD width="715"><FONT color=#333333>&nbsp;����λ�ã�&nbsp;</FONT><a href="/">��վ����ҳ</a> &gt;&gt; ��Ա����</TD>
          <TD width="11">&nbsp;</TD>
        </TR>
      </TBODY>
    </TABLE>
  <table border="0" cellspacing="0" width="770">
    <tr>
      <td height="3" valign="top" colspan="3">
        <hr color="#FF0000" size="1">
      </td>
    </tr>
    <tr>
      <td width="24%" valign="top" bgcolor="#6688CC"><div align="center">
          <table border="0" width="100%" cellpadding="3" class=main1>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp"><font color="#FFFFFF">��������</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=EditUserinfo"><font color="#FFFFFF">�޸ĸ�������</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=pay"><font color="#FFFFFF">����֧��</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=editpass"><font color="#FFFFFF">�޸Ŀ���</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="UserInfo.asp?action=payjilu"><font color="#FFFFFF">�ҵĽ��׼�¼</font></a></td>
            </tr>
            <tr>
              <td width="7%"></td>
              <td width="93%"><a href="logout.asp"><font color="#FFFFFF">ע���˳�</font></a></td>
            </tr>
          </table>
        </div>      </td>
      <td width="1%" height="273" rowspan="2"></td>
      <td width="75%" rowspan="2" valign="top">
        <%
dim action
action=trim(request("action"))
select case action
case ""
myinfo()
case "EditUserinfo"
EditUserinfo()
case "delok"
delok
case "pay"
pay()
case "editpass"
editpass()
case "savepass"
savepass()
case "payjilu"
payjilu()
case "editok"
editok()
case else
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
end select
sub myinfo()%><div align="center">
          <table width="100%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
            <tr>
              <td height="35" colspan="2" background="../Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b> ��Ա����</b></font></div></td>     
            </tr>
            <tr>
              <td height="25" colspan="2">
                    ������ӵ��<font color="#ff0000"><b><%=rs("jifen")%></b></font>�����
��Ԥ��<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">��Ա״̬</td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�ϴν�վʱ��:</td>
              <td width="74%"><%=rs("lastlogin")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">���ߴ���:</font></td>
              <td width="74%"><%=rs("logins")%></td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">��Ա��������</td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�û���:</td>
              <td width="74%"><%=rs("username")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�Ա�:</td>
              <td width="74%"><%=rs("sex")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">E-mail:</td>
              <td width="74%"><%=rs("email")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">ע������:</td>
              <td width="74%"><%=rs("regdate")%></td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">��Ա��������</td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">��ʵ����:</font></td>
              <td width="74%"><%=rs("name")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">�ʱ�:</font></td>
              <td width="74%"><%=rs("zip")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��ϵ�绰:</td>
              <td width="74%"><%=rs("telphone")%></td>
            </tr>
<tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��ϵ��ַ:</td>
              <td width="74%"><%=rs("address")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">���֤���:</td>
              <td width="74%"><%=rs("idcard")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��������:</td>
              <td width="74%"><%=rs("birthday")%></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">����:</td>
              <td width="74%"><%=rs("work")%></td>
            </tr>
          </table>
        </div><%end sub
sub EditUserinfo()
%><div align="center">
          <table width="100%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
            <form name="form1" method="post" action="UserInfo.asp?action=editok&id=<%=rs("id")%>">
<tr>
              <td height="35" colspan="2" background="../Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>�޸Ļ�Ա����</b></font></div></td>     
            </tr>
            <tr>
              <td height="25" colspan="2">
                    ������ӵ��<font color="#ff0000"><b><%=rs("jifen")%></b></font>����� ��Ԥ��<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">��Ա��������</td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�û���:</td>
              <td width="74%"><input name="username" type="text" value="<%=rs("username")%>"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�Ա�:</td>
              <td width="74%"><input name="sex" type="text" value="<%=rs("sex")%>"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">E-mail:</font></td>
              <td width="74%"><input name="email" type="text" value="<%=rs("email")%>"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF"><font class="medium">ע������:</font></td>
              <td width="74%"><input name="regdate" type="text" value="<%=rs("regdate")%>" readonly="true"></td>
            </tr>
            <tr>
              <td height="30" colspan="2" background="../Images/topBar_bg.gif">��Ա��������</td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��ʵ����:</td>
              <td width="74%"><input name="name" type="text" value="<%=rs("name")%>"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�ʱ�:</td>
              <td width="74%"><input name="zip" type="text" value="<%=rs("zip")%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��ϵ�绰:</td>
              <td width="74%"><input name="telphone" type="text" value="<%=rs("telphone")%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��ϵ��ַ:</td>
              <td width="74%"><input name="address" type="text" value="<%=rs("address")%>"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">���֤���:</td>
              <td width="74%"><input name="idcard" type="text" value="<%=rs("idcard")%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">��������:</td>
              <td width="74%"><input name="birthday" type="text" value="<%=rs("birthday")%>">
                <font color="#FF0000">����ʽ����-��-�գ�</font></td>
            </tr>
            <tr>
              <td width="26%" height="25" align="right" bgcolor="#EFEFEF">����:</td>
              <td width="74%"><input name="work" type="text" value="<%=rs("work")%>"></td>
            </tr>
            <tr align="center">
              <td height="35" colspan="2" bgcolor="#EFEFEF"><input type="submit" name="Submit" value="�ύ�޸�">
                &nbsp;
                <input type="reset" name="Submit2" value="�����"></td>
              </tr>
          </form>
</table>
</div>
<%end sub
sub editpass()
%>
<script language=JavaScript>
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function passcheck()
{
    if(document.userpass.userpassword.value.length < 6 || document.userpass.userpassword.value.length >20) {
	document.userpass.userpassword.focus();
    alert("���볤�Ȳ��ܲ�����գ���6λ��20λ֮�䣬���������룡");
	return false;
  }
   if(document.userpass.userpassword.value!==document.userpass.userpassword2.value) {
	document.userpass.userpassword.focus();
    alert("�Բ��������������벻һ����");
	return false;
  }
   if(checkspace(document.userpass.quesion.value)) {
	document.userpass.quesion.focus();
    alert("�Բ�������д�������ʣ�");
	return false;
  }
}
</script>
<%
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from [userb] where username='"&request.cookies("Gemisum")("username")&"' ",conn,1,1
%>
<table width=323 border=0 align=center cellpadding=0 cellspacing=0 class="table-zuoshang">
  <form name="userpass" method="post" action="userinfo.asp?action=savepass">
    <tr class="a1"> 
      <td height="42" colspan=2 class="table-xiayou"> <div align="center"><font color=#FF0000>�𾴵��û�������������ŵ��<br>
          ������Ϣ�����ϸ��ܣ����Բ��ṩ�����������������á�</font></div></td>
    </tr>
    <tr class="a1">
      <td height="25" class="table-xiayou"><div align="right">�� �� ����</div></td>
      <td class="table-xiayou"><font color=#FF6600><%=request.cookies("Gemisum")("username")%></font></td>
    </tr>
    <tr> 
      <td height=25 bgcolor=#ffffff class="table-xiayou"> 
        <div align="right">ԭ���룺</div></td>
      <td height=22 bgcolor=#ffffff class="table-xiayou"><input name=userpassword3 type=password id="userpassword3" value="" size="16"></td>
    </tr>
    <tr> 
      <td height=25 bgcolor=#ffffff class="table-xiayou"> 
        <div align="right">�� �� �룺 </div></td>
      <td height=22 bgcolor=#ffffff class="table-xiayou"> 
        <input name=userpassword type=password value="" size="16">
        (���޸���Ϊ��) </td>
    </tr>
    <tr> 
      <td height=25 bgcolor=#ffffff class="table-xiayou"> 
        <div align="right">����ȷ�ϣ� </div></td>
      <td height=22 bgcolor=#ffffff class="table-xiayou"> 
        <input name=userpassword2 type=password value="" size="16">
      </td>
    </tr>
    <tr align="center"> 
      <td height=25 bgcolor=#ffffff colspan="2" class="table-xiayou"> 
        <div align="center"> 
          <input name="Submit2" type="submit" value="�ύ����" onclick='return passcheck();'>
        </div>
      </td>
    </tr>
  </form>
</table>
<%rs.close
set rs=nothing
end sub
sub pay()
%>
<script language='JavaScript'>
function conFirmv_amount()
{
	document.E_FORM.v_amount.value=Math.round(document.E_FORM.v_amount.value);
	if ( document.E_FORM.v_amount.value <= 0 )
	{
	alert('���������0');
    return false;
	}
	var stConFirm = '����ת�ʽ��Ϊ: ' + document.E_FORM.v_amount.value + ' Ԫ!\n';
	return confirm(stConFirm);
}
</script>

	<center>
    <table width="430">
      <form method="post" action="checklist.asp" name="E_FORM" onSubmit="conFirmv_amount();" target="_blank">
	  <tr> 
        <td height="37" colspan="2" align="right"><div align="center"><img src="images/logo4.gif" border="0" width="200" height="79" alt="����վ�����������߰�ȫ֧��ƽ̨"></div></td>
        </tr>
	  <tr>
	    <td width="26%" align="right">�û���:</td>
	    <td width="74%"><input name="dinghuorenxingming" type="text" value="<%=request.cookies("Gemisum")("username")%>" size="20" maxlength="35"></td>
	  </tr>      
	  <tr> 
        <td align="right">������:</td>
        <td><input name="v_amount" type=text onkeyup="if(isNaN(value))execCommand('undo')" value="1.00" size="20">
          Ʃ�磺<font color="#FF0000">1.00</font></td>
      </tr>
      <tr>
        <td colspan="2" align="right"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">������֧���ɹ�֮�����ǣ�ϵͳ���Զ��������Ԥ����У������ʹ��Ԥ����еĽ��ѡ��������Ҫ�ķ���,��ϵͳ��ͨ���й���������֧��ϵͳ֧���ģ�����Է���ʹ�ã����κ��������µ�(<%=dianhua%>)�����ȳ�Ϊ�����!</font></div></td>
        </tr>
      <tr>
        <td colspan="2" align="right"><div align="center">
          <input type=submit name=v_action value="�ύ" onClick="MM_validateForm('dinghuorenxingming','','R');return document.MM_returnValue">
        </div></td>
      </tr>
    </form>
	</table>
	</center>
<%end sub
sub editok()
id=request("id")
set rse=server.createobject("adodb.recordset")
sqle="select * from userb where id="&id
rse.open sqle,conn,3,3
rse("username")=request.form("username")
rse("name")=request.form("name")
rse("sex")=request.form("sex")
rse("email")=request.form("email")
rse("zip")=request.form("zip")
rse("telphone")=request.form("telphone")
rse("address")=request.form("address")
rse("idcard")=request.form("idcard")
rse("birthday")=request.form("birthday")
rse("work")=request.form("work")
rse.update
rse.close
response.Write "<script language=javascript>alert('�û����ϸ��ĳɹ���');history.go(-1);</script>"
end sub
sub savepass()
dim username
username=request.Cookies("Gemisum")("username")
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from [userb] where username='"&username&"'",conn,1,3
if md5(trim(request("userpassword3")))<>trim(rs("userpassword")) then
response.Write "<script language=javascript>alert('�Բ����������ԭ�������');history.go(-1);</script>"
response.End
else
if trim(request("userpassword"))<>"" then
rs("userpassword")=md5(trim(request("userpassword")))
end if
rs.update
rs.close
set rs=nothing
response.Write "<script language=javascript>alert('������ĳɹ���');window.location.href='"&request.servervariables("http_referer")&"';</script>"
response.End
end if
end sub
sub payjilu()
dim u
use=request.Cookies("Gemisum")("username")
topb="select * from payjilu where username = '"&use&"'"
set rsp=conn.execute (topb)
%>
<table width="460" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
  <tr>
    <td width="43" height="30"><div align="center">���</div></td>
    <td width="74"><div align="center">������Ŀ</div></td>
    <td width="146"><div align="center">��������</div></td>
    <td width="95"><div align="center">���׼۸�</div></td>
    <td width="90"><div align="center">����ʱ��</div></td>
    </tr>
  <%while not rsp.eof%><tr>
    <td height="25"><div align="center"><%=rsp("id")%></div></td>
    <td><div align="center"><%=rsp("type")%></div></td>
    <td><div align="center"><%=rsp("name")%></div></td>
    <td><div align="center"><%=rsp("jiage")%> RMB</div></td>
    <td><div align="center"><%=rsp("paytime")%></div></td>
    </tr><%
rsp.movenext
wend
rsp.close
end sub%>
</table>

      </td>
    </tr>
  </table>
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
  </center>
</div>

</body>

</html>
<%
rs.close
conn.close
%>
