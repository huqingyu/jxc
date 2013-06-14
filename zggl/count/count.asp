<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<!--#include file="config.asp"-->
<%if is_echo<>ture then%>
<!--#include file="noupdate.asp"-->
<%else%>
<!--#include file="update.asp"-->
<%end if%>
document.write("<a href='count/index.asp' target='_blank'><%=gif_sum%></a>")
