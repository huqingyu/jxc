<!--#include file="config.asp" -->
<%
	adminname=replace(trim(request("name")),"'","")
	passwd=replace(trim(Request("password")),"'","")
          if adminname="" then
        Response.write "<script>alert('�㻹û�������û���!!!');history.back();</script>"
        Response.end
          end if
          if passwd="" then
        Response.write "<script>alert('�㻹û����������!!!');history.back();</script>"
        Response.end
          end if
	
 	if adminname=name and passwd=password then
	session("name")=adminname
	session("password")=passwd
    response.Redirect("admin.asp")
     else
	Response.write "<script>alert('�û������������!!!');history.back();</script>"
	end if

%>

