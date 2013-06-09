<!--#include file="Include/Startup.asp"-->
<!--#include file="Include/upfile_class.asp"-->
<%
' Copyright: seirsoft.com
' xWebEditor - seirsoft�����ı��༭��
' Email:huqingyu@gmail.com

Server.ScriptTimeOut = 1800
Dim sType, sStyleName
Dim sAllowExt, nAllowSize, sUploadDir

Call InitUpload()		' ��ʼ���ϴ�����
Call DBConnEnd()		' �Ͽ����ݿ�����


Dim sAction
sAction = UCase(Trim(Request.QueryString("action")))

Call ShowForm()			' ��ʾ�ϴ���
If sAction = "SAVE" Then
	Call DoSave()		' ���ļ�
End If



Sub ShowForm() 
%>
<HTML>
<HEAD>
<TITLE>�ļ��ϴ�</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
body, a, table, div, span, td, th, input, select{font:9pt;font-family: "����", Verdana, Arial, Helvetica, sans-serif;}
body {padding:0px;margin:0px}
</style>

<script language="JavaScript" src="dialog/dialog.js"></script>

</head>
<body bgcolor=menu>

<form action="?action=save&type=<%=sType%>&style=<%=sStyleName%>" method=post name=myform enctype="multipart/form-data">
<input type=file name=uploadfile size=1 style="width:100%">
</form>

<script language=javascript>

var sAllowExt = "<%=sAllowExt%>";
// ����ϴ���
function CheckUploadForm() {
	if (!IsExt(document.myform.uploadfile.value,sAllowExt)){
		parent.UploadError("��ʾ��\n\n��ѡ��һ����Ч���ļ���\n֧�ֵĸ�ʽ�У�"+sAllowExt+"����");
		return false;
	}
	return true
}

// �ύ�¼��������
var oForm = document.myform ;
oForm.attachEvent("onsubmit", CheckUploadForm) ;
if (! oForm.submitUpload) oForm.submitUpload = new Array() ;
oForm.submitUpload[oForm.submitUpload.length] = CheckUploadForm ;
if (! oForm.originalSubmit) {
	oForm.originalSubmit = oForm.submit ;
	oForm.submit = function() {
		if (this.submitUpload) {
			for (var i = 0 ; i < this.submitUpload.length ; i++) {
				this.submitUpload[i]() ;
			}
		}
		this.originalSubmit() ;
	}
}

// �ϴ�����װ�����
try {
	parent.UploadLoaded();
}
catch(e){
}

</script>

</body>
</html>
<% 
End Sub 

' �������
Sub DoSave()
	Dim oUpload, oFile, sFileExt, sSourceFileName, sSaveFileName
	' �����ϴ�����
	Set oUpload = New upfile_class
	' ȡ���ϴ�����,��������ϴ�
	oUpload.GetData(nAllowSize*1024)
	If oUpload.Err > 0 Then
		Select Case oUpload.Err
		Case 1
			Call OutScript("parent.UploadError('��ѡ����Ч���ϴ��ļ���')")
		Case 2
			Call OutScript("parent.UploadError('���ϴ����ļ��ܴ�С������������ƣ�" & nAllowSize & "KB����')")
		End Select
		Response.End
	End If

	Set oFile = oUpload.File("uploadfile")
	sFileExt = LCase(oFile.FileExt)
	sSourceFileName = oFile.FileName
	Call CheckValidExt(sFileExt)

	Dim sRnd
	Randomize
	sRnd = Int(900 * Rnd) + 100
	sSaveFileName = year(now) & month(now) & day(now) & hour(now) & minute(now) & second(now) & sRnd & "." & sFileExt
	oFile.SaveToFile Server.Mappath(sUploadDir & sSaveFileName)
	
	Set oFile = Nothing
	Set oUpload = Nothing

	Call OutScript("parent.UploadSaved('" & sSaveFileName & "');parent.dialogArguments.addUploadFile('" & sSourceFileName & "', '" & sSaveFileName & "')")

End Sub

' ����ͻ��˽ű�
Sub OutScript(str)
	Response.Write "<script language=javascript>" & str & ";history.back()</script>"
End Sub

' �����չ������Ч��
Sub CheckValidExt(sExt)
	Dim b, i, aExt
	b = False
	aExt = Split(sAllowExt, "|")
	For i = 0 To UBound(aExt)
		If LCase(aExt(i)) = sExt Then
			b = True
			Exit For
		End If
	Next
	If b = False Then
		OutScript("parent.UploadError('��ʾ��\n\n��ѡ��һ����Ч���ļ���\n֧�ֵĸ�ʽ�У�"+sAllowExt+"����')")
		Response.End
	End If
End Sub

Sub InitUpload()
	sType = "" 'UCase(Trim(Request.QueryString("type")))
	sStyleName = Trim(Request.QueryString("style"))
	sSql = "select S_UploadDir from xWebEditor_style where s_name='" & sStyleName & "'"
	oRs.Open sSql, oConn, 0, 1
	If Not oRs.Eof Then
		sUploadDir = oRs("S_UploadDir")
		sUploadDir = Replace(sUploadDir, "\", "/")
		If Right(sUploadDir, 1) <> "/" Then
			sUploadDir = sUploadDir & "/"
		End If

		Select Case sType
		Case "FILE"
			sAllowExt = "" 'oRs("S_FileExt")
			nAllowSize = 0 'oRs("S_FileSize")
		Case "MEDIA"
			sAllowExt = "" 'oRs("S_MediaExt")
			nAllowSize = 0 'oRs("S_MediaSize")
		Case "FLASH"
			sAllowExt = "" 'Rs("S_FlashExt")
			nAllowSize = 0 'oRs("S_FlashSize")
		Case Else
			sAllowExt = "" 'oRs("S_ImageExt")
			nAllowSize = 0 'oRs("S_ImageSize")
		End Select
	Else
		OutScript("parent.UploadError('��Ч����ʽID�ţ���ͨ��ҳ���ϵ����ӽ��в�����')")
	End If
	oRs.Close
	
	sAllowExt = "gif|jpg|jpeg|png"
	nAllowSize = 1000
End Sub
%>