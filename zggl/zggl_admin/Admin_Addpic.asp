
<!--#include file="admin_check_permission.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta name=vs_targetSchema content="HTML 4.0">
<title>编辑导游</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<!--#include file="admin_common/conn.asp" -->
<%
dim action
action=trim(request("action"))
select case action
case "add"
add
case "addok"
addok
case else
response.write("<script>alert('错误的传递参数！');history.back(1);</script>")
end select
sub add
%>
<script>
function check(){
if(form1.Name2.value=='' || form1.Pic_slt2.value=='' || form1.Pic_url2.value=='' || form1.Info2.value==''){
alert("请认真填写上面所有项！");
return false;
}
}
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',left=450,top=300,resizable=1,scrollbars=no,menubar=no,status=no' );
}
function openem()
{ 
openScript('upload.asp?UP=admin',300,100); 
}
</script>
<br /><br /><br />
<table width="95%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
<form action="?action=addok" method="post" name="form1" onSubmit="return check();">
<tr>
<td height="30" colspan="2" align="center" background="images/admin_bg_1.gif"><font color="#FF0000"><b>添加图片</b></font></td>
</tr>
<tr>
<td width="187" height="25" align="center" bgcolor="#f5f5f5">图片名称：</td>
<td width="731">　
<input name="Name2" type="text" id="Name2" size="50"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">图片类别：</td>
<td>　
<select name="Leixing2" id="Leixing2">
<%
set rs=conn.execute("select id,board from Picboard order by id desc")
while not rs.eof
%>
<option value="<%=trim(rs("id"))%>"><%=rs("board")%></option>
<%
rs.movenext
wend
rs.close
%>
</select>
请先择。如没有类型，请先建立类别后再添加图片</td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">是否推荐：</td>
<td>
　
是
<input name="Tuijiang2" type="radio" value="1">
否
<input name="Tuijiang2" type="radio" value="0" checked></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">&nbsp;&nbsp;&nbsp;缩略图：</td>
<td>　
<input name="Pic_slt2" type="text" id="Pic_slt2" size="50">
<input type="button" name="Button" value="浏 览" onClick="JavaScript:openem()"></td>
</tr>
<tr>
<td height="25" align="center" bgcolor="#f5f5f5">图片路径：</td>
<td>　
<input name="Pic_url2" type="text" id="Pic_url2" size="50">
<input type="button" name="Button2" value="浏 览" onClick="JavaScript:openem()"></td>
</tr>
<tr>
<td height="110" align="center" bgcolor="#f5f5f5">图片介绍：</td>
<td height="110">　
<textarea name="Info2" cols="60" rows="6" id="Info2">无</textarea></td>
</tr>
<tr>
<td height="35" colspan="2" align="center"><input type="submit" name="Submit" value="确 定 添 加"></td>
</tr></form></table>
<%
end sub
sub addok
dim Name2,Leixing2,Tuijiang2,Pic_slt2,Pic_url2,Info2
Name2=trim(request("Name2"))
Leixing2=trim(request("Leixing2"))
Tuijiang2=trim(request("Tuijiang2"))
Pic_slt2=trim(request("Pic_slt2"))
Pic_url2=trim(request("Pic_url2"))
Info2=request("Info2")
set rs=server.createobject("adodb.recordset")
sql="select * From pic"
rs.open sql,conn,3,3
rs.addnew

rs("Name")=Name2
rs("Leixing")=Leixing2
rs("Tuijiang")=Tuijiang2
rs("Pic_slt")=Pic_slt2
rs("Pic_url")=Pic_url2
rs("Info")=Info2

rs.update
rs.close
conn.close
response.Write "<script language='javascript'>alert('该图片记录添加成功！');window.location.href='Admin_picEditDel.asp?action=edit';</script>"
response.End
end sub
%>