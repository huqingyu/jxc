<!--#include file="common/conn.asp"--> <!--#include file="common/webconfig.asp"-->
<% set rs= Server.CreateObject("adodb.recordset")
sql="select  * from news where id="&request("id")
rs.open sql,conn,1,3
rs("lls")=rs("lls")+1
rs.update
bt=rs("bt")
nr=rs("nr")
mytype=rs("mytype")
riqi=rs("riqi")
zz=rs("zz")
ly=rs("ly")
lls=rs("lls")
tu=rs("tu")

%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title><%= bt %>-<%=webname%></title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<script language=JavaScript src="js/js.js"></script>
</head>
<body>

<!--#include file="top.asp" -->

<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<!--网站顶部开始 -->
	<!--#include file="left.asp" -->	<!--网站顶部结束 -->	</td>
    <td align="right" valign="top" bgcolor="#FFFFFF"><TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
      <tr>
        <TD height="30" style="border:1px solid #8CC363; background-color:#E7F5DD;padding:0 10px"><b>您现在的位置:</b><a href="index.asp">首页</a> &gt;&gt; <a href="list.asp?tp=<%= mytype %>">
          <% set rs=conn.execute("select * from nlei where id="&mytype)
response.Write(rs("nlei")) %></a>内容</td>
        </tr>
      
    </TABLE>

      <table width="760" height="813" border="0" cellpadding="6" cellspacing="0" style="border:1px solid #C7DDAF; background-color:#FCFFF9;">
        <tr>
          <td width="75%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:24px;">
            <tr>
              <td height="50" align="center" style="font-size:20px; color:#009900; font-family:Arial, Helvetica, sans-serif;"><strong><%= bt %></strong></td>
            </tr>
          </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="1"  bgcolor="#e2eed0"></td>
              </tr>
              <tr>
                <td height="26" align="center" bgcolor="#F3FCE9" style="color:009900">作者:
                    <%if zz="" then response.Write"管理员" else response.Write(zz) end if  %>
                  &nbsp; 来源:
                  <%if ly="" then response.Write"河南旅游网" else response.Write(ly) end if  %>
                &nbsp; 加入日期:<%= riqi %>&nbsp; 点击率:<%= lls %></td>
              </tr>
            </table>
            <table width="96%" border="0" cellspacing="0" cellpadding="5" style="line-height:24px;">
              <tr>
                <td valign="top" style="color:#333; font-size:14px; font-family:Arial, Helvetica, sans-serif; line-height:28px;"><%if tu<>"" then%><div align="center"><img  src="<%=tu%>" border="0" style="border:1px solid #CCCCCC;"><br>
                </div><%end if%>
                <%= nr %></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="5" style="line-height:24px;">
              <tr>
                <td height="22" align="right"><span style="color:999999">编辑：<%if zz="" then response.Write"河南在线" else response.Write(zz) end if  %></span></td>
              </tr>
			  <tr>
                <td bgcolor="#E8E8E8" height="1"></td>
              </tr>
			  <tr>
                <td bgcolor="#F7F7F7" height="4"></td>
              </tr>
              <tr>
                <td style="color:#999999; font-size:12px; font-family:Arial, Helvetica, sans-serif; line-height:22px;"><%
	sql="select * from news where id="&request("id")-1   
	set rss=server.createobject("adodb.recordset")
	rss.open sql,conn,1,1
  	if rss.eof and rss.bof then   
%>
⊕ 您现在的位置:
<%else%>
⊕ 上一篇：<a href="show.asp?id=<%=rss("id")%>"><%=rss("bt")%></a>
<%end if%><br>
<%	rss.close   
	sql="select * from news where id="&request("id")+1  
	set rss=server.createobject("adodb.recordset") 
	rss.open sql,conn,1,1
	if rss.eof and rss.bof then   
%>
⊕ 您现在的位置: 
<%else%>
⊕ 下一篇：<a href="show.asp?id=<%=rss("id")%>"><%=rss("bt")%></a>
<%end if%>                </td>
              </tr>
            </table></td>
        </tr>
      </table>
      <!--格线 -->
      <!--格线 --></td>
  </tr>
</table>
<table border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="6"></td>
  </tr>
</table>

<!--#include file="foot.asp" -->

</body>
</html>
