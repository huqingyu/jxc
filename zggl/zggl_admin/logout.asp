<%
Session("vip")=Nothing
Session("admin")=Nothing
Session.Abandon()
Response.Redirect("../index.asp")
%>

