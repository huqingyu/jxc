
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="fun.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb where id="&request("id")&"" 
rs.open sqltext,conn,1,1
%>
<!DOCTYPE HTML>
<html>
<head>
<title>宾馆预定信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body  text="#000000">
<FORM ACTION="OrderInfoUpdate.asp" METHOD="POST" NAME="formSignUp">
<input type=hidden name=id value=<%=rs("id")%>>
<table width="60%"  border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <TBODY>
                <tr>
                  <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                    <p align="left">&nbsp;预定资料</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>下单时间<span lang="en-us">： </span></span></TD>
                  <TD width=426 height=25><%=rs("regtime")%></TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>订单状态：</span></TD>
                  <TD width=426 height=25><%if rs("flag")=1 then%>
                      <font color="#008000">处理完毕</font>
                      <%else%>
                      <font color="#FF0000">未做任何处理</font>
                      <%end if%></TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>宾馆名称：</span></TD>
                  <TD width=426 height=25><%=GetHotelName(rs("c_id"))%> (NO: <%=rs("c_id")%>) 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> <span>入住日期：</span></TD>
                  <TD  width=426 height=25 ><%=rs("jointime")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">离店日期：</TD>
                  <TD width=426 height=25><%=rs("leavetime")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> 结算方式：</TD>
                  <TD width=426 height=25><%=rs("paytype")%> 　</TD>
                </tr>
                <tr>
                  <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                    <p align="left">&nbsp;房间选择</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">房型：</TD>
                  <TD width=426 height=25><%=GetRoomName(rs("roomtype"))%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> 预定间数：</TD>
                  <TD width=426 height=25><%=rs("roomnum")%> &nbsp;间</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> 总金额：</TD>
                  <TD width=426 height=25> RMB&nbsp;<%=rs("totalnum")%></TD>
                </tr>
                <tr>
                  <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                    <p align="left">&nbsp;预定条款</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">入住人数：</TD>
                  <TD width=426 height=25> <%=rs("number")%>人</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">入住人身份：</TD>
                  <TD width=426 height=25><%=rs("degree")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right">入住登记人：</TD>
                  <TD width=426 height=25><%=rs("man1")%>,<%=rs("man2")%>,<%=rs("man3")%>,<%=rs("man4")%>,<%=rs("man5")%>,<%=rs("man6")%>,<%=rs("man7")%>,<%=rs("man8")%> </TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> 到达目的地方式：</TD>
                  <TD width=426 height=25><%=rs("cometype")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> 最早到店时间：</TD>
                  <TD width=426 height=25><%=rs("earlytime")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 bgColor=#EBEBEB height=25 align="right"> 最晚到店时间：</TD>
                  <TD width=426 height=25><%=rs("latetime")%> 　</TD>
                </tr>
                <tr>
                  <TD height=30 colspan="2" align="right" background="images/admin_bg_1.gif">
                    <p align="left">&nbsp;联系信息</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > 会员帐号：</TD>
                  <TD width=426 height=25><%=rs("userid")%></TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > 联系人：</TD>
                  <TD width=426 height=25><%=rs("username")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > 手机或电话：</TD>
                  <TD width=426 height=25><%=rs("mobiletel")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > 传真：</TD>
                  <TD width=426 height=25><%=rs("fax")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > 电子邮件：</TD>
                  <TD width=426 height=25><%=rs("email")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB > 确认方式：</TD>
                  <TD width=426 height=25><%=rs("affirmtype")%> 　</TD>
                </tr>
                <tr>
                  <TD width=152 height=25 align="right" bgColor=#EBEBEB >特殊说明：</TD>
                  <TD width=426 height=25><%=rs("explain")%> 　</TD>
                </tr>
                <TR background="images/admin_bg_1.gif">
                  <TD height="35" colSpan=2>
                    <p align="center">
          <INPUT class=main type=button size=3 value=返回 name=Submit2 onclick="javascript:window.history.go(-1)">
                  </TD>
                </TR>
              </TBODY>
            </TABLE>
</form>
</body>
</html>