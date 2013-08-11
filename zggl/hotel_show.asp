<!--#include file="common/conn.asp" -->
<%
dim Id
id=trim(Request("Id"))
'#########################################
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where id="&request("id")&"" 
rs.open sqltext,conn,1,1
if rs.eof then 
	Hotel_Info=Hotel_Info&"没有找到符合条件的宾馆信息，返回重新查找!</script>"
else

	set rs_s=server.createobject("adodb.recordset")
	sqltext="select ShengNo,shengname from szSheng where ShengNo='"&rs("province")&"'"
	rs_s.open sqltext,conn,1,1
	shengname=rs_s("shengname")
	rs_s.close
	do while not rs.eof 

	Hotel_Info=Hotel_Info&"<table width=""97%"" border=1 cellPadding=0 cellSpacing=0 bordercolor=#9AD8EC borderColorDark=#FFF>"
	Hotel_Info=Hotel_Info&"<tr><td bgcolor=#D5F2F9><div align=center><font size=3 color=#ff0000><b>"&rs("c_name")&"</b></font><div></td>"
	Hotel_Info=Hotel_Info&"<tr><td bgcolor=#D5F2F9><div align=right>所在省份:"&shengname&"　　所在地区："&rs("city")&"<div></td>"
	Hotel_Info=Hotel_Info&"</tr><tr><td height=8 colspan=3></td></tr></table>"
	Hotel_Info=Hotel_Info&"<table width=""97%"" border=1 cellPadding=0 cellSpacing=0 bordercolor=#9AD8EC borderColorDark=#FFF>"
	Hotel_Info=Hotel_Info&"<tr><td valign=top >　　"&rs("info")&"</td><td valign=top width=200><div align=center><a href=""/admin/"&rs("logurl")&""" target=_blank><img border=0 src=../admin/"&rs("logurl")&" width=200 height=180></a></div></td>"
	Hotel_Info=Hotel_Info&"</tr><tr><td height=8 colspan=3></td></tr></table>"
	Hotel_Info=Hotel_Info&"<table width=""97%"" border=1 cellPadding=0 cellSpacing=0 bordercolor=#9AD8EC borderColorDark=#FFF>"
	Hotel_Info=Hotel_Info&"<tr><td width=""100%"" align=center><div align=center><marquee behavior=""ALTERNATE"" Direction=""left"" scrolldelay=""200"" loop=""-1"" truespeed onMouseOver=""this.stop();"" onMouseOut=""this.start();"">"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl")&""" target=_blank><img border=0 src=../admin/"&rs("logurl")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl2")&""" target=_blank><img border=0 src=../admin/"&rs("logurl2")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl3")&""" target=_blank><img border=0 src=../admin/"&rs("logurl3")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl4")&""" target=_blank><img border=0 src=../admin/"&rs("logurl4")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl5")&""" target=_blank><img border=0 src=../admin/"&rs("logurl5")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl6")&""" target=_blank><img border=0 src=../admin/"&rs("logurl6")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl7")&""" target=_blank><img border=0 src=../admin/"&rs("logurl7")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl8")&""" target=_blank><img border=0 src=../admin/"&rs("logurl8")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl9")&""" target=_blank><img border=0 src=../admin/"&rs("logurl9")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"<a href=""/admin/"&rs("logurl10")&""" target=_blank><img border=0 src=../admin/"&rs("logurl10")&" width=170 height=140 /></a>　"
	Hotel_Info=Hotel_Info&"</marquee></div></td>"
	Hotel_Info=Hotel_Info&"</tr></table>"


	Hotel_Info=Hotel_Info&"<table width=""97%"" border=1 cellPadding=0 cellSpacing=0 bordercolor=#9AD8EC borderColorDark=#FFF>"
	Hotel_Info=Hotel_Info&"<tr><td align=center height=30 colspan=2 bgcolor=#9AD8EC><font color=#006699>酒店地理位置信息</font></td></tr>"
	Hotel_Info=Hotel_Info&"<tr><td colspan=2>　酒店地址：" & rs("jddz") & "</td></tr>"
	Hotel_Info=Hotel_Info&"<tr><td>　距飞机场："&rs("jfjc")&"</td><td>　距火车站："&rs("jhcz")&"</td></tr>"
	Hotel_Info=Hotel_Info&"<tr><td>　距长途车站："&rs("jctcz")&"</td><td>　距港口码头："&rs("jgkmt")&"</td></tr>"
	Hotel_Info=Hotel_Info&"<tr><td>　距商业中心："&rs("jsyzx")&"</td><td>　距核心景区："&rs("jhxjq")&"</td></tr>"
	Hotel_Info=Hotel_Info&"</table>"

	c_id=rs("id")
	set rsroom=server.createobject("adodb.recordset")
	sqltext="select * from roomb where c_id="&c_id&"" & " order by id asc"
	rsroom.open sqltext,conn,1,1
	if not rsroom.eof then
		Hotel_Info=Hotel_Info&"<TABLE borderColor=#9ad8ec cellSpacing=0 borderColorDark=#FFF cellPadding=0 width=""97%"" border=1>"
		Hotel_Info=Hotel_Info&"<tr><td width=""19%"" bgcolor=#9AD8EC height=20><font color=#006699>房型</font></td>"
		Hotel_Info=Hotel_Info&"<td width=""7%"" bgcolor=#9AD8EC height=16><font color=#006699>早餐</font></td>"
		Hotel_Info=Hotel_Info&"<td width=""12%"" bgcolor=#9AD8EC height=16><font color=#006699>门市价</font></td>"
		Hotel_Info=Hotel_Info&"<td bgcolor=#9AD8EC height=16 colspan=2><font color=#006699>前台现付价</font></td>"
		Hotel_Info=Hotel_Info&"<td width=""15%"" bgcolor=#9AD8EC height=16><font color=#006699>团购价</font></td>"
		Hotel_Info=Hotel_Info&"<td width=""13%"" bgcolor=#9AD8EC height=16><font color=#006699>支付方式</font></td>"
		Hotel_Info=Hotel_Info&"<td width=""12%"" bgcolor=#9AD8EC height=16><font color=#006699>首日房态</font></td></tr>"

		do while not rsroom.eof
		Hotel_Info=Hotel_Info&"<tr><td width=""20%"" height=14 bgcolor=#f7fcfd><div align=center>"&rsroom("type")&"</div></td>"
		Hotel_Info=Hotel_Info&"<td width=""8%"" height=14 bgcolor=#f7fcfd>"
		Hotel_Info=Hotel_Info&"<p align=center>"&rsroom("breakfast")&"</td><td width=""10%"" height=14 bgcolor=#f7fcfd>RMB "&rsroom("marketprice")&"</td>"
		Hotel_Info=Hotel_Info&"<td width=""13%"" height=14 bgcolor=#f7fcfd>RMB "&rsroom("stageprice")&"</td><td width=""9%"" height=14 bgcolor=#f7fcfd>"
		Hotel_Info=Hotel_Info&"<p align=center> <a href=""../UserInfo/login.asp?hotelid="&rs("id")&"&roomid="&rsroom("id")&""" target=_blank><font color=#FF0000>预订</font></a></td>"
		Hotel_Info=Hotel_Info&"<td width=""15%"" height=14 bgcolor=#f7fcfd>RMB "&rsroom("netprice")&"</td>"
		Hotel_Info=Hotel_Info&"<td width=""13%"" height=14 bgcolor=#f7fcfd>"&rsroom("paytype")&"</td>"
		Hotel_Info=Hotel_Info&"<td width=""12%"" height=14 bgcolor=#f7fcfd><p align=center>"&rsroom("state")&"</td></tr>"
		rsroom.movenext
		loop

		Hotel_Info=Hotel_Info&"</table>"

	end if
	rsroom.close
	rs.movenext
	loop
end if
rs.close

''###############最新10个酒店(Hotel_Hot)#####################
set rs=server.CreateObject("ADODB.RecordSet")
sql="select top 10 id,c_name from Hotelb order by id desc"
rs.open sql,conn,1,1
if rs.eof then
Hotel_Hot="·没有任何酒店"
else
do while not rs.eof
h=h+1
Hotel_Hot=Hotel_Hot&"·<a href=""../Hotel/Hotel_"&rs("id")&".html"">"&rs("c_name")&"</a><br />"
if h>=10 then exit do
rs.movenext
loop
h=0
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
left_hotel_top=left_hotel_top&"<tr><td height=""18""> <font color=""#666666""><a href=""hotel_"&rs("id")&".html"">"
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

	<TABLE width=980 border=0 align="center" cellPadding=0 cellSpacing=0>
        <TR>
          <TD>
		  <TABLE cellSpacing=0 cellPadding=0 width=980 border=0>
                <TR>
                  <TD vAlign=top align=left>
                    <table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0">
                  <td align="center" valign="top">
				  <TABLE WIDTH=100% BORDER=0 CELLPADDING=0 CELLSPACING=0>
                    <TR>
                      <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD; background-image:url(Images/show_bg.jpg);">  <b>您现在的位置：</b><a href="/index.asp">首页</a> >> 餐饮酒店</TD>
                    </TR>
                  </TABLE>
						<div>
							<%=Hotel_Info%>
						</div>
					</td>
				  </tr>
                  </table></TD>
                  <TD align="center" valign="top">
				  <table width="184" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #A9D394;">
                    <tr>
                      <td width="182" height="26" align="center" background="../Images/tops2.gif" bgcolor="#E7F8DE" style="font-size:14px; font-weight:bold;">热点酒店</td>
                    </tr>
                    <tr>
                      <td height="190" align="center"><table width="165" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><%=Hotel_Hot%></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
                    <table border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="6"></td>
                      </tr>
                    </table>
                    <table width="180" border="0" cellspacing="0" cellpadding="0" style="border:1px solid #A9D394;">
                      <tr>
                        <td height="26" align="center" background="../Images/tops2.gif" bgcolor="#E7F8DE" style="font-size:14px; font-weight:bold;">最新酒店</td>
                      </tr>
                      <tr>
                        <td height="190" align="center"><table width="165" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><%=left_hotel_top%></td>
                            </tr>
                        </table></td>
                      </tr>
                    </table>
                    <table border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="6"></td>
                      </tr>
                    </table></TD>
                </TR>
          </TABLE>
		  </TD>
        </TR>
	</TABLE>



<div></div>
<!--#include file="foot.asp" -->
</div>


<script>
function checkform(){
if(ListItemForSale.shucity.value==''){
alert("请输入你所要查询的城市！");
ListItemForSale.shucity.focus();
return false;
}
if(ListItemForSale.starttime.value=='点击选择日期'){
alert("请选择入住日期！");
ListItemForSale.starttime.focus();
return false;
}
if(ListItemForSale.deptime.value=='点击选择日期'){
alert("请选择退房日期！");
ListItemForSale.deptime.focus();
return false;
}
}
</script>
<script src="admin/system/indexdatejs.js"></script>
<script src="admin/system/hotel_Add.js"></script>
<script src="js/js.js"></script>
</body>
</html>




