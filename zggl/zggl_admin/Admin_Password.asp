
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<script LANGUAGE="javascript">
<!--
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function check()
{
  if(checkspace(document.renpassword.password.value)) {
	document.renpassword.password.focus();
    alert("ԭ���벻��Ϊ�գ�");
	return false;
  }
  if(checkspace(document.renpassword.password1.value)) {
	document.renpassword.password1.focus();
    alert("�����벻��Ϊ�գ�");
	return false;
  }
    if(checkspace(document.renpassword.password2.value)) {
	document.renpassword.password2.focus();
    alert("ȷ�����벻��Ϊ�գ�");
	return false;
  }
    if(document.renpassword.password1.value != document.renpassword.password2.value) {
	document.renpassword.password1.focus();
	document.renpassword.password1.value = '';
	document.renpassword.password2.value = '';
    alert("�������ȷ�����벻��ͬ������������");
	return false;
  }
	document.admininfo.submit();
  }
//-->
</script> 
<%if request.QueryString("action")="save" then%>
<!--#include file="admin_common/conn.asp" -->
<!--#include file="../common/md5.asp" -->
<%
set rs=server.CreateObject("adodb.recordset")
rs.Open "select * from master where name='"&session("admin")&"'",conn,3,3
if md5(trim(request("password")))<>rs("password") then
response.Write "<script>alert('ԭ��������뷵����������');history.go(-1);</script>"
response.End
else
rs("password")=md5(trim(request("password2")))
rs.Update
rs.Close
set rs=nothing
session("admin")=""
session("flag")=""
response.Write "<script>alert('���ĳɹ����������������µ�½��');history.go(-1);</script>"
end if
response.End
end if
%>
<br /><br /><br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
  <tr> 
    <td height="30" background="images/admin_bg_1.gif"> 
    <div align="center"><font color="#ff0000">���Ĺ�������</font></div>    </td>
  </tr>
  <tr> 
    <td height="163"> 
      <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
        <form name="renpassword" method="post" action="Admin_password.asp?action=save">
          <tr> 
            <td width="81" height="25"> 
            <div align="right">�û�����</div></td>
            <td width="139"> 
              <div align="center"><font color=red><%=session("admin")%></font></div>
            </td>
          </tr>
          <tr> 
            <td height="25"> 
            <div align="right">ԭ���룺</div></td>
            <td> 
              <div align="center"> 
                <input name="password" type="password" id="password" size="17">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="25"> 
            <div align="right">�����룺</div></td>
            <td> 
              <div align="center"> 
                <input name="password1" type="password" id="password1" size="17">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="25"> 
            <div align="right">ȷ�����룺</div></td>
            <td> 
              <div align="center"> 
                <input  name="password2" type="password" id="password2" size="17">
              </div>
            </td>
          </tr>
          <tr> 
            <td height="35" colspan="2"> 
              <div align="center"> 
                <input onClick="return check();" type="submit" name="Submit" value="ȷ������">
              </div>            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
