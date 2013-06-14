<!--#include file="admin_check_permission.asp"-->
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if

%>
<!DOCTYPE HTML>
<html>
<head>
<meta name=vs_targetSchema content="HTML 4.0">
<title>添加航班信息</title>
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
		alert("请输入航空公司!");
		document.form1.hankonggongsi2.focus();
		return false;
	}
	if (document.form1.hbh2.value.length == 0)
 {
		alert("请输入航班号!");
		document.form1.hbh2.focus();
		return false;
	}
	if (document.form1.chufachenshi2.value.length == 0)
 {
		alert("请输入出发城市!");
		document.form1.chufachenshi2.focus();
		return false;
	}
	if (document.form1.mudichenshi2.value.length == 0)
 {
		alert("请输入目的地城市!");
		document.form1.mudichenshi2.focus();
		return false;
	}
	if (document.form1.shichanjia2.value.length == 0)
 {
		alert("请输入价格!");
		document.form1.shichanjia2.focus();
		return false;
	}
	if (document.form1.date2.value.length == 0)
 {
		alert("请输入有效时间!");
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
        <td height="35" colspan="3" background="images/admin_bg_1.gif"><div align="center"><font color="#FF0000"><b>添加航班信息</b></font></div></td>
      </tr>
            <tr>
        <td width="207" height="25" bgcolor="#ebebeb"><div align="right">航班类型：</div></td>
        <td width="76%">国内航班
          <input name="hbtype2" type="radio" value="1" checked>
          国际航班
            <input type="radio" name="hbtype2" value="2">          </td>
      </tr>
<tr>
        <td width="207" height="25" bgcolor="#ebebeb"><div align="right">航空公司：</div></td>
        <td width="76%"><input name="hankonggongsi2" type="text" id="hankonggongsi2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">航班号：</div></td>
        <td><input name="hbh2" type="text" id="hbh2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">出发城市：</div></td>
        <td><input name="chufachenshi2" type="text" id="chufachenshi2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">目的地城市：</div></td>
        <td><input name="mudichenshi2" type="text" id="mudichenshi2">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">航段类型：</div></td>
        <td><select name="hdtype2" id="hdtype2">
            <option value="直达" selected>直达</option>
            <option value="转机">转机</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">到达方式：</div></td>
        <td><select name="type2" id="type2">
            <option value="单程" selected>单程</option>
            <option value="往返">往返</option>
            <option value="联程">联程</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">价格：</div></td>
        <td><input name="shichanjia2" type="text" id="shichanjia2" size="10">
            <font color="red">*</font></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">乘舱类型：</div></td>
        <td><select name="cctype2" id="cctype2">
          <option value="1" selected>经济舱</option>
          <option value="2">公务舱</option>
          <option value="3">头等舱</option>
        </select></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">是否推荐：</div></td>
        <td> 是
            <input name="tuijiang2" type="radio" value="1">
      否
      <input name="tuijiang2" type="radio" value="0" checked></td>
      </tr>
      <tr>
        <td height="25" bgcolor="#ebebeb"><div align="right">有效时间：</div></td>
        <td><input name="date2" type="text" id="date2">
            <font color="red">（格式：YYYY-MM-DD至YYYY-MM-DD）</font></td>
      </tr>
      <tr>
        <td height="90" bgcolor="#ebebeb"><div align="right">备注：</div></td>
        <td><textarea name="bz2" cols="50" rows="5" id="bz2"></textarea></td>
      </tr>
      <tr>
        <td height="35" colspan="2"><div align="center">
            <input type="submit" name="Submit" value="提交" onClick="return CheckForm()">
    &nbsp;
            <input type="reset" name="Submit2" value="重置">
        </div></td>
      </tr>
    </table>
</form>
</body></html>
