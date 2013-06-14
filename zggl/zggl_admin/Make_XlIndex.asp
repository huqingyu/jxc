
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
dim FILENAME
FILENAME="../Xl.html"
set rs=server.createobject("adodb.recordset")
rs.open ("select * from mb"),conn,1,1
pencat=rs("Mb_Xl_Index_Show")
rs.close
'#########################################
Xl_Top = Xl_Top&"<table width=""100%""  border=1 cellPadding=0 cellSpacing=0 bordercolor=#999999 borderColorDark=#FFF bgcolor=#F9F9F9>"

sql="select top 3 id,x_jingdiantupian,x_name,x_baojia,x_shijian,x_leixun from xianlu where X_leiid = 15 order by id DESC"
Set rs=Server.CreateObject("ADODB.RecordSet") 
rs.open sql,conn,1,1
n=0
do while not rs.eof 

Xl_Top = Xl_Top&"<tr><td width=""27%"" rowspan=4><TABLE width=130 height=89 border=0 align=center cellPadding=0 cellSpacing=0>"
Xl_Top = Xl_Top&"<TBODY><TR><TD width=122><div align=center><img src=""admin/"&rs("x_jingdiantupian")&""" width=127 height=99 border=0></div></TD>"
Xl_Top = Xl_Top&"<TD width=10><IMG src=images/yy.gif width=10 height=99></TD></TR></TBODY></TABLE></td>"
Xl_Top = Xl_Top&"<td width=""17%"" height=25 background=images/admin_bg_1.gif align=center>线路名称：</td><td colspan=3 align=center><strong><font color=#FF6633>"&rs("x_name")&"</font></strong>"
Xl_Top = Xl_Top&"</td></tr><tr><td height=25 background=images/admin_bg_1.gif align=center>特惠价格：</td>"
Xl_Top = Xl_Top&"<td width=""21%"" align=center><strong><font color=#FF0000>"&rs("x_baojia")&"</font></strong></td>"
Xl_Top = Xl_Top&"<td width=""16%"" background=images/admin_bg_1.gif align=center> 所需时日： </td>"
Xl_Top = Xl_Top&"<td width=""19%"" align=center>"&rs("x_shijian")&"</td></tr><tr><td height=25 background=images/admin_bg_1.gif align=center> 线路类型：</td>"
Xl_Top = Xl_Top&"<td height=24 align=center>"&rs("x_leixun")&"</td><td height=24 colspan=2>&nbsp;</td></tr>"
Xl_Top = Xl_Top&"<tr><td height=34 colspan=4 align=center><table width=""97%"" height=22 border=0 cellpadding=0 cellspacing=0><tr>"
Xl_Top = Xl_Top&"<td><div align=left><a href=""Xl/Xl_"&rs("id")&".html""><img src=images/9.png border=0></a></div></td>"
Xl_Top = Xl_Top&"<td><div align=right><a href=""giveme.asp?id="&rs("id")&"""><img src=images/10.png width=67 height=21 border=0></a></div></td>"
Xl_Top = Xl_Top&"</tr></table></td></tr>"

Rs.movenext
Loop
Rs.close

Xl_Top = Xl_Top&"</table>"
''###############最新10条线路(Xl_Hot)#####################
set rs=server.CreateObject("ADODB.RecordSet")
sql="select * from xianlu order by id desc"
rs.open sql,conn,1,1
if rs.eof then
Xl_Hot="·没有任何线路"
else
do while not rs.eof
h=h+1
Xl_Hot=Xl_Hot&"·<a href=""xl/Xl_"&rs("id")&".html"">"&rs("X_Name")&"</a><br />"
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
left_view_top=left_view_top&"</td></tr><tr><td width=""100%"" height=""30"" align=""center""><input type=""image"" border=""0"" name=""submit"" src=""../images/vote1.gif"" width=""59"" height=""19"" style=""cursor:hand"">"
left_view_top=left_view_top&" <a href=""vote.asp?stype=view"" target=""_blank""><img src=""../images/vote.gif"" width=""59"" height=""19"" border=""0""></a>"
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
pencat=replace(pencat,"Xl_Top",Xl_Top)
pencat=replace(pencat,"Xl_Hot",Xl_Hot)
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