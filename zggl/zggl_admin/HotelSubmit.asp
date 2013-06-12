
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
hotelname=trim(request("hotelname"))
hotelprovince=trim(request("hotelprovince"))
hotelcity=trim(request("hotelcity"))
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where c_name='"&hotelname&"' and province='"&hotelprovince&"' and city='"&hotelcity&"'"
rs.open sqltext,conn,3,3

if not rs.eof and not rs.bof then
		 Response.Redirect "messagebox.asp?msg=此酒店在同一地点已经注册过，请注册其他酒店!"
else
'添加一条记录到数据库
rs.addnew

jddz=request.form("jddz")
jfjc=request.form("jfjc")
jhcz=request.form("jhcz")
jctcz=request.form("jctcz")
jgkmt=request.form("jgkmt")
jsyzx=request.form("jsyzx")
jhxjq=request.form("jhxjq")
if jddz = "" then jddz = "未知" end if
rs("jddz") = jddz
if jfjc = "" then jfjc = "未知" end if
rs("jfjc") = jfjc
if jhcz = "" then jhcz = "未知" end if
rs("jhcz") = jhcz
if jctcz = "" then jctcz = "未知" end if
rs("jctcz") = jctcz
if jgkmt = "" then jgkmt = "未知" end if
rs("jgkmt") = jgkmt
if jsyzx = "" then jsyzx = "未知" end if
rs("jsyzx") = jsyzx
if jhxjq = "" then jhxjq = "未知" end if
rs("jhxjq") = jhxjq
rs("c_name")=request.form("hotelname")
rs("level")=request.form("hotellevel")
rs("province")=request.form("szSheng")
rs("city")=request.form("shucity")
rs("info")=request.form("hotelinfo")
rs("logurl")=request.form("hotellogurl")
rs("logurl2")=request.form("hotellogurl2")
rs("logurl3")=request.form("hotellogurl3")
rs("logurl4")=request.form("hotellogurl4")
rs("logurl5")=request.form("hotellogurl5")
rs("logurl6")=request.form("hotellogurl6")
rs("logurl7")=request.form("hotellogurl7")
rs("logurl8")=request.form("hotellogurl8")
rs("logurl9")=request.form("hotellogurl9")
rs("logurl10")=request.form("hotellogurl10")
rs("tuijian_id")=request.form("tuijian1")
rs.update
rs("id")=tid
rs.close
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>酒店登记成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<div align="center">      
  <table width="60%"  border=1 cellpadding=0 cellspacing=0 bordercolor="#999999" bordercolordark=#FFF bgcolor="#F9F9F9">
    <tbody>
      <tr valign=top bgcolor=#e1f0ff>
        <td width="431" height="30" background="Images/topBar_bg.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="60" valign="middle"><font class="medium">
          <p align="center">酒店：<%=request.form("hotelname")%> 注册成功!</p>
        </font></td>
      </tr>
      <tr bgcolor=#e1f0ff>
        <td height="35" background="Images/topBar_bg.gif">
          <p align="center">
            <input name="button" type="button" onClick=" window.location='hotelreg.asp'" value="登记下一个">
            <input name="button2" type="button" onClick=" window.location='manage.asp'" value="返回">
          </td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>