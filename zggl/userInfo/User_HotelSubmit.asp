<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
if request.Cookies("Gemisum")("reglx")<>3 then
  response.write "<script LANGUAGE='javascript'>alert('�㲻����ҵ��Ա��');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<%
hotelname=trim(request("hotelname"))
hotelprovince=trim(request("hotelprovince"))
hotelcity=trim(request("hotelcity"))
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where c_name='"&hotelname&"' and province='"&hotelprovince&"' and city='"&hotelcity&"'"
rs.open sqltext,conn,3,3

if not rs.eof and not rs.bof then
		 Response.Redirect "messagebox.asp?msg=�˾Ƶ���ͬһ�ص��Ѿ�ע�������ע�������Ƶ�!"
else
'���һ����¼�����ݿ�
rs.addnew
rs("c_name")=request.form("hotelname")
rs("level")=request.form("hotellevel")
rs("province")=request.form("szSheng")
rs("city")=request.form("shucity")
rs("info")=request.form("hotelinfo")
rs("logurl")=request.form("hotellogurl")
rs("logurl2")=request.form("hotellogurl2")
rs("logurl3")=request.form("hotellogurl3")
rs("tuijian_id")=request.form("tuijian1")
rs("User")=request.Cookies("Gemisum")("username")
rs("Audit")=false
rs.update
rs("id")=tid
rs.close
end if
%>
<html>
<head>
<title>�Ƶ�Ǽǳɹ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="system/style.css" type="text/css">
</head>
<body>
<div align="center">      
  <table width="60%"  border=1 cellpadding=0 cellspacing=0 bordercolor="#999999" bordercolordark=#ffffff bgcolor="#F9F9F9">
    <tbody>
      <tr valign=top bgcolor=#e1f0ff>
        <td width="431" height="30" background="Images/topBar_bg.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="60" valign="middle"><font class="medium">
          <p align="center">�Ƶ꣺<%=request.form("hotelname")%> ע��ɹ�,�ȴ�����Ա���!</p>
        </font></td>
      </tr>
      <tr bgcolor=#e1f0ff>
        <td height="35" background="Images/topBar_bg.gif">
          <p align="center">
            <input name="button" type="button" onClick=" window.location='User_hotelReg.asp'" value="�Ǽ���һ��">
            <input name="button2" type="button" onClick=" window.location='Userinfo.asp'" value="����">
          </td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>