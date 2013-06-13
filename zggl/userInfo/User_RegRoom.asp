<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('网络超时或者您还没有登录,请登录！');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert('你不是企业会员！');history.go(-1);</script>"
end if
%>
<html>
<head>
<title>酒店信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css"></head>
<body>
<br>
<!--#include file="../common/conn.asp"-->
<%
dim action
action=trim(request("action"))
select case action
case "hotel_room"
hotel_room
case "Submit"
Submit
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
 
 sub hotel_room 
 
set rst=server.createobject("adodb.recordset")
sqltext="select * from hotelb where id="&request("id")&" order by id desc"
rst.open sqltext,conn,1,1
%>
<form action="User_RegRoom.asp?Action=Submit" method="post" name="Form1" id="Form1" >
  <table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
  <TBODY>
    <TR>
      <TD colSpan=2 height="32" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>房型信息登记</b></font></div></TD>
    </TR>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>房间类型：</TD>
      <TD width=337 height=25>          <font color="#FF0000">
          <input name="roomtype" type="text" id="roomtype" size="20">
          *</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>所属酒店：</TD>
      <TD  width=337 height=25 ><%=rst("c_name")%>
        <input name=roomhotel type=hidden value=<%=rst("id")%>></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>早餐有无：</TD>
      <TD  width=337 height=25 ><input type="radio" value="有" checked name="breakfast">
        有
          <input type="radio" name="breakfast" value="无">
          无 <font color="#FF0000">*</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>门市价格：</TD>
      <TD width=337 height=25><INPUT NAME="marketprice" id="marketprice" SIZE="10" MAXLENGTH="50">
        元<font color="#FF0000"> *</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>前台现付价：</TD>
      <TD width=337 height=25><input name="stageprice" type="text" id="stageprice" size="10">
        元 <font color="#FF0000"> *</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>网上支付价：</TD>
      <TD width=337 height=25><input name="netprice" type="text" id="netprice" size="10">
        元</TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>首日房态：</TD>
      <TD width=337 height=25><Select NAME="state" size="1" id="state">
          <option value="良好">良好</option>
          <option value=拥挤>拥挤</option>
          <option value="爆满">爆满</option>
          <option value="空闲">空闲</option>
        </select>
      </TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>付款形式：</TD>
      <TD width=337 height=25><Select NAME="paytype" size="1" id="paytype">
          <option value="前台付帐">前台付帐</option>
          <option value=网上支付>网上支付</option>
          <option value="邮局汇款">邮局汇款</option>
        </select>
      </TD>
    </tr>
    <TR>
      <TD colSpan=2 height="35" background="Images/topBar_bg.gif"><p align="center">
          <INPUT NAME="signup_submit" TYPE=SUBMIT CLASS="medium" id="signup_submit" ONCLICK="javascript:return checksignup()" VALUE=" 添 加 ">
&nbsp;&nbsp;
          <INPUT NAME="signup_reset" TYPE=RESET CLASS="medium" id="signup_reset" VALUE="重 填">
      </TD>
    </TR>
  </TBODY>
</TABLE></form>
<% end sub 
sub Submit
hotelid1=request("roomhotel")
roomtype=trim(request("roomtype"))
set rs=server.createobject("adodb.recordset")
sqltext="select * from roomb where c_id="&hotelid1&" and type='"&roomtype&"'"
rs.open sqltext,conn,3,3

if not rs.eof and not rs.bof then
		 Response.Redirect "messagebox.asp?msg=此房型在同一酒店已经注册过，请注册其他房型!"
else
'添加一条记录到数据库
rs.addnew
rs("c_id")=request.form("roomhotel")
rs("type")=request.form("roomtype")
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
rs.close
conn.close
end if
%>
<html>
<head>
<title>酒店登记成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="system/style.css" type="text/css">
</head><body><div align="center">
<TABLE border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<TBODY><TR>
<TD width="431" height="30" background="../Images/topBar_bg.gif"><div align="center"><font color="red">酒店登记成功</font></div></TD></TR>
<TR><TD width="431" height="74" valign="middle"><div align="center">  房型：<%=request.form("roomtype")%> 注册成功!  
</div></TD></TR>
<TR><TD width="431" height="35"><p align="center">
<input type="button" value="添加下一房型" onclick=" window.location='User_RegRoom.asp?id=<%=hotelid1%>&action=hotel_room'">   
<input type="button" value="返回" onclick=" window.location='HotelInfo.asp'">  
</TD></TR></TBODY></TABLE>
</div><p align="center">　
</body>
</html>
<%end sub%>