
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
<script language="javascript">
function opennew(){
window.open ("admin_masterlook.asp?action=listxu","��ѯ","height=400,width=655, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes,resizable=no,location=no, status=no")
}
function check(){
if(form1.text1.value==''){
alert("����д�е���ʾ����");
form1.text1.focus();
return false;
}
}
function checka(){
if(form2.xlid.value==''){
alert("������Ҫ��ѯ����·ID��\r\r�����������·ID�����ȷ����ȡ��");
opennew();
return false;
}
}
</script>

<div align="center">
<br />
<h1>�ͻ�������ѯ</h1>
<form action="?action=kf" method="post" name="form1" onSubmit="return check();">
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    

      <tr>
        <td height="40">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><input id="r_name" type="radio" name="radiobutton" value="m_name" checked>
				<label for="r_name">�ͻ�����</label></td>
            <td><input id="r_address" type="radio" name="radiobutton" value="m_address">
				<label for="r_address">�ͻ���ַ</label></td>
            <td><input id="r_cell" type="radio" name="radiobutton" value="m_phone">
				<label for="r_cell">�� ��</label></td>
            <td><input id="r_sfz" type="radio" name="radiobutton" value="m_zhengjian">
				<label for="r_sfz">���֤</label></td>
            <td><input id="r_order_time" type="radio" name="radiobutton" value="m_yudingtime">
				<label for="r_order_time">Ԥ��ʱ��</label></td>
            <td><input id="r_start_time" type="radio" name="radiobutton" value="m_laiyoutime">
				<label for="r_start_time">����ʱ��</label></td>
          </tr>
        </table>
		</td>
      </tr>
	<tr>
        <td height="30" align="center" bgcolor="#f5f5f5">��ѯ��
          <input name="text1" type="text" id="text1" size="30">
          <input type="submit" name="Submit" value="�� ѯ">
    </td>
      </tr>
  </table>
    </form>
  <%
dim action
action=trim(request("action"))
if action<>"" then
sss
end if
sub sss
dim text1,xlid,tttt
text1=trim(request("text1"))
xlid=trim(request("xlid"))
tttt=request("radiobutton")
select case action
case "kf"
sql="select * from giveme where "&tttt&" like '%"&text1&"%'"
case "xlselect"
sql="select * from giveme where m_id='"&xlid&"'"
end select
set rs=conn.execute(sql)
%>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <tr>
      <td height="22" bgcolor="#f5f5f5">[�� ѯ �� ��]</td>
    </tr>
  </table>
  <table width="618" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="4"></td>
    </tr>
  </table>
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">    <tr align="center" bgcolor="#f5f5f5">
      <td width="321" height="22">��·����</td>
      <td width="87">�ͻ�����</td>
      <td width="120">Ԥ��ʱ��</td>
      <td width="45">����</td>
    </tr>
  <%
if rs.eof then
response.write("<tr align=""center""><td height=""24"" colspan=""5"" bgcolor=""#FFFFFF"">û�ҵ���ؼ�¼��</td></tr>")
end if
while not rs.eof
%>
    <tr>
      <td height="22"><a href="../Xl/Xl_<%=rs("m_id")%>.html" target=_blank title="����鿴��·����"><%=rs("m_xianlu_name")%></a></td>
      <td align="center"><a href="admin_yddel.asp?action=look&id=<%=rs("id")%>" title="����鿴Ԥ������"><%=rs("m_name")%></a></td>
      <td align="center"><%=rs("m_yudingtime")%></td>
      <td align="center"><%=rs("m_renshuo")%></td>
    </tr>
  <%
rs.movenext
wend
%>
  </table>
  <%
end sub

%>
</div>
