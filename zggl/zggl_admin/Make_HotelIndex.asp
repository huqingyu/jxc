
<%
if session("admin")="" then
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
dim FILENAME
FILENAME="../Hotel.html"
set rs=server.createobject("adodb.recordset")
rs.open ("select Mb_Hotel_Index_Show from mb"),conn,1,1
pencat=rs("Mb_Hotel_Index_Show")
rs.close
'#########################################

Hotel_Sheng= Hotel_Sheng&"<select size=3 name=szSheng onChange=chsel() style=""width:150px"">"
Hotel_Sheng= Hotel_Sheng&"<option value=xxx selected>请选择省份……</option>"
dim tmpShengid
tmpShengid=0
set rs_s=server.createobject("adodb.recordset")
sql="select * from szSheng order by shengorder"
rs_s.open sql,conn
while not rs_s.eof
Hotel_Sheng= Hotel_Sheng&"<option value="&rs_s("ShengNo")&" >"&trim(rs_s("ShengName"))&"</option>"
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
Hotel_Sheng= Hotel_Sheng&"</select><select size=3 name=shucity id=shucity style=""width:150px"">"
set rs_s=server.createobject("adodb.recordset")
sql="select * from szShi where shengid="&tmpShengid&" order by shiorder"
rs_s.open sql,conn
while not rs_s.eof
Hotel_Sheng= Hotel_Sheng&"<option value="""&trim(rs_s("ShiName"))&""">"&trim(rs_s("ShiName"))&"</option>"
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
Hotel_Sheng= Hotel_Sheng&"</select>"
''###############最新10个酒店(Hotel_Hot)#####################
set rs=server.CreateObject("ADODB.RecordSet")
sql="select top 10 id,c_name from Hotelb order by id desc"
rs.open sql,conn,1,1
if rs.eof then
Hotel_Hot="·没有任何酒店"
else
do while not rs.eof
h=h+1
Hotel_Hot=Hotel_Hot&"·<a href=""Hotel/Hotel_"&rs("id")&".html"">"&rs("c_name")&"</a><br />"
if h>=10 then exit do
rs.movenext
loop
h=0
end if
rs.close
'##################left_xl_top#################
sql="select top 8 id,x_name from xianlu order by id desc"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
if rs.eof then
left_xl_top=left_xl_top&"暂时还没有任何信息!"
Else
do while not rs.eof

left_xl_top=left_xl_top&"<table width=""93%""  border=0 align=center cellpadding=0 cellspacing=0>"
left_xl_top=left_xl_top&"<tr><td height=""18""> <font color=""#666666""><a href=""xl/xl_"&rs("id")&".html"">"
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
left_hotel_top=left_hotel_top&"<tr><td height=""18""> <font color=""#666666""><a href=""hotel/hotel_"&rs("id")&".html"">"
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
left_view_top=left_view_top&"<form action=""vote.asp"" target=""newwindow"" method=""post"" name=""research""><tr><td valign=""top"" width=""100%"">"
for i=1 to 8
if rs("Select"&i)<>"" then
left_view_top=left_view_top&"<input style=""border: 0"" "
if i=1 then
left_view_top=left_view_top&" checked "
end if
left_view_top=left_view_top&"name=""Options"" type=""radio"" value="""&i&""">"&i&"."&rs("Select"&i)&"<br />"
end if
next
left_view_top=left_view_top&"</td></tr><tr><td width=""100%"" height=""30"" align=""center""><input type=""image"" border=""0"" name=""submit"" src=""images/vote1.gif"" width=""59"" height=""19"" style=""cursor:hand"">"
left_view_top=left_view_top&" <a href=""vote.asp?stype=view"" target=""_blank""><img src=""images/vote.gif"" width=""59"" height=""19"" border=""0""></a>"
left_view_top=left_view_top&"</td></tr></form></table>"
end if
rs.close
left_view_top=left_view_top&"</td></tr></table>"
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
''#########################################
pencat=replace(pencat,"Hotel_Sheng",Hotel_Sheng)
pencat=replace(pencat,"Hotel_Hot",Hotel_Hot)
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

<br /><br /><br />
<font color="#FF0000">·</font><a target="_blank" href="<%=FILENAME%>">点此浏览<%=FILENAME%></a>
</body></html>