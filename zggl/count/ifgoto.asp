<%
''飞鸟计数器V1.0
%>
<%
if session("name")="" or session("password")="" then
        Response.write "<script>alert('你还没有登陆!!!');history.back();</script>"
end if
%>
