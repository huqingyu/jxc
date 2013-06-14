
<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<%
function cip(sip)
	tip=cstr(sip)
	sip1=left(tip,cint(instr(tip,".")-1))
	tip=mid(tip,cint(instr(tip,".")+1))
	sip2=left(tip,cint(instr(tip,".")-1))
	tip=mid(tip,cint(instr(tip,".")+1))
	sip3=left(tip,cint(instr(tip,".")-1))
	sip4=mid(tip,cint(instr(tip,".")+1))
	cip=cint(sip1)*256*256*256+cint(sip2)*256*256+cint(sip3)*256+cint(sip4)
end function

vip=Request.ServerVariables("Remote_Addr")
ipnow=cip(vip)

Set rsip = Server.CreateObject("ADODB.Recordset")
sql="select * from ip where (onip<=" & ipnow & " and offip>=" & ipnow & ")"
rsip.Open sql,conn,1,1

if rsip.EOF then
	vwhere="δ֪"
	vwheref=""
else
	vwhere=rsip("addj")
	vwheref=rsip("addf")
end if

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select  * from fromw where vwhere='"&vwhere&"'"
rs.Open sql,conn,1,2
if rs.eof then
rs.AddNew
rs("coun")=1
rs("vwhere")=vwhere
rs("vwheref")=vwheref
else
rs("coun")=rs("coun")+1 
end if
rs.Update 
rs.Close
%>
