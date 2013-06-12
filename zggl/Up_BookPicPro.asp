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
 
 fileExt=lcase(file.FileExt)	' 您现在的位置:名不含有.
 if file.filesize<100 then
 	response.write "<span style=""font-family: 宋体; font-size: 9pt""> 您现在的位置:传的文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
	response.end
 end if
 if (filelx<>"swf") and (filelx<>"jpg") then 
 	response.write "<span style=""font-family: 宋体; font-size: 9pt""> 您现在的位置:上传！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
	response.end
 end if
 if filelx="swf" then
	if fileext<>"swf"  then
		response.write "<span style=""font-family: 宋体; font-size: 9pt"">只能上传swf格式的Flash文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
		response.end
	end if
 end if
 if filelx="jpg" then
	if fileext<>"gif" and fileext<>"jpg"  then
		response.write "<span style=""font-family: 宋体; font-size: 9pt"">只能上传jpg或gif 您现在的位置:[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
		response.end
     	end if
 end if
 if filelx="swf" then
	if file.filesize>(3000*1024) then
		response.write "<span style=""font-family: 宋体; font-size: 9pt"">最大只能上传 3M 的Flash文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
		response.end
	end if
 end if
 if filelx="jpg" then
	if file.filesize>(1000*1024) then
		response.write "<span style=""font-family: 宋体; font-size: 9pt"">最大只能上传 1000K 您现在的位置:[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
		response.end
	end if
 end if

 randomize
 ranNum=int(90000*rnd)+10000
 filename=filepath&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum&"."&fileExt
%>
<%
 if file.FileSize>0 then         ''如果 FileSize > 0 您现在的位置:
  'file.SaveAs Server.mappath(filename)   ''保存文件
  file.SaveToFile Server.mappath(FileName)
  'response.write file.FileName&"　　上传成功!　　<br>"
  'response.write "新文件名："&FileName&"<br>"
  'response.write " 您现在的位置: 您现在的位置:可关闭窗口！"
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
window.alert("文件上传成功! 您现在的位置:的链接地址！");
window.close();
</script>
