<!DOCTYPE HTML>
<html>
<head>
<title>User_login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body background="images/log_box.gif">
<!--#include file="Connection.asp"--><br>
<table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
            <%if request.Cookies("Gemisum")("username")=""  then%>
            <form name="userlogin" method="post" action="User_Checklogin.asp">
              <tr>
                <td align="center"><font color="#999999">�ο�����, �����ڵ�λ��:�ȵ�¼</font></td>
              </tr>
              <tr>
                <td align="center">�û�����
                    <input type="text"  name="username" size="14">
                </td>
              </tr>
              <tr>
                <td align="center">�ܡ��룺
                    <input type="password"  name="userpassword" size="14">
                </td>
              </tr>
              <tr>
                <td align="center">��֤�룺
                    <input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6>
                    <img src=GetCode.asp> </td>
              </tr>
              <tr>
                <td height="38" align="center" valign="middle">
                  <input  name="imageField" value="�� ½" type=submit onFocus="this.blur()">
                   &nbsp;<a href=User_Reg.asp target=_blank>ע��</a>&nbsp;
                   <a href=userinfo/getpwd.asp target=_blank>����</a>&nbsp;
				   <a href="help.htm" target="_blank">����</a></td>
              </tr>
            </form>
            <%else%>
            <tr>
              <td align="center" height="38"><%
set rs=server.createobject("adodb.recordset")
rs.open "select jifen,yucun,reglx,vipdate from [userb] where username='"&request.Cookies("Gemisum")("username")&"'",conn,1,3
if rs("vipdate")<>"" then 
'���ǲ��ǹ���VIP
if rs("vipdate")<date and rs("reglx")>2 then
rs("reglx")=1
rs.update
end if
end if
response.Cookies("Gemisum")("yucun")=rs("yucun")
response.Cookies("Gemisum")("jifen")=rs("jifen")
response.Cookies("Gemisum")("reglx")=rs("reglx")
rs.close
set rs=nothing
if request.Cookies("Gemisum")("reglx")=3 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" ��ҵ�û�����<br>��Ŀǰ��"&request.Cookies("Gemisum")("jifen")&"����,Ԥ���"&request.Cookies("Gemisum")("yucun")&"Ԫ "
Else
if request.Cookies("Gemisum")("reglx")=2 then
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" �������<br>��Ŀǰ��"&request.Cookies("Gemisum")("jifen")&"����,Ԥ���"&request.Cookies("Gemisum")("yucun")&"Ԫ "
else
response.write "<br><br>"&request.Cookies("Gemisum")("username")&" ����<br>��Ŀǰ��"&request.Cookies("Gemisum")("jifen")&"����,Ԥ���"&request.Cookies("Gemisum")("yucun")&"Ԫ "
end if
end if
response.write "<br><a href=userinfo.asp target=_blank><font color=red>�����Ա����</font></a>"
response.write "<br><a href=logout.asp>ע���˳�</a>"
end if
%></td>
            </tr>
</table>
</body>
</html>