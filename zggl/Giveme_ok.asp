<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<!--#include file="connection.asp" -->
<%
dim textfield,textfield1,textfield2,textfield3,textfield4,textfield5,textfield6,textfield7,textfield8,textfield9,textfield10,textfield11,textfield12,textfield13,textfield14,textfield15,textfield16,textfield17,textfield18,textfield19,textfield20,textfield21,textfield22,textfield23
textfield=Request("textfield")
textfield2=Request("textfield2")
textfield3=Request("textfield3")
textfield4=Request("textfield4")
textfield5=Request("textfield5")
textfield6=Request("textfield6")
textfield7=Request("textfield7")
textfield8=Request("textfield8")
textfield9=trim(Request("textfield9"))
textfield10=Request("textfield10")
textfield11=Request("textfield11")
textfield12=Request("textfield12")
textfield13=Request("textfield13")
textfield14=Request("textfield14")
textfield15=Request("textfield15")
textfield16=Request("textfield16")
textfield17=Request("textfield17")
textfield18=Request("textfield18")
textfield19=Request("textfield19")
textfield20=Request("textfield20")
textfield21=Request("textfield21")
textfield22=Request("textfield22")
textfield23=Request("textfield23")
if not isNumeric(textfield9) then
errormsg="<li> 您现在的位置: 您现在的位置:必须为数字！</li><br>"
founderr=true
end if
if not isNumeric(textfield16) then
errormsg=errormsg&"<li> 您现在的位置: 您现在的位置:必须为数字！</li></br>"
founderr=true
end if
if not isdate(textfield19) then
errormsg=errormsg&"<li> 您现在的位置: 您现在的位置: 您现在的位置: 您现在的位置:！</li></br>"
founderr=true
end if
if not isdate(textfield20) then
errormsg=errormsg&"<li> 您现在的位置: 您现在的位置: 您现在的位置: 您现在的位置:！</li></br>"
founderr=true
end if
if founderr then
response.Redirect("error.asp?errormsg="&errormsg&"")
end if
set rs=server.createobject("adodb.recordset")
set rs.activeconnection=conn
sql="select * from giveme"
rs.open sql,,1,2
rs.addnew
rs("m_id")=textfield
rs("m_xianlu_name")=textfield2
rs("m_name")=textfield3
rs("m_address")=textfield4
rs("m_email")=textfield5
rs("m_oicq")=textfield6
rs("m_age")=textfield7
rs("m_homepage")=textfield8
rs("m_phone")=textfield9
rs("m_shouji")=textfield10
rs("m_fax")=textfield11
rs("m_gongzuodanwei")=textfield12
rs("m_zhengjian")=textfield13
rs("m_youbian")=textfield14
rs("m_daoyou")=textfield15
rs("m_renshuo")=textfield16
rs("m_pingchuan")=textfield17
rs("m_yudingtime")=textfield18
rs("m_laiyoutime")=textfield19
rs("m_huanchengtime")=textfield20
rs("m_mfk")=textfield21
rs("m_mfk_1")=textfield22
rs("m_mfk_2")=textfield23
rs.update
rs.close
set rs=nothing
set rs=server.createobject("adodb.recordset")
sqltext="select * from payjilu "
rs.open sqltext,conn,3,3
rs.addnew
rs("username")=request.Cookies("Gemisum")("username")
rs("type")="度假产品"
rs("name")=request.form("textfield2")
rs("jiage")=request.form("x_baojia")
rs("paytime")=now
rs.update
rs.close
conn.close
set conn=nothing
response.Write "<script language='javascript'>alert(' 您现在的位置: 您现在的位置: 您现在的位置: 您现在的位置:');window.location.href='Xl.html';</script>"
%>