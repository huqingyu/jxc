<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/WebConfig.asp"-->
<!--#include file="../common//md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
<title><%=webname%>--��Ա����</title>
</head>
<%
dim uid ,upwd
uid=request.Cookies("Gemisum")("username")
set rs=server.createobject("adodb.recordset")
sqltext="select * from [userb] where username='"&uid&"'"
rs.open sqltext,conn,1,1
%>
<body bgcolor="#ffffff" scroll="no" style="margin:0px">
<br>
<div align="center">
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
sub myinfo()%>
    <div align="center">
      <table width="95%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
        <tr>
          <td height="35" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>
              <%if request.Cookies("Gemisum")("reglx")=3 then
response.write ""&request.Cookies("Gemisum")("username")&"(��ҵ��Ա)"
else
response.write ""&request.Cookies("Gemisum")("username")&"(��ͨ��Ա)"
end if%>
              (ID��<%=rs("id")%>)��Ա����</b></font></div></td>
        </tr>
        <tr>
          <td height="25" colspan="2"> ������ӵ��<font color="#ff0000"><b><%=rs("jifen")%></b></font>����� ��Ԥ��<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
        </tr>
        <tr>
          <td height="30" colspan="2" background="Images/topBar_bg.gif">��Ա״̬</td>
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
          <td height="30" colspan="2" background="Images/topBar_bg.gif">��Ա��������</td>
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
          <td height="30" colspan="2" background="Images/topBar_bg.gif">��Ա��������</td>
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
    </div>
    <%end sub
sub EditUserinfo()
%>
    <div align="center">
      <table width="95%"border=1 cellPadding=0 cellSpacing=0 bordercolor="#CCCCCC" borderColorDark=#ffffff bgcolor="#F9F9F9">
        <form name="form1" method="post" action="User_main.asp?action=editok&id=<%=rs("id")%>">
          <tr>
            <td height="35" colspan="2" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>�޸Ļ�Ա����</b></font></div></td>
          </tr>
          <tr>
            <td height="25" colspan="2"> ������ӵ��<font color="#ff0000"><b><%=rs("jifen")%></b></font>����� ��Ԥ��<font color="#ff0000"><b><%=rs("yucun")%></b></font> RMB</td>
          </tr>
          <tr>
            <td height="30" colspan="2" background="Images/topBar_bg.gif">��Ա��������</td>
          </tr>
          <tr>
            <td width="26%" height="25" align="right" bgcolor="#EFEFEF">�û���:</td>
            <td width="74%"><input name="username" type="text" value="<%=rs("username")%>" readonly="true"></td>
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
            <td height="30" colspan="2" background="Images/topBar_bg.gif">��Ա��������</td>
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
		  <!--___________��ҵ�û�����______-->
		  <%if request.Cookies("Gemisum")("reglx")=3 then%>
		  <tr> 
            <td width="26%" height="25" ><div align="right">��˾���ƣ�</div></td>
            <td> 
              <input name=Qy_Name type=text id="Qy_Name" value="<%=trim(rs("Qy_Name"))%>" size="35" >              </td>
          </tr>
		            <tr> 
            <td width="26%" height="25" ><div align="right">��˾�绰��</div></td>
            <td> 
              <input name=Qy_Tel type=text id="Qy_Tel" value="<%=trim(rs("Qy_Tel"))%>" size="25"></td>
          </tr>
		            <tr> 
            <td width="26%" height="25" ><div align="right">��˾E-Mail��</div></td>
            <td> 
              <input name=Qy_Email type=text id="Qy_Email" value="<%=trim(rs("Qy_Email"))%>" size="25"></td>
          </tr>
		  <% end if%>
		  <!--_____________________________-->
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
          <td height="42" colspan=2 class="table-xiayou">
            <div align="center"><font color=#FF0000>�𾴵��û�������������ŵ��<br>
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
          </div></td>
        </tr>
      </form>
    </table>
    <%rs.close
set rs=nothing
end sub
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
rse("Qy_Name")=request.form("Qy_Name")
rse("Qy_Tel")=request.form("Qy_Tel")
rse("Qy_Email")=request.form("Qy_Email")
if request.form("birthday")<>"" Then
rse("birthday")=request.form("birthday")
End if
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
      <%while not rsp.eof%>
      <tr>
        <td height="25"><div align="center"><%=rsp("id")%></div></td>
        <td><div align="center"><%=rsp("type")%></div></td>
        <td><div align="center"><%=rsp("name")%></div></td>
        <td><div align="center"><%=rsp("jiage")%> RMB</div></td>
        <td><div align="center"><%=rsp("paytime")%></div></td>
      </tr>
      <%
rsp.movenext
wend
rsp.close
end sub%>
    </table>
</div>
</body>
</html>
<%
conn.close
%>
