
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
<title>自动生成新闻HTML文件</title>
</head>
<body>
<%
if request("type")<>"" then
         if request("page")<>"" then
           page=cint(request("page"))
           D=request("D")
         else        
           page=1
           D=timer()
         end if
mpage=1
mpage1=1
MaxPerPage=15
id=request("id")
zzyy=id&","
set rs=server.createobject("adodb.recordset")
     if request("type")="all" then

        rs.open ("SELECT id FROM news order by id desc"),conn,1,1
        if not rs.eof then
        rs.pagesize=1 '得到每页数
        mpage1=rs.pagecount     '得到总页数
        rs.move  (page-1)*1
        do while not rs.eof
        i=i+1
         id=rs("id")
         if i>=1 then exit do
        rs.movenext
        loop
        rs.close
        end if
     end if

conn.close  
set conn=nothing

response.write"<br /><br /><br /><b><font color=""#FF0000"">"&page&"</font>/<font color=""#FF0000"">"&mpage1&"</font> 正在生成新闻的Html页,请等待,在此过程中请勿对本管理系统进行任何动作(包括刷新)!......</b><span id=showImport></span><IE:Download ID=""oDownload"" STYLE=""behavior:url(#default#download)"" />"
for ii=1 to mpage
m=m+1
response.write"<script>function onDownloadDone(downDate){showImport.innerHTML=downDate}oDownload.startDownload('make_newslist.asp?id="&id&"',onDownloadDone)</script>"
next
if page<mpage1 then
response.write"<meta http-equiv=""refresh"" content=""0;url='make_newslistall_all.asp?type="&request("type")&"&zzyy="&request("zzyy")&"&page="&page+1&"&m="&request("m")+m&"&D="&D&"'"">"
else
response.write"<meta http-equiv=""refresh"" content=""0;url='make_newslistall_all.asp?ok="&page&"&m="&request("m")+m&"&D="&D&"'"">"
end if
else 
response.write"<br /><br /><br /><b>操作完成:共生成分类<font color=""#FF0000"">"&request("ok")&"</font>个,页面<font color=""#FF0000"">"&request("m")&"</font>个,总费时<font color=""#FF0000"">"&(FormatNumber((timer()-request("D")),2))/5&"</font>秒,完成时间"&Now()&"</b>"
end if
%></body></html>
