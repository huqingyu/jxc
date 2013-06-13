<!--#include file="../common/conn.asp"-->
<!--#include file="md52.asp"-->
<!--#include file="../webconfig.asp"-->
<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录,请登录！');history.go(-1);</script>"
end if
%>

<html><head><title><%=webname%>--佣金计划</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {color: #0000FF}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!--#include file="webtop.asp"-->
<TABLE cellSpacing=0 cellPadding=0 width=778 align=center border=0>
  <TBODY>
    <TR>
      <TD class=b vAlign=top align=left><table width="778" align="center" border="0" cellspacing="0" cellpadding="0" class="table-zuoyou" bordercolor="#CCCCCC">
        <tr>
          <td width="100%" valign="top" align="center" bordercolor="#FFFFFF" bgcolor="#FFFFFF"><table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="images/class_bg.jpg" height=50>　<img src="images/ring02.gif" width="23" height="15" align="absmiddle"> <a href=index.asp><%=webname%></a> >> 支付平台</td>
              </tr>
            </table>
              <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><table width=100% border="0" cellpadding="5" cellspacing="0" class="table-xia" bgColor=#f1f1f1>
                            <TR>
                              <TD bgColor=#ffffff colspan=19 height=1></TD>
                            <tr>
                              <td width="88%" colspan="8"><%
v_oid=request("v_oid")
v_pmode=request("v_pmode")
v_pstatus=request("v_pstatus")
v_pstring=request("v_pstring")
v_md5info=request("v_md5info")
v_amount=request("v_amount")
v_moneytype=request("v_moneytype")
v_md5money=request("v_md5money")
v_md5=request("v_md5")
key="test"

if request("v_md5info")="" then
	response.Write("v_md5info：空值")
	response.end
end if
text = v_oid&v_pstatus&v_amount&v_moneytype&key
md5text = trim(md5(text))
if Ucase(md5text)<>Ucase(v_md5) then
  response.write("error")
else
  response.write("received")

   If Err.Number <> 0 Then
      Response.Write "error" & Err.Number & "<br>"
      Response.Write "error" & Err.Source & "<br>"
      Response.Write "error" & Err.Description & "<br>"
  Else
     
   End If
end if
%>
                                  <table width="93%" border="0">
                                    <tr>
                                      <td><p align="center"><b><font color="#FF0000">提示：</font> 您网上在线支付情况反馈如下：</b><br>
                                              <br>
                                此次交易编号： <%=v_oid%></p>
                                          <p align="center">支付金额：<%=v_amount%> </p>
                                          <p align="center">
                                            <% if v_pstatus=1 then
								zhuangtai = "支付已提交，但已对您的非实时银行卡已经进行扣款 "
								%>
                                支付已提交，但已对您的非实时银行卡已经进行扣款
                                <%elseif v_pstatus=20 then
								zhuangtai = "在线支付已经支付成功"
								%>
                                在线支付已经支付成功
                                <%elseif v_pstatus=30 then
								zhuangtai = "在线支付失败!"
								%>
                                在线支付失败!
                                <%end if%>
                                          </p>
<%
	if Request.ServerVariables("REMOTE_ADDR")=request.cookies("PayIPAddress") then
	response.write"<SCRIPT language=JavaScript>alert('请勿在20分钟内重复使用本支付系统，谢谢！');"
	response.write"javascript:window.close();</SCRIPT>"
	else
	response.cookies("PayIPAddress")=Request.ServerVariables("REMOTE_ADDR")	
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from [userb] where username='"&request.Cookies("Gemisum")("username")&"'",conn,1,3
	yucun=rs("yucun")
        rs("yucun")=yucun+v_amount
	rs.update
	rs.close
end if
%>
                                          <div align="center">预存款充值成功，进入[<a href="userinfo.asp" ><font color=red>会员中心</font></a>]
                                          </div>
                                          <p></p></td>
                                    </tr>
                                  </table>
                                  <p>&nbsp;</p>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
        </tr>
      </table></TD>
    </TR>
  </TBODY>
</TABLE>
</body>
</html>