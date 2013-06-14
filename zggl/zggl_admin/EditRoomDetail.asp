
<!--#include file="admin_check_permission.asp"-->
<!--#include file="admin_common/conn.asp" -->
<%
if request("action")="update" then
id=request("id")
set rs=server.createobject("adodb.recordset")
sqltext="select * from roomb where id="&id
rs.open sqltext,conn,3,3
rs("breakfast")=request.form("breakfast")
rs("marketprice")=request.form("marketprice")
rs("stageprice")=request.form("stageprice")
if request("netprice")=""then
	rs("netprice")=""
else
	rs("netprice")=request("netprice")
end if
rs("state")=request.form("state")
rs("paytype")=request.form("paytype")
rs.update
response.redirect "RoomInfo.asp"
else
id=request("id")
set rs=server.createobject("adodb.recordset")
sqltext="select * from roomb where id="&id
rs.open sqltext,conn,1,1
hotelid=rs("c_id")
set rs_hotel=server.createobject("adodb.recordset")
sqltext="select c_name from hotelb where id="&hotelid
rs_hotel.open sqltext,conn,1,1
%>
<!DOCTYPE HTML>
<html>
<head>
<title>房型信息编辑</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--

function form1_onsubmit() 
{
if(document.FORM1.markerprice.value.length<1)
 {
   alert("您必须填写门市价格!");
   document.FORM1.markerprice.focus();
   return false;
 }

if(document.FORM1.stageprice.value.length<1)
 {
   alert("您必须输入前台现付价!");
   document.FORM1.stageprice.focus();
   return false;
 }
}

//-->
</SCRIPT>
<body>
<FORM ACTION="EditRoomDetail.asp" METHOD="POST" NAME="FORM1" onsubmit="return form1_onsubmit()">
<input type=hidden name=action value="update">
<input type=hidden name=id value=<%=request("id")%>>
<br />
<br />
<br />
<table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <TBODY>
              <TR>
                <TD colSpan=2 height="30" background="images/admin_bg_1.gif"><div align="center"><font color="Red"><b>房型信息编辑</b></font></div></TD></TR>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">房间类型：</TD>
                <TD width=324 height=25>  <%=rs("type")%></TD>                           
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">所属酒店：</TD>
                <TD  width=324 height=25 >  <%=rs_hotel("c_name")%></TD>              
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">早餐有无：</TD>
                <TD  width=324 height=25 ><%if rs("breakfast")="有" then%><input type="radio" value="有" checked name="breakfast">有     
                  <input type="radio" name="breakfast" value="无">无 <font color="#FF0000">*</font><%else%><input type="radio" value="有" name="breakfast">有     
                  <input type="radio" name="breakfast" checked value="无">无 <font color="#FF0000">*</font><%end if%></TD>                                
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">门市价格：</TD>
                <TD width=324 height=25><INPUT NAME="marketprice" SIZE="8" MAXLENGTH="50" value="<%=rs("marketprice")%>" > 
                元<font color="#FF0000">   
                  *</font></TD>                     
              </tr>
              <tr>
                <TD width=165 height=25 align="right" bgcolor="#EBEBEB">前台现付价：</TD>
                <TD width=324 height=25><input type="text" name="stageprice" size="8" value="<%=rs("stageprice")%>" > 
                元  
                  <font color="#FF0000"> 
                  *</font></TD>            
              </tr>
              <tr>
                <TD width=165 height=25 align="right" bgcolor="#EBEBEB">网上支付价：</TD>
                <TD width=324 height=25><input type="text" name="netprice" size="8" value="<%=rs("netprice")%>"> 
                元</TD>             
              </tr>
              <tr>
                <TD width=165 height=25 align="right" bgcolor="#EBEBEB">首日房态：</TD>
                <TD width=324 height=25><Select NAME="state" id="state">
	<option value="良好" <%if trim(rs("state"))="良好" then%>selected<%end if%>>良好</option>
	<option value="拥挤" <%if trim(rs("state"))="拥挤" then%>selected<%end if%>>拥挤</option>	
    <option value="爆满" <%if trim(rs("state"))="爆满" then%>selected<%end if%>>爆满</option>
    <option value="空闲" <%if trim(rs("state"))="空闲" then%>selected<%end if%>>空闲</option>
                  </select>  
                </TD>                                  
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">付款形式：</TD>
                <TD width=324 height=25><Select NAME="paytype" id="paytype">
	<option value="前台付帐" <%if trim(rs("paytype"))="前台付帐" then%>selected<%end if%>>前台付帐</option>
	<option value="网上支付" <%if trim(rs("paytype"))="网上支付" then%>selected<%end if%>>网上支付</option>	
    <option value="邮局汇款" <%if trim(rs("paytype"))="邮局汇款" then%>selected<%end if%>>邮局汇款</option>
                  </select>  
                </TD>                                  
              </tr>
              <TR>
                <TD colSpan=2 height="35">
                  <p align="center">
<INPUT TYPE=SUBMIT VALUE=" 修 改 "  ONCLICK="javascript:return checksignup()" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT TYPE=RESET VALUE="重 填"  NAME="signup_reset"><input class="main" type="button" size="3" value="返回" onclick="javascript:window.history.go(-1)">     
                </TD></TR></TBODY></TABLE>
</form>
</body>
</html>
<%
rs.close
rs_hotel.close
conn.close
end if
%>
