<%
session("hotelid")=request("hotelid")
session("roomid")=request("roomid")
%>
<!--#include file="../common/conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css"><title>��ԱԤ����¼</title>
</head>
<body>
<br><br><br>
      <div align="center">
        <center>
            <TABLE cellSpacing=0 cellPadding=0 width=572 border=0>
              <TR>
                <TD width="588" vAlign=top><BR>                    <BR>
                    <TABLE cellSpacing=0 cellPadding=0 width=572 border=0>
                      <TBODY>
                        <TR>
                          <TD><IMG height=11 src="images/hotel_dire_bar1.jpg" width=572 /></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                    <TABLE cellSpacing=0 cellPadding=0 width=572 border=0>
        <TR>
          <TD width=1 bgColor=#88b3be><IMG height=1 
            src="images/z.gif" width=1></TD>
          <TD width=254 align="center"><table width="90%" border="0" cellspacing="0" cellpadding="2" align="center">
            <%if request.Cookies("Gemisum")("username")=""  then%>
            <form name="userlogin" method="post" action="user_checklogin.asp">
              <tr>
                <td align="center"><font color="#999999">�ο�����,Ԥ���ȼٲ�Ʒ���ȵ�¼</font></td>
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
                    <img src="../common/GetCode.asp"> </td>
              </tr>
              <tr>
                <td align="center" height="38">
                  <input  name="imageField" value="�� ¼" type=submit onFocus="this.blur()">
                  <input  onclick="window.location='User_reg.asp'" type=reset value="ע ��" name=Submit2>
                  <input  onclick="window.location='getpwd.asp'" type=button value="��������" name=Submit3>
                </td>
              </tr>
            </form>
            <%else%>
            <tr>
              <td align="center" height="38"><br>
<%
id=trim(Request("id"))
set rs=server.createobject("adodb.recordset")
rs.open "select jifen,yucun,reglx,vipdate from userb where username='"&request.Cookies("Gemisum")("username")&"'",conn,1,3
if rs("vipdate")<>"" then 
'���ǲ��ǹ���VIP
if rs("vipdate")<date and rs("reglx")=2 then
rs("reglx")=1
rs.update
end if
end if
response.Cookies("Gemisum")("yucun")=rs("yucun")
response.Cookies("Gemisum")("jifen")=rs("jifen")
response.Cookies("Gemisum")("reglx=")=rs("reglx")
rs.close
set rs=nothing
if request.Cookies("Gemisum")("reglx")=2 then
response.write ""&request.Cookies("Gemisum")("username")&" �������<br>��Ŀǰ��"&request.Cookies("Gemisum")("jifen")&"����,Ԥ���"&request.Cookies("Gemisum")("yucun")&"Ԫ "
else
response.write ""&request.Cookies("Gemisum")("username")&" ����<br>��Ŀǰ��"&request.Cookies("Gemisum")("jifen")&"����,Ԥ���"&request.Cookies("Gemisum")("yucun")&"Ԫ "
end if
response.write "<br><a href=../order/Giveme.asp?id="&id&" ><img src=""images/hotel_dire_btn1.jpg"" width=""90"" height=""29"" border=0></a>"
end if
%>
                </td>
            </tr>
          </table>            <BR>                        </TD>
          <TD vAlign=middle width=316>
            <P align="center" style="MARGIN-TOP: 5px; LINE-HEIGHT: 200%"> 
              ����ע���û������Ѿ������ϵǼ����ϣ�Ϊ��վע����<br>
              ���������Բμ����Ƿḻ��ʵĻ�Ա���ֽ����ƻ���<br>
              <a href="/"><font color="#ff0000">������ҳ</font></a><BR>
          </P></TD>
          <TD width=1 bgColor=#88b3be><IMG height=1 
            src="images/z.gif" width=1></TD>
        </TR>
        </TBODY>
                    </TABLE>
                    <TABLE cellSpacing=0 cellPadding=0 width=572 border=0>
                      <TBODY>
                        <TR>
                          <TD><IMG height=11 src="images/hotel_dire_bar2.jpg" width=572 /></TD>
                        </TR>
                      </TBODY>
                  </TABLE></TD>
              </TR>
              <TR>
                <TD vAlign=top>&nbsp;</TD>
              </TR>
            </TABLE>
        </center>
      </div>
</body>
</html>