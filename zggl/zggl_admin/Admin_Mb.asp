<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br /><br /><br />
<table width="680" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><font color="red">��</font>��ҳģ����� (��ֱ������ҳ�༭�����Admin/System/default_Asp.asp�ļ�ֱ�ӽ��б༭)</td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="Html_xlIndex.asp">������·��ҳģ�����</a>(Xl.html)</td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="Html_xl.asp">������·����ҳģ�����</a></td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="Html_Hotel.asp">�Ƶ���ҳģ�����</a>(Hotel.html)</td>
  </tr>
  <tr>
    <td height="30"><font color="red">��</font><a href="Html_HotelInfo.asp">�Ƶ�����ҳģ�����</a></td>
  </tr>
</table>
</body>
</html>
