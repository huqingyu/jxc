<!--#include file="admin_check_permission.asp"-->
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if

%>
<!DOCTYPE HTML>
<html>
<head>
<meta name=vs_targetSchema content="HTML 4.0">
<title>��Ӻ�����Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<br /><br /><br />
<script language="JavaScript">
<!--
function CheckForm()
{
	if (document.form1.hankonggongsi2.value.length == 0)
 {
		alert("�����뺽�չ�˾!");
		document.form1.hankonggongsi2.focus();
		return false;
	}
	if (document.form1.hbh2.value.length == 0)
 {
		alert("�����뺽���!");
		document.form1.hbh2.focus();
		return false;
	}
	if (document.form1.chufachenshi2.value.length == 0)
 {
		alert("�������������!");
		document.form1.chufachenshi2.focus();
		return false;
	}
	if (document.form1.mudichenshi2.value.length == 0)
 {
		alert("������Ŀ�ĵس���!");
		document.form1.mudichenshi2.focus();
		return false;
	}
	if (document.form1.shichanjia2.value.length == 0)
 {
		alert("������۸�!");
		document.form1.shichanjia2.focus();
		return false;
	}
	if (document.form1.date2.value.length == 0)
 {
		alert("��������Чʱ��!");
		document.form1.date2.focus();
		return false;
	}
}
///onSubmit="return CheckForm();"
//-->
</script>
<form name="form1" method="post" action="Add_Jipiao_ok.asp">
    <table width="65%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
      <tr>
        <td height="35" colspan="3" background="images/admin_bg_1.gif"><div align="center"><font color="#FF0000"><b>��Ӻ�����Ϣ</b></font></div></td>
      </tr>
            <tr>
        <td width="207" height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
        <td width="76%">���ں���
          <input name="hbtype2" type="radio" value="1" checked>
          ���ʺ���
            <input type="radio" name="hbtype2" value="2">          </td>
      </tr>
<tr>
        <td width="207" height="25" bgcolor="#ebebeb"><div align="right">���չ�˾��</div></td>
        <td width="76%"><input name="hankonggongsi2" type="text" id="hankonggongsi2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">����ţ�</div></td>
        <td><input name="hbh2" type="text" id="hbh2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�������У�</div></td>
        <td><input name="chufachenshi2" type="text" id="chufachenshi2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">Ŀ�ĵس��У�</div></td>
        <td><input name="mudichenshi2" type="text" id="mudichenshi2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�������ͣ�</div></td>
        <td><select name="hdtype2" id="hdtype2">
            <option value="ֱ��" selected>ֱ��</option>
            <option value="ת��">ת��</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">���﷽ʽ��</div></td>
        <td><select name="type2" id="type2">
            <option value="����" selected>����</option>
            <option value="����">����</option>
            <option value="����">����</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�۸�</div></td>
        <td><input name="shichanjia2" type="text" id="shichanjia2" size="10">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�˲����ͣ�</div></td>
        <td><select name="cctype2" id="cctype2">
          <option value="1" selected>���ò�</option>
          <option value="2">�����</option>
          <option value="3">ͷ�Ȳ�</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">�Ƿ��Ƽ���</div></td>
        <td> ��
            <input name="tuijiang2" type="radio" value="1">
      ��
      <input name="tuijiang2" type="radio" value="0" checked></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">��Чʱ�䣺</div></td>
        <td><input name="date2" type="text" id="date2">
            <font color="red">����ʽ��YYYY-MM-DD��YYYY-MM-DD��</font></td>
      </tr>
      <tr>
        <td height="90" bgcolor="#ebebeb"><div align="right">��ע��</div></td>
        <td><textarea name="bz2" cols="50" rows="5" id="bz2"></textarea></td>
      </tr>
      <tr>
        <td height="35" colspan="2"><div align="center">
            <input type="submit" name="Submit" value="�ύ" onClick="return CheckForm()">
    &nbsp;
            <input type="reset" name="Submit2" value="����">
        </div></td>
      </tr>
    </table>
</form>
</body></html>
