<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert('�㲻����ҵ��Ա��');history.go(-1);</script>"
end if
%>
<html>
<head>
<title>�Ƶ���Ϣ����</title>
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
response.write("<script>alert('����Ĵ��ݲ�����');history.back(1);</script>")
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
      <TD  width=337 height=25 ><%=rst("c_name")%>
        <input name=roomhotel type=hidden value=<%=rst("id")%>></TD>
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
</TABLE></form>
<% end sub 
sub Submit
hotelid1=request("roomhotel")
roomtype=trim(request("roomtype"))
set rs=server.createobject("adodb.recordset")
sqltext="select * from roomb where c_id="&hotelid1&" and type='"&roomtype&"'"
rs.open sqltext,conn,3,3

if not rs.eof and not rs.bof then
		 Response.Redirect "messagebox.asp?msg=�˷�����ͬһ�Ƶ��Ѿ�ע�������ע����������!"
else
'���һ����¼�����ݿ�
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
<title>�Ƶ�Ǽǳɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="system/style.css" type="text/css">
</head><body><div align="center">
<TABLE border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#ffffff bgcolor="#F9F9F9">
<TBODY><TR>
<TD width="431" height="30" background="../Images/topBar_bg.gif"><div align="center"><font color="red">�Ƶ�Ǽǳɹ�</font></div></TD></TR>
<TR><TD width="431" height="74" valign="middle"><div align="center">  ���ͣ�<%=request.form("roomtype")%> ע��ɹ�!  
</div></TD></TR>
<TR><TD width="431" height="35"><p align="center">
<input type="button" value="�����һ����" onclick=" window.location='User_RegRoom.asp?id=<%=hotelid1%>&action=hotel_room'">   
<input type="button" value="����" onclick=" window.location='HotelInfo.asp'">  
</TD></TR></TBODY></TABLE>
</div><p align="center">��
</body>
</html>
<%end sub%>