
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
<title>������Ϣ�༭</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--

function form1_onsubmit() 
{
if(document.FORM1.markerprice.value.length<1)
 {
   alert("��������д���м۸�!");
   document.FORM1.markerprice.focus();
   return false;
 }

if(document.FORM1.stageprice.value.length<1)
 {
   alert("����������ǰ̨�ָ���!");
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
                <TD colSpan=2 height="30" background="images/admin_bg_1.gif"><div align="center"><font color="Red"><b>������Ϣ�༭</b></font></div></TD></TR>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">�������ͣ�</TD>
                <TD width=324 height=25>  <%=rs("type")%></TD>                           
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">�����Ƶ꣺</TD>
                <TD  width=324 height=25 >  <%=rs_hotel("c_name")%></TD>              
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">������ޣ�</TD>
                <TD  width=324 height=25 ><%if rs("breakfast")="��" then%><input type="radio" value="��" checked name="breakfast">��     
                  <input type="radio" name="breakfast" value="��">�� <font color="#FF0000">*</font><%else%><input type="radio" value="��" name="breakfast">��     
                  <input type="radio" name="breakfast" checked value="��">�� <font color="#FF0000">*</font><%end if%></TD>                                
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">���м۸�</TD>
                <TD width=324 height=25><INPUT NAME="marketprice" SIZE="8" MAXLENGTH="50" value="<%=rs("marketprice")%>" > 
                Ԫ<font color="#FF0000">   
                  *</font></TD>                     
              </tr>
              <tr>
                <TD width=165 height=25 align="right" bgcolor="#EBEBEB">ǰ̨�ָ��ۣ�</TD>
                <TD width=324 height=25><input type="text" name="stageprice" size="8" value="<%=rs("stageprice")%>" > 
                Ԫ  
                  <font color="#FF0000"> 
                  *</font></TD>            
              </tr>
              <tr>
                <TD width=165 height=25 align="right" bgcolor="#EBEBEB">����֧���ۣ�</TD>
                <TD width=324 height=25><input type="text" name="netprice" size="8" value="<%=rs("netprice")%>"> 
                Ԫ</TD>             
              </tr>
              <tr>
                <TD width=165 height=25 align="right" bgcolor="#EBEBEB">���շ�̬��</TD>
                <TD width=324 height=25><Select NAME="state" id="state">
	<option value="����" <%if trim(rs("state"))="����" then%>selected<%end if%>>����</option>
	<option value="ӵ��" <%if trim(rs("state"))="ӵ��" then%>selected<%end if%>>ӵ��</option>	
    <option value="����" <%if trim(rs("state"))="����" then%>selected<%end if%>>����</option>
    <option value="����" <%if trim(rs("state"))="����" then%>selected<%end if%>>����</option>
                  </select>  
                </TD>                                  
              </tr>
              <tr>
                <TD width=165 bgColor=#ebebeb height=25 align="right">������ʽ��</TD>
                <TD width=324 height=25><Select NAME="paytype" id="paytype">
	<option value="ǰ̨����" <%if trim(rs("paytype"))="ǰ̨����" then%>selected<%end if%>>ǰ̨����</option>
	<option value="����֧��" <%if trim(rs("paytype"))="����֧��" then%>selected<%end if%>>����֧��</option>	
    <option value="�ʾֻ��" <%if trim(rs("paytype"))="�ʾֻ��" then%>selected<%end if%>>�ʾֻ��</option>
                  </select>  
                </TD>                                  
              </tr>
              <TR>
                <TD colSpan=2 height="35">
                  <p align="center">
<INPUT TYPE=SUBMIT VALUE=" �� �� "  ONCLICK="javascript:return checksignup()" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT TYPE=RESET VALUE="�� ��"  NAME="signup_reset"><input class="main" type="button" size="3" value="����" onclick="javascript:window.history.go(-1)">     
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
