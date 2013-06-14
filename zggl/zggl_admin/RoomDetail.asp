
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
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
<title>房型信息详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet"></head>
<body>　
<br /><br /><br />
<table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<TBODY>
<tr align="center">
<TD height=30 colspan="2" background="images/admin_bg_1.gif"><font color="#FF0000"><b>房型信息详情</b></font></TD>
</tr>
<tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">所属酒店：</TD>
                <TD width=313 height=25>　<%=rs_hotel("c_name")%></TD>                       
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">房型类型：</TD>
                <TD  width=313 height=25 >　<%=rs("type")%></TD>          
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">早餐有无：</TD>
                <TD  width=313 height=25 >　<%=rs("breakfast")%></TD>                              
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">门市价格：</TD>
                <TD width=313 height=25>　<%=rs("marketprice")%> 元/日</TD>                    
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">前台现付价：</TD>
                <TD width=313 height=25>　<%=rs("stageprice")%> 元/日</TD>            
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">网上支付价：</TD>
                <TD width=313 height=25>　<%=rs("netprice")%> 元/日</TD>            
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">首日房态：</TD>
                <TD width=313 height=25>　<%=rs("state")%></TD>                                  
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">付款形式：</TD>
                <TD width=313 height=25>　<%=rs("paytype")%></TD>                                  
              </tr>
              <TR>
                <TD colSpan=2 height="35">
                  <p align="center">
                  <input class="main" type="button" size="3" value="返回" onclick="javascript:window.history.go(-1)"></p>
                </TD></TR></TBODY></TABLE>
</body>
</html>
<%
rs.close
rs_hotel.close
conn.close
%>