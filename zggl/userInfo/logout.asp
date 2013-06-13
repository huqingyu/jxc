<%
username=request.Cookies("Gemisum")("username")
response.Cookies("Gemisum")("username")=""
response.Cookies("Gemisum")("jifen")=0
response.Cookies("Gemisum")("yucun")=0
response.Cookies("Gemisum")("reglx")=0

response.Write "<script language=javascript>alert('您已成功注销！');window.location.href='../default.htm';</script>"
%>