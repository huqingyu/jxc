<%
username=request.Cookies("Gemisum")("username")
response.Cookies("Gemisum")("username")=""
response.Cookies("Gemisum")("jifen")=0
response.Cookies("Gemisum")("yucun")=0
response.Cookies("Gemisum")("reglx")=0

response.Write "<script language=javascript>alert('���ѳɹ�ע����');window.location.href='../default.htm';</script>"
%>