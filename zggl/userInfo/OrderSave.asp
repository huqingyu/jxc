<!--#include file="../common/conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from orderb "
rs.open sqltext,conn,3,3
rs.addnew
rs("c_id")=request.form("hotelid")
rs("userid")=request.Cookies("Gemisum")("username")
rs("roomtype")=request.form("roomid")
rs("jointime")=request.form("starttime")
rs("leavetime")=request.form("deptime")
rs("paytype")=request.form("paytype")
rs("roomnum")=request.form("Roomcount")
rs("totalnum")=request.form("roomcount")*request.form("price")
rs("username")=request.form("contactname")
rs("mobiletel")=request.form("Phone")
if request.form("fax")="" then
	rs("fax")="无"
else
	rs("fax")=request.form("fax")
end if
rs("email")=request.form("email")
rs("affirmtype")=request.form("ConfirmType")
if request.form("info")="" then
	rs("explain")="无"
else
	rs("explain")=request.form("info")
end if
rs("number")=request.form("personcount")
rs("degree")=request.form("ClientComeFrom")
if request("clientname1")="" then
	rs("man1")="无"
else
	rs("man1")=request.form("clientname1")
end if
if request("clientname2")="" then
	rs("man2")="无"
else
	rs("man2")=request.form("clientname2")
end if
if request("clientname3")="" then
	rs("man3")="无"
else
	rs("man3")=request.form("clientname3")
end if
if request("clientname4")="" then
	rs("man4")="无"
else
	rs("man4")=request.form("clientname4")
end if
if request("clientname5")="" then
	rs("man5")="无"
else
	rs("man5")=request.form("clientname5")
end if
if request("clientname6")="" then
	rs("man6")="无"
else
	rs("man6")=request.form("clientname6")
end if
if request("clientname7")="" then
	rs("man7")="无"
else
	rs("man7")=request.form("clientname7")
end if
if request("clientname8")="" then
	rs("man8")="无"
else
	rs("man8")=request.form("clientname8")
end if
if request("ArrivalWay")="" then
	rs("cometype")="无"
else
	rs("cometype")=request.form("ArrivalWay")
end if
rs.update
rs.close
set rs=server.createobject("adodb.recordset")
sqltext="select * from payjilu "
rs.open sqltext,conn,3,3
rs.addnew
rs("username")=request.Cookies("Gemisum")("username")
rs("type")="酒店"
rs("name")=request.form("hotelname")
rs("jiage")=request.form("stageprice")
rs("paytime")=now
rs.update
rs.close
conn.close
response.write"<SCRIPT language=JavaScript>alert('恭喜你，酒店预定成功！在你成功入住之后将会获得相应积分！');"
response.write"javascript:window.close();</SCRIPT>"
response.End
%>