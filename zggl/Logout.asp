<%
username=request.Cookies("Gemisum")("username")
response.Cookies("Gemisum")("username")=""
response.Cookies("Gemisum")("jifen")=0
response.Cookies("Gemisum")("yucun")=0
response.Cookies("Gemisum")("reglx")=0
response.Cookies("Gemisum")("reglx")=""

response.Write "<script language=javascript>alert(' 您现在的位置:');window.location.href='index_Login.asp';</script>"
%>