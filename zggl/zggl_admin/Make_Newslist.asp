
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>后台管理首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
dim id,FILENAME
id=trim(Request("id"))
if id="" or not IsNumeric(id) then
Response.Redirect "<li>错误的操作命令！</li><br /><li>请确定您从有效链接进入！</li>"
end if
FILENAME="../News/News_"&id&".html"
set rs=server.createobject("adodb.recordset")
rs.open ("select * from mb"),conn,1,1
pencat=rs("mb_news_show")
rs.close
''##################新闻内容###############
Set Rs=Server.Createobject("Adodb.Recordset")
Rs.open ("select Title,Content,Admin,Time From News Where Id = "&id&" "),Conn,1,1
NewsInfo=Rs("Content")
NewsTitle=Rs("title")
NewsAdmin=Rs("Admin")
NewsTime=Rs("Time")
Rs.close
''##################网页属性###############
set rs=server.CreateObject("adodb.recordset")
rs.Open "select webname,webemail,dizhi,youbian,dianhua,copyright,gonggao,weblogo,weburl,webbanner from config",conn,1,1
webname=trim(rs("webname"))
webemail=trim(rs("webemail"))
dizhi=trim(rs("dizhi"))
youbian=trim(rs("youbian"))
dianhua=trim(rs("dianhua"))
copyright=trim(rs("copyright"))
weblogo=trim(rs("weblogo"))
webbanner=trim(rs("webbanner"))
weburl=trim(rs("weburl"))
gonggao=trim(rs("gonggao"))
rs.Close
'##################left_xl_top#################
sql="select top 8 id,x_name from xianlu order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
if rs.eof then
left_xl_top=left_xl_top&"暂时还没有任何信息!"
Else
do while not rs.eof

left_xl_top=left_xl_top&"<table width=""93%""  border=0 align=center cellpadding=0 cellspacing=0>"
left_xl_top=left_xl_top&"<tr><td height=""18""> <font color=""#666666""><a href=""../xl/xl_"&rs("id")&".html"">"
if len(rs("x_name"))>13 then
left_xl_top=left_xl_top&""&left(rs("x_name"),13)&"..."
else
left_xl_top=left_xl_top&""&rs("x_name")&""
end if
left_xl_top=left_xl_top&"</a></font></td></tr></table>"

rs.movenext
loop
end if
rs.close
'##################left_hotel_top#################
sql="select top 8 id,c_name from hotelb order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
if rs.eof then
left_hotel_top=left_hotel_top&"暂时还没有任何信息!"
Else
do while not rs.eof

left_hotel_top=left_hotel_top&"<table width=""93%""  border=0 align=center cellpadding=0 cellspacing=0>"
left_hotel_top=left_hotel_top&"<tr><td height=""18""> <font color=""#666666""><a href=""../hotel/hotel_"&rs("id")&".html"">"
if len(rs("c_name"))>13 then
left_hotel_top=left_hotel_top&""&left(rs("c_name"),13)&"..."
else
left_hotel_top=left_hotel_top&""&rs("c_name")&""
end if
left_hotel_top=left_hotel_top&"</a></font></td></tr></table>"

rs.movenext
loop
end if
rs.close
'############################left_view_top###########
left_view_top=left_view_top&"<table width=""100%"" border=""0"" cellpadding=""0"" cellspacing=""0"">"
left_view_top=left_view_top&"<tr><td width=""100%"" height=""50"" align=""center"" valign=""top"">"
set rs=conn.execute("SELECT * FROM toupiao where IsChecked=1 ") 
if rs.eof then
left_view_top=left_view_top&"暂无投票"
else
left_view_top=left_view_top&"<table border=""0"" width=""91%"" cellspacing=""2"" cellpadding=""2""><tr><td width=""100%"" align=""center""><b><br />"&rs("Title")&"</b><br /></td></tr>"
left_view_top=left_view_top&"<form action=""../vote.asp"" target=""newwindow"" method=""post"" name=""research""><tr><td valign=""top"" width=""100%"">"
for i=1 to 8
if rs("Select"&i)<>"" then
left_view_top=left_view_top&"<input style=""border: 0"" "
if i=1 then
left_view_top=left_view_top&" checked "
end if
left_view_top=left_view_top&"name=""Options"" type=""radio"" value="""&i&""">"&i&"."&rs("Select"&i)&"<br />"
end if
next
left_view_top=left_view_top&"</td></tr><tr><td width=""100%"" height=""30"" align=""center""><input type=""image"" border=""0"" name=""submit"" src=""../images/vote1.gif"" width=""59"" height=""19"" style=""cursor:hand"">"
left_view_top=left_view_top&" <a href=""../vote.asp?stype=view"" target=""_blank""><img src=""../images/vote.gif"" width=""59"" height=""19"" border=""0""></a>"
left_view_top=left_view_top&"</td></tr></form></table>"
end if
rs.close
left_view_top=left_view_top&"</td></tr></table>"
''#########################################
pencat=replace(pencat,"NewsInfo",NewsInfo)
pencat=replace(pencat,"NewsTitle",NewsTitle)
pencat=replace(pencat,"NewsAdmin",NewsAdmin)
pencat=replace(pencat,"NewsTime",NewsTime)
''#########################################
pencat=replace(pencat,"webname",webname)
pencat=replace(pencat,"webemail",webemail)
pencat=replace(pencat,"dizhi",dizhi)
pencat=replace(pencat,"youbian",youbian)
pencat=replace(pencat,"dianhua",dianhua)
pencat=replace(pencat,"copyright",copyright)
pencat=replace(pencat,"weblogo",weblogo)
pencat=replace(pencat,"webbanner",webbanner)
pencat=replace(pencat,"weburl",weburl)
pencat=replace(pencat,"gonggao",gonggao)
pencat=replace(pencat,"left_hotel_top",left_hotel_top)
pencat=replace(pencat,"left_xl_top",left_xl_top)
pencat=replace(pencat,"left_view_top",left_view_top)

Set fso = Server.CreateObject("Scripting.FileSystemObject")
Set fout = fso.CreateTextFile(server.mappath(FILENAME))
fout.Write pencat
fout.close
%>
<br /><br /><br /><font color="#FF0000">·</font><a target="_blank" href="<%=FILENAME%>">点此浏览<%=FILENAME%></a>
</body></html>