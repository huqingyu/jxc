
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>�Ƶ���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
if request.QueryString("action")="save" then 
mb_hotel_index_show=Request.Form("mb_hotel_index_show")
aa="http://"&Request.ServerVariables("server_name")&Request.ServerVariables("path_info")
aa= mid(aa,1,len(aa)-18)
content=replace(mb_hotel_index_show,aa,"")
session("mb_hotel_index_show")=mb_hotel_index_show
set rs=server.CreateObject("adodb.recordset")
rs.open ("select mb_hotel_index_show from mb"),conn,1,3
rs("mb_hotel_index_show")=mb_hotel_index_show
rs.update
rs.close
set rs=nothing
session("content")=""
response.write "<script>alert('���ĳɹ���');window.location.href='Admin_mb.asp';</script>"
response.End
end if
%>
<form name="form" method="post" action="Html_hotel.asp?action=save" onReset="return ResetForm();">
<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td height="47" colspan="2"><div align="center"><b><font color="red">�Ƶ���ҳģ��(html)</font></b></div></td>
  </tr>
  <tr>
    <td height="500" colspan="2"><div align="center">
<% set rs=server.createobject("adodb.recordset")
rs.open ("select mb_hotel_index_show from mb"),conn,1,1
%><textarea name="mb_hotel_index_show" cols="90" rows="38"><%=rs("mb_hotel_index_show")%></textarea>
<% rs.close %></div></td>
  </tr>
  <tr>
    <td width="50%" height="35"><div align="center">
      <input type="submit" name="Submit" value="�ύ�޸�">
    </div></td>
    <td width="50%"><div align="center">
      <input type="reset" name="Submit2" value="ȡ���޸�">
    </div></td>
  </tr>
</table>
</form>

<div style="text-align:left;margin-left:200px">
<font color="088000"><br />
ע: ��վ����(WebName); �����ʼ�(WebEmail); ��ַ(Dizhi); �ʱ�(YouBian); �绰(DianHua)<br />
��Ȩ(Copyright); ��վ��־(WebLogo); ��վbanner(WebBanner); ��վ��ַ(WebUrl); ��վ����(Gonggao)<br />
���¾Ƶ���Ϣ(Left_Hotel_Top); ������·��Ϣ(Left_Xl_Top); �������(Left_View_Top)<br />
�ȵ�Ƶ�(Hotel_Hot); �Ƶ���ϸ��Ϣ(Hotel_Info)
</font></div>
</body>
</html>
