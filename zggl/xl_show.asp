<!--#include file="common/conn.asp" -->
<%
dim Id
id=trim(Request("Id"))
''##################度假产品内容页###############
set rs=server.createobject("adodb.recordset")
rs.open ("select * From xianlu Where Id = "&id&" "),Conn,1,1
Xl_Id = rs("Id")
Xl_Name = rs("X_Name")
Xl_Leixun = rs("X_Leixun")
Xl_Baojia = rs("X_Baojia")
if trim(rs("x_jingdiantupian"))="" then
Xl_Img = Xl_Img& "暂无图片"
else
Xl_Img = Xl_Img&"<a href="""&rs("x_jingdiantupian")&""" target=""_blank""><img src="""&rs("x_jingdiantupian")&" "" alt=""点击在新窗口观看"" width=""200"" border=""0""></a>"
end if
Xl_ShuoMing = rs("X_ShuoMing")
XL_AnPai = rs("X_Anpai")
Xl_JingDian = rs("X_JingDian")
Xl_Beizhu = rs("X_ZhuShi")
Xl_Botton = Xl_Botton&"<a href =""order/giveme.asp?id="&rs("id")&"""><img src=""images/10.png"" width=""67"" height=""21"" border=""0""></a>"
rs.close
''###############最新10条线路(Xl_Hot)#####################
set rs=server.CreateObject("ADODB.RecordSet")
sql="select * from xianlu order by id desc"
rs.open sql,conn,1,1
if rs.eof then
Xl_Hot="·没有任何线路"
else
do while not rs.eof
h=h+1
Xl_Hot=Xl_Hot&"·<a href=""xl_show.asp?id="&rs("id")&""">"&rs("X_Name")&"</a><br />"
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
left_xl_top=left_xl_top&"<tr><td height=""18""> <font color=""#666666""><a href=""xl_show.asp?id="&rs("id")&""">"
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
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<meta name="author" content="huqingyu@gmail.com,浙林龙哥" />
<meta name="copyright" content="seirsoft.com" />
<meta name="description" content="中国国旅-CITS" />
<meta content="中国国旅-CITS|中国国旅" name="keywords" />
<title><%=Xl_Name%>-详细信息</title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
<!--#include file="top.asp" -->
<div id="J_page" class="w980 center">
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>
		<TABLE cellSpacing=0 cellPadding=0 width=100% border=0>
            <TR>
              <TD width=212 vAlign=top>
			  <table width="212" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" background="image/left_header.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px;">最新酒店</td>
                  </tr>
                  <tr>
                    <td height="180" align="center" background="images/left_bgg.jpg" style="border-left:1px solid #9AD394;border-right:1px solid 
#9AD394"> <%=left_hotel_top%></td>
                  </tr>
                  <tr>
                    <td><img src="images/left_18.jpg" width="212" height="5" alt="" /></td>
                  </tr>
                </table>
                  <table border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="6"></td>
                    </tr>
                  </table>
                <table width="212" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" background="image/left_header.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px;">最新线路

</td>
                    </tr>
                    <tr>
                      <td height="180" align="center" background="images/left_bgg.jpg" style="border-left:1px solid #9AD394;border-right:1px solid #9AD394"><%=left_xl_top%></td>
                    </tr>
                    <tr>
                      <td><img src="images/left_18.jpg" width="212" height="5" alt="" /></td>
                    </tr>
                </table>
                <table border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="6"></td>
                    </tr>
                </table>
                <table width="212" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="30" background="image/left_header.jpg" style="font-weight:bold; font-size:14px; color:#FFFFFF; padding-left:38px;">在线调查

</td>
                    </tr>
                    <tr>
                      <td height="180" align="center" background="images/left_bgg.jpg" style="border-left:1px solid #9AD394;border-right:1px solid 

#9AD394"><%=left_view_top%></td>
                    </tr>
                    <tr>
                      <td><img src="images/left_18.jpg" width="212" height="5" alt="" /></td>
                    </tr>
                </table>
                <table border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="6"></td>
                    </tr>
                </table>
				</TD>
              <TD width="100%" vAlign=top align=left>
					<table width="100%"  border=1 cellpadding=0 cellspacing=0 bordercolor="#EEEEEE" bordercolordark=#ffffff bgcolor="#F9F9F9">
					  <tr>
						<td width="7%" height="28"><div align="center"><%=Xl_Id%></div></td>
						<td colspan="2" background="images/topBar_bg.gif"><%=Xl_Name%></td>
						<td width="22%"><div align="center"><%=Xl_Leixun%></div></td>
						<td width="26%"><div align="center"><%=Xl_Baojia%></div></td>
						<td width="12%"><div align="center"><%=Xl_Botton%></div></td>
					  </tr>
					</table>
					<div align="center"><%=Xl_Img%></div>
					<div><%=XL_AnPai%></div>
				</TD>
			</TR>
			</TABLE>
		


<div></div>
<!--#include file="foot.asp" -->
</div>

<script src="js/js.js"></script>
</body>
</html>
