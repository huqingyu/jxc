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
// �ڵ�ǰ�ĵ�λ�ò���.
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
  <td height="31" align="center">ͼƬ�ϴ��ɹ�:[<a href=upload.asp>�����ϴ�</a>]</td>
</tr>
<tr>
<td height="37" align="center" valign="top"><%
set upload=new upload_5xsoft
set file=upload.file("sf_upfile")
if file.fileSize<1 then
   response.write"<script>alert('��û��ѡ��ͼƬ��~~~\n\n�������������������ť���ӵ����Ĵ�����ѡ��Ҫ�ϴ���ͼƬ��\n\n����������Ȼ�����ϴ���ť�Ϳ��԰�ͼƬ�ϴ���...\n\n��������������Ҫע��ͼƬ�ĸ�ʽŶ~~~');history.back();</script>"
   response.end 
end if
if file.fileSize<10 or file.fileSize>1000*1024 then
	response.write "����:�ϴ���ͼƬ��С����������! <a href='javascript:history.go(-1)'>�˻���һ��</a>"
	response.end
end if
upfilename = split(file.FileName,".")
upfileext = upfilename(ubound(upfilename))
if upfileext<>"jpg" and upfileext<>"jpeg" and upfileext<>"gif" and upfileext<>"JPG" and upfileext<>"JPEG" and upfileext<>"GIF"then
	response.write "����:�ϴ����ļ���ʽ����! <a href='javascript:history.go(-1)'>�˻���һ��</a>"
	response.end
end if
ufp="UP_"&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&"."&upfilename(ubound(upfilename))
file.saveas Server.mappath("UploadFile/"&ufp)
%>
<input name="select1" type="text" value="UploadFile/<%=ufp%>" size="30" style="BORDER-RIGHT: medium none; BORDER-TOP: medium none; BORDER-LEFT: medium none; COLOR: rgb(255,0,0); BORDER-BOTTOM: rgb(0,0,0) 0px solid" >
<%
response.write "<br />ͼƬ���룺<a href=Javascript:pic('UploadFile/"&ufp&"');>����ͼ</a>&nbsp;<a href=Javascript:piclink('UploadFile/"&ufp&"');>�Ŵ�ͼ</a>"
%>
&nbsp;<a href="javascript:HighlightAll('test.select1')">����</a>
<%
set file=nothing
set upload=nothing
%></td>
</tr>
<tr>
  <td height="20" align="center">��<a href='javascript:window.close();'>�رմ���</a>��</td>
</tr>
</form>
</table>
</body></html>