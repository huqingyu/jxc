<!--#include file="conn.asp"--> <!--#include file="/common/WebConfig.asp"-->
<%
Response.expires=0
Response.charset="gb2312"
Response.ContentType="text/xml"
Set rs = Server.CreateObject("ADODB.Recordset")
sql="select top 4 * from fromw order by coun desc"
rs.Open sql,conn,1,2
Set sumrs= Server.CreateObject("ADODB.Recordset")
sql="select  * from sum"
sumrs.Open sql,conn,1,2
%>
<pieData QUESTION="登陆计数器">
<%i=1
while not rs.eof 
  select case i
    case 1
  color="9999FF"
    case 2
  color="993366"
    case 3
  color="8DEC8E"
    case 4
  color="CCFFFF"
    case 5
  color="660066"
  end select
  %>
   <pie color="<%=color%>">
  <value><%=rs("coun")%></value> 
  <text><%=rs("vwhere")%></text> 
  </pie>
  <%
  sum=sum+rs("coun")
  i=i+1
  rs.movenext
  wend%>
  <pie color="660066">
  <value><%=(sumrs("sum")-sum)%></value> 
  <text>其他</text> 
  </pie> 
  </pieData>