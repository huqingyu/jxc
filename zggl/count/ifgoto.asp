<%
''���������V1.0
%>
<%
if session("name")="" or session("password")="" then
        Response.write "<script>alert('�㻹û�е�½!!!');history.back();</script>"
end if
%>
