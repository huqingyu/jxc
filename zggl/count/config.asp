<%
'=================================
'
'           参 数 设 置
'
'=================================

is_ipcheck	= true			' 是否启用防刷新功能，true表示启用，false表示不启用

name="kaede"           '管理员名称
password="1120"     '管理员密码

mURL		= "http://hotelreg.net/"	' 站点连接
mName		= "心之旅"				' 站点名称
mNameEn		= "hotelreg"			' 站点英文名称

if is_ipcheck=true then
	is_echo=cbool(Request.Cookies(mNameEn & "echo")("lao"))
	if is_echo <> true then
	Response.Cookies(mNameEn & "echo")("lao")=true
	Response.Cookies(mNameEn & "echo").Expires=now()+0.01
	end if
end if
%>