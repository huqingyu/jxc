
<!--#include file="admin_check_permission.asp"-->
<!--#include file="admin_common/conn.asp" -->
<%
set rst=server.createobject("adodb.recordset")
sqltext="select * from hotelb where id="&request("id")&" order by id desc"
rst.open sqltext,conn,1,1
session("hotelid")=rst("id")
session("hotelname")=rst("c_name")
rst.close
%>
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb "
rs.open sqltext,conn,1,1
%>
<!DOCTYPE HTML>
<html>
<head>
<title>������Ϣ�Ǽ�</title>
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
<FORM ACTION="RoomSubmit.asp" METHOD="POST" NAME="FORM1" onsubmit="return form1_onsubmit()">
<br />
<br />
<br />
<% sub new_room() %>
<table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
              <TBODY>
              <TR>
                <TD colSpan=2 height="32" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>������Ϣ�Ǽ�</b></font></div></TD></TR>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>�������ͣ�</TD>
                <TD width=337 height=25><font color="#FF0000">
                  <input name="roomtype" type="text" id="roomtype" size="20">
                </font>                  <font color="#FF0000">*</font></TD>                           
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>�����Ƶ꣺</TD>
                <TD  width=337 height=25 ><Select NAME="roomhotel" size="1">
<% do while not rs.eof %>
<option value=<%=rs("id")%>><%=rs("c_name")%></option>
                <%
                rs.movenext
                loop
                rs.close
                conn.close
                %></select>                  <font color="#FF0000">*</font></TD>              
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>������ޣ�</TD>
                <TD  width=337 height=25 ><input type="radio" value="��" checked name="breakfast">��     
                  <input type="radio" name="breakfast" value="��">�� <font color="#FF0000">*</font></TD>                                
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>���м۸�</TD>
                <TD width=337 height=25><INPUT NAME="marketprice" SIZE="30" MAXLENGTH="50"> Ԫ<font color="#FF0000">   
                  *</font></TD>                     
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>ǰ̨�ָ��ۣ�</TD>
                <TD width=337 height=25><input type="text" name="stageprice" size="38"> Ԫ  
                  <font color="#FF0000"> 
                  *</font></TD>            
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>����֧���ۣ�</TD>
                <TD width=337 height=25><input type="text" name="netprice" size="38"> Ԫ</TD>             
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>���շ�̬��</TD>
                <TD width=337 height=25><Select NAME="state" size="1">
	<option value="����">����</option>
	<option value=ӵ��>ӵ��</option>	
                    <option value="����">����</option>
                    <option value="����">����</option>
                  </select>  
                </TD>                                  
              </tr>
              <tr>
                <TD width=152 height=25 align="right" bgColor=#ebebeb>������ʽ��</TD>
                <TD width=337 height=25><Select NAME="paytype" size="1">
	<option value="ǰ̨����">ǰ̨����</option>
	<option value=����֧��>����֧��</option>	
                    <option value="�ʾֻ��">�ʾֻ��</option>
                  </select>  
                </TD>                                  
              </tr>
               <TR>
                <TD colSpan=2 height="35" background="Images/topBar_bg.gif"><p align="center">
<INPUT TYPE=SUBMIT VALUE=" �� �� " CLASS="medium" ONCLICK="javascript:return checksignup()" NAME="signup_submit">
 &nbsp;&nbsp;<INPUT TYPE=RESET VALUE="�� ��" CLASS="medium" NAME="signup_reset">      
</TD></TR></TBODY></TABLE><% end sub %>
<% sub hotel_room() %>
<table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
  <TBODY>
    <TR>
      <TD colSpan=2 height="32" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>������Ϣ�Ǽ�</b></font></div></TD>
    </TR>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>�������ͣ�</TD>
      <TD width=337 height=25>          <font color="#FF0000">
          <input name="roomtype" type="text" id="roomtype" size="20">
          *</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>�����Ƶ꣺</TD>
      <TD  width=337 height=25 ><%=session("hotelname")%>
        <input name=roomhotel type=hidden value=<%=session("hotelid")%>></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>������ޣ�</TD>
      <TD  width=337 height=25 ><input type="radio" value="��" checked name="breakfast">
        ��
          <input type="radio" name="breakfast" value="��">
          �� <font color="#FF0000">*</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>���м۸�</TD>
      <TD width=337 height=25><INPUT NAME="marketprice" id="marketprice" SIZE="10" MAXLENGTH="50">
        Ԫ<font color="#FF0000"> *</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>ǰ̨�ָ��ۣ�</TD>
      <TD width=337 height=25><input name="stageprice" type="text" id="stageprice" size="10">
        Ԫ <font color="#FF0000"> *</font></TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>����֧���ۣ�</TD>
      <TD width=337 height=25><input name="netprice" type="text" id="netprice" size="10">
        Ԫ</TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>���շ�̬��</TD>
      <TD width=337 height=25><Select NAME="state" size="1" id="state">
          <option value="����">����</option>
          <option value=ӵ��>ӵ��</option>
          <option value="����">����</option>
          <option value="����">����</option>
        </select>
      </TD>
    </tr>
    <tr>
      <TD width=152 height=25 align="right" bgColor=#ebebeb>������ʽ��</TD>
      <TD width=337 height=25><Select NAME="paytype" size="1" id="paytype">
          <option value="ǰ̨����">ǰ̨����</option>
          <option value=����֧��>����֧��</option>
          <option value="�ʾֻ��">�ʾֻ��</option>
        </select>
      </TD>
    </tr>
    <TR>
      <TD colSpan=2 height="35" background="Images/topBar_bg.gif"><p align="center">
          <INPUT NAME="signup_submit" TYPE=SUBMIT CLASS="medium" id="signup_submit" ONCLICK="javascript:return checksignup()" VALUE=" �� �� ">
&nbsp;&nbsp;
          <INPUT NAME="signup_reset" TYPE=RESET CLASS="medium" id="signup_reset" VALUE="�� ��">
      </TD>
    </TR>
  </TBODY>
</TABLE>
<% end sub %>
<%
xAction=lcase(request("action"))
select case xAction
case ""
	call new_room()
case "new_room"
	call new_room()
case "hotel_room"
	call hotel_room()
case else
end select
%>
</form>
</body>
</html>
