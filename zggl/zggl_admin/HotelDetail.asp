
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
id=request("id")
set rs=server.createobject("adodb.recordset")
sqltext="select * from Hotelb where id="&id
rs.open sqltext,conn,1,1
%>
<!DOCTYPE HTML>
<html>
<head>
<title>�Ƶ���Ϣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>��
<br />
  <br />
  <br />
            <table width="50%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <TBODY>
              <tr align="center">
                <TD height=30 colspan="2" background="images/admin_bg_1.gif"><font color="#FF0000"><b>�Ƶ���Ϣ����</b></font></TD>
              </tr>
              <tr>
                <TD height=143 colspan="2"><table border="0" align="center" cellPadding=0 cellspacing="1" borderColorDark=#FFF>
                  <tr>
                    <td width="150" height="120"><div align="center"><img border="0" src="../admin/<%=rs("logurl")%>" width="150" height="120"></div></td>
                    <td width="150"><img border="0" src="../admin/<%=rs("logurl2")%>" width="150" height="120"></td>
                    <td width="150"><img border="0" src="../admin/<%=rs("logurl3")%>" width="150" height="120"></td>
                  </tr>
                  <tr>
                    <td height="20" bgcolor="#ebebeb">
                      <div align="center">���</div></td>
                    <td bgcolor="#ebebeb"><div align="center">����</div></td>
                    <td bgcolor="#ebebeb"><div align="center">�ͷ�</div></td>
                  </tr>
                </table></TD>
              </tr>
              <tr>
                <TD width=161 height=25 align="right">�Ƶ����ƣ�</TD>
                <TD width=328 height=25>��<%=rs("c_name")%></TD>                       
              </tr>
              <tr>
                <TD width=161 height=25 align="right">�Ǽ���׼��</TD>
                <TD width=328 height=25 >��<%=rs("level")%></TD>          
              </tr>
              <tr>
                <TD width=161 height=25 align="right">�Ƶ�����ʡ�ݣ�</TD>
                <TD width=328 height=25 >��<%=rs("province")%></TD>                              
              </tr>
              <tr>
                <TD width=161 height=25 align="right">
                  �Ƶ��������أ�</TD>
                <TD width=328 height=25>��<%=rs("city")%></TD>                    
              </tr>
              <tr>
                <TD width=161 height=25 align="right">
                 �Ƶ��飺</TD>
                <TD width=328 height=25><%=rs("info")%></TD>                                  
              </tr>
              <TR>
                <TD colSpan=2 height="35">
                  <p align="center">
                    <input type="button" size="3" value="����" onclick="javascript:window.history.go(-1)"></p>
  </TD></TR></TBODY></TABLE>
</body>
</html>
<%
rs.close
conn.close
%>