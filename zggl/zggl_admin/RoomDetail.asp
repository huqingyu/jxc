
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
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
<title>������Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet"></head>
<body>��
<br /><br /><br />
<table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<TBODY>
<tr align="center">
<TD height=30 colspan="2" background="images/admin_bg_1.gif"><font color="#FF0000"><b>������Ϣ����</b></font></TD>
</tr>
<tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">�����Ƶ꣺</TD>
                <TD width=313 height=25>��<%=rs_hotel("c_name")%></TD>                       
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">�������ͣ�</TD>
                <TD  width=313 height=25 >��<%=rs("type")%></TD>          
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">������ޣ�</TD>
                <TD  width=313 height=25 >��<%=rs("breakfast")%></TD>                              
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">���м۸�</TD>
                <TD width=313 height=25>��<%=rs("marketprice")%> Ԫ/��</TD>                    
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">ǰ̨�ָ��ۣ�</TD>
                <TD width=313 height=25>��<%=rs("stageprice")%> Ԫ/��</TD>            
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">����֧���ۣ�</TD>
                <TD width=313 height=25>��<%=rs("netprice")%> Ԫ/��</TD>            
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">���շ�̬��</TD>
                <TD width=313 height=25>��<%=rs("state")%></TD>                                  
              </tr>
              <tr>
                <TD width=176 height=25 align="right" bgcolor="#ebebeb">������ʽ��</TD>
                <TD width=313 height=25>��<%=rs("paytype")%></TD>                                  
              </tr>
              <TR>
                <TD colSpan=2 height="35">
                  <p align="center">
                  <input class="main" type="button" size="3" value="����" onclick="javascript:window.history.go(-1)"></p>
                </TD></TR></TBODY></TABLE>
</body>
</html>
<%
rs.close
rs_hotel.close
conn.close
%>