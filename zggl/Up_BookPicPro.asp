<!--#include file="newsadmin/pass.asp" -->
<!--#include file="upload.inc"-->
<%
set upload=new upload_file
if upload.form("act")="uploadfile" then
	filepath=trim(upload.form("filepath"))
	filelx=trim(upload.form("filelx"))
	
	i=0
	for each formName in upload.File
		set file=upload.File(formName)
 
 fileExt=lcase(file.FileExt)	' �����ڵ�λ��:��������.
 if file.filesize<100 then
 	response.write "<span style=""font-family: ����; font-size: 9pt""> �����ڵ�λ��:�����ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if (filelx<>"swf") and (filelx<>"jpg") then 
 	response.write "<span style=""font-family: ����; font-size: 9pt""> �����ڵ�λ��:�ϴ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
	response.end
 end if
 if filelx="swf" then
	if fileext<>"swf"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�swf��ʽ��Flash�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 if filelx="jpg" then
	if fileext<>"gif" and fileext<>"jpg"  then
		response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�jpg��gif �����ڵ�λ��:[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
     	end if
 end if
 if filelx="swf" then
	if file.filesize>(3000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 3M ��Flash�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if
 if filelx="jpg" then
	if file.filesize>(1000*1024) then
		response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 1000K �����ڵ�λ��:[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
		response.end
	end if
 end if

 randomize
 ranNum=int(90000*rnd)+10000
 filename=filepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''��� FileSize > 0 �����ڵ�λ��:
  'file.SaveAs Server.mappath(filename)   ''�����ļ�
  file.SaveToFile Server.mappath(FileName)
  'response.write file.FileName&"�����ϴ��ɹ�!����<br>"
  'response.write "���ļ�����"&FileName&"<br>"
  'response.write " �����ڵ�λ��: �����ڵ�λ��:�ɹرմ��ڣ�"
  if filelx="swf" then
      response.write "<script>window.opener.document."&upload.form("FormName")&".size.value='"&int(file.FileSize/1024)&" K'</script>"
  end if
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&FileName&"'</script>"
%>
<%
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>
<script language="javascript">
window.alert("�ļ��ϴ��ɹ�! �����ڵ�λ��:�����ӵ�ַ��");
window.close();
</script>
