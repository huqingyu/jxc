
<!--#include file="admin_check_permission.asp"--><!--#include file="admin_common/conn.asp" -->
<%
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
<!DOCTYPE HTML>
<html>
<head>
<title>�Ƶ�Ǽǳɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head><body><div align="center">
<TABLE border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<TBODY><TR>
<TD width="431" height="30" background="../images/admin_bg_1.gif"><div align="center"><font color="red">�Ƶ�Ǽǳɹ�</font></div></TD></TR>
<TR><TD width="431" height="74" valign="middle"><div align="center">  ���ͣ�<%=request.form("roomtype")%> ע��ɹ�!  
</div></TD></TR>
<TR><TD width="431" height="35"><p align="center">
<input type="button" value="�����һ����" onclick=" window.location='roomreg.asp?id=<%=hotelid1%>&action=hotel_room'">   
<input type="button" value="����" onclick=" window.location='HotelInfo.asp'">  
</TD></TR></TBODY></TABLE>
</div><p align="center">��
</body>
</html>