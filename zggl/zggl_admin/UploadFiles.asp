<!--#include FILE="upload_inc.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<script language="Javascript">
<!--
function killErrors() {
  return true;
}
   window.onerror = killErrors;
   
var copytoclip=1
function HighlightAll(theField) {
var tempval=eval("document."+theField)
tempval.focus()
tempval.select()
if (document.all&&copytoclip==1){
therange=tempval.createTextRange()
therange.execCommand("Copy")
window.status="Contents highlighted and copied to clipboard!"
setTimeout("window.status=''",1800)
window.close()
 }
}
function pic(smileface)
{
	window.opener.document.form1.Pic_slt2.value=smileface;
	window.close()
}
function piclink(smileface)
{
	window.opener.document.form1.Pic_url2.value=smileface;
}
function nopic(smileface)
{
	window.opener.document.form1.nopic.value=smileface;
	window.close()
}
// 在当前文档位置插入.
function insertHTML(html) {
	if (isModeView()) return false;
	if (eWebEditor.document.selection.type.toLowerCase() != "none"){
		eWebEditor.document.selection.clear() ;
	}
	if (sCurrMode!="EDIT"){
		html=HTMLEncode(html);
	}
	eWebEditor.document.selection.createRange().pasteHTML(html) ; 
}
//-->
</script>
<link href="css/style.css" rel="stylesheet">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<form name="test">
<tr>
  <td height="31" align="center">图片上传成功:[<a href=upload.asp>继续上传</a>]</td>
</tr>
<tr>
<td height="37" align="center" valign="top"><%
set upload=new upload_5xsoft
set file=upload.file("sf_upfile")
if file.fileSize<1 then
   response.write"<script>alert('您没有选择图片。~~~\n\n－－－－－请点击浏览按钮，从弹出的窗口中选择要上传的图片。\n\n－－－－－然后点击上传按钮就可以把图片上传了...\n\n－－－－－不过要注意图片的格式哦~~~');history.back();</script>"
   response.end 
end if
if file.fileSize<10 or file.fileSize>1000*1024 then
	response.write "错误:上传的图片大小超过了限制! <a href='javascript:history.go(-1)'>退回上一步</a>"
	response.end
end if
upfilename = split(file.FileName,".")
upfileext = upfilename(ubound(upfilename))
if upfileext<>"jpg" and upfileext<>"jpeg" and upfileext<>"gif" and upfileext<>"JPG" and upfileext<>"JPEG" and upfileext<>"GIF"then
	response.write "错误:上传的文件格式不对! <a href='javascript:history.go(-1)'>退回上一步</a>"
	response.end
end if
ufp="UP_"&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&"."&upfilename(ubound(upfilename))
file.saveas Server.mappath("UploadFile/"&ufp)
%>
<input name="select1" type="text" value="UploadFile/<%=ufp%>" size="30" style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; COLOR: rgb(255,0,0); BORDER-BOTTOM: rgb(0,0,0) 0px solid" >
<%
response.write "<br />图片放入：<a href=Javascript:pic('UploadFile/"&ufp&"');>缩略图</a>&nbsp;<a href=Javascript:piclink('UploadFile/"&ufp&"');>放大图</a>"
%>
&nbsp;<a href="javascript:HighlightAll('test.select1')">复制</a>
<%
set file=nothing
set upload=nothing
%></td>
</tr>
<tr>
  <td height="20" align="center">【<a href='javascript:window.close();'>关闭窗口</a>】</td>
</tr>
</form>
</table>
</body></html>