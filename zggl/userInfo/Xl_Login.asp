<%
session("hotelid")=request("hotelid")
session("roomid")=request("roomid")
%>
<!--#include file="../common/conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css"><title>会员预定登录</title>
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
                <td align="center"><font color="#999999">游客您好,预定度假产品请先登录</font></td>
              </tr>
              <tr>
                <td align="center">用户名：
                    <input type="text"  name="username" size="14">
                </td>
              </tr>
              <tr>
                <td align="center">密　码：
                    <input type="password"  name="userpassword" size="14">
                </td>
              </tr>
              <tr>
                <td align="center">验证码：
                    <input  name=verifycode type=text value="<%If GetCode=9999 Then Response.Write "9999"%>" maxLength=4 size=6>
                    <img src="../common/GetCode.asp"> </td>
              </tr>
              <tr>
                <td align="center" height="38">
                  <input  name="imageField" value="登 录" type=submit onFocus="this.blur()">
                  <input  onclick="window.location='User_reg.asp'" type=reset value="注 册" name=Submit2>
                  <input  onclick="window.location='getpwd.asp'" type=button value="忘记密码" name=Submit3>
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
'看是不是过期VIP
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
response.write ""&request.Cookies("Gemisum")("username")&" 贵宾您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
else
response.write ""&request.Cookies("Gemisum")("username")&" 您好<br>您目前有"&request.Cookies("Gemisum")("jifen")&"积分,预存款"&request.Cookies("Gemisum")("yucun")&"元 "
end if
response.write "<br><a href=../order/Giveme.asp?id="&id&" ><img src=""images/hotel_dire_btn1.jpg"" width=""90"" height=""29"" border=0></a>"
end if
%>
                </td>
            </tr>
          </table>            <BR>                        </TD>
          <TD vAlign=middle width=316>
            <P align="center" style="MARGIN-TOP: 5px; LINE-HEIGHT: 200%"> 
              　　注册用户，并已经在网上登记资料，为本站注册用<br>
              户，您可以参加我们丰富多彩的会员积分奖励计划。<br>
              <a href="/"><font color="#ff0000">返回首页</font></a><BR>
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