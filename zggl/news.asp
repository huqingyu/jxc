<!--#include file="common/conn.asp"--> <!--#include file="admin/system/WebConfig.asp"-->
<% tp=request("tp") %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title> 您现在的位置:书圣文化节</title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>

<!--#include file="top.asp" -->

<table width="1005" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="229" height="32" align="center" valign="top" bgcolor="F0F0F0">
	<!--网站顶部开始 -->
    <!--#include file="left.asp" -->
    <!--网站顶部结束 -->
	</td>
    <td width="6" background="images/r_bg.jpg">&nbsp;</td>
    <td valign="top"><TABLE WIDTH=770 BORDER=0 CELLPADDING=0 CELLSPACING=0>
      <tr>
        <TD width="350" background="images/rtop_1.jpg">&nbsp; <a href="index.asp">首页</a> &gt;&gt; <a href="index.asp">书圣文化节</a> &gt;&gt;
          <a href="#">最新文章</a></td>
        <TD colspan="4"><TABLE WIDTH=420 BORDER=0 CELLPADDING=0 CELLSPACING=0>
          <tr>
            <td><IMG SRC="images/ne_r_1.jpg" WIDTH=102 HEIGHT=8 ALT=""></td>
            <td><IMG SRC="images/ne_r_2.jpg" WIDTH=76 HEIGHT=8 ALT=""></td>
            <td><IMG SRC="images/ne_r_3.jpg" WIDTH=78 HEIGHT=8 ALT=""></td>
            <td><IMG SRC="images/ne_r_4.jpg" WIDTH=77 HEIGHT=8 ALT=""></td>
            <td><IMG SRC="images/ne_r_5.jpg" WIDTH=87 HEIGHT=8 ALT=""></td>
          </tr>
          <tr>
            <td><IMG SRC="images/ne_r_6.jpg" WIDTH=102 HEIGHT=19 ALT=""></td>
            <td><a href="list.asp?tp=16" target="_blank"><IMG SRC="images/ne_r_7.jpg" ALT="" WIDTH=76 HEIGHT=19 border="0"></a></td>
            <td><a href="img.asp?tp=25"><IMG SRC="images/ne_r_8.jpg" ALT="" WIDTH=78 HEIGHT=19 border="0"></a></td>
            <td><a href="list.asp?tp=20"><IMG SRC="images/ne_r_9.jpg" ALT="" WIDTH=77 HEIGHT=19 border="0"></a></td>
            <td><a href="list.asp?tp=26"><IMG SRC="images/ne_r_10.jpg" ALT="" WIDTH=87 HEIGHT=19 border="0"></a></td>
          </tr>
        </TABLE></td>
        </tr>
      
    </TABLE>
    <table width="100%" border="1" cellpadding="6" cellspacing="3" bordercolor="#EEEEEE">
        <tr>
          <td width="75%" height="374" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="25" align="center" style="font-size:14px; color:#CC6600; font-weight:bold;" bgcolor="#FBE3B7"><img src="images/bat.gif" width="9" height="7"></td>
              <td width="90" height="26" bgcolor="#FBE3B7" style="font-size:14px; color:#CC6600; font-weight:bold;">最新文章</td>
              <td bgcolor="#FBF3DB">&nbsp;</td>
            </tr>
            <tr>
              <td bgcolor="#E29A44"></td>
              <td height="2" bgcolor="#E29A44"></td>
              <td  bgcolor="#EEA93E"></td>
            </tr>
          </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:24px;">
              <tr>
                <td valign="top" style="border-left:1px solid #F0D7B1; border-right:1px solid #F0D7B1; border-bottom:1px solid #F0D7B1;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <%
 		  set rs=server.createobject("adodb.recordset") 
		  sql="select * from news where  mytype=16 or mytype=18 or mytype=19 or mytype=20 or mytype=27 or mytype=32 order  by id desc"
		  rs.open sql,conn,1
		  
		  rs.pagesize=18' 您现在的位置:
          pagecount=rs.pagecount '总页数
		  
		     if rs.bof and rs.eof then
              response.write ""
              else
					 
              page=clng(request.querystring("page"))
              if page<1 then page=1
              if page>rs.pagecount then page=rs.pagecount
              rs.absolutepage=page  '跳到多少页
  
              for i=1 to rs.pagesize
          %>
                          <tr>
                            <td width="84%" height="24" align="left" bgcolor="<% If i mod 2=0  Then %>#FDFAEF<% Else %>#ffffff<% End If %>">&nbsp;<font color="#FF6600">·</font>&nbsp;<a href="show.asp?id=<%=rs("id")%>" target="_blank"> 
                              <% If rs("color")<>"" Then %>
                    <font color="<%= rs("color") %>"><%=left(rs("bt"),34)%> (<%= rs("riqi") %>)</font>
                    <% Else %>
                    <%=left(rs("bt"),34)%>
                    <% End If %></a></td>
                            <td width="16%" align="center" bgcolor="<% If i mod 2=0  Then %>#FDFAEF<% Else %>#ffffff<% End If %>"><a href="show.asp?id=<%=rs("id")%>" target="_blank"><span style="font-family:Arial, Helvetica, sans-serif; font-size:10px; color:#999999;">(<%= rs("riqi") %>)</span></a></td>
                          </tr>
                          <% 
         rs.movenext
         if rs.eof then exit for 
         next
         end if 
         %>
                        </table>
                          <table width="95%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td height="22" align="center">&nbsp;&nbsp;&nbsp;&nbsp;
                                						
								<span style="color:#666666">[共<%=rs.pagecount%>页&nbsp;当前第<%=page%>页&nbsp;<%
	if page<=1 then
	   Response.Write("首页&nbsp;&nbsp;")
       Response.Write ("上一页")
    else
	  Response.Write("<a href='?Page=1' class='list'>首页</a>&nbsp;&nbsp;")
	  Response.Write("<a href='?Page=" & (Page-1) & "' class='list'>上一页</a>")

    end if
	response.write "&nbsp;&nbsp;"
    if page>=Rs.PageCount then
        Response.Write ("下一页")
		Response.Write("&nbsp;&nbsp;尾页")
    else
  		Response.Write("<a href='?Page=" & (Page+1) & "' class='list'>下一页</a>")
  		Response.Write("&nbsp;&nbsp;<a href='?Page=" & rs.pagecount & "' class='list'>尾页</a>")
    end if

%>]</span>
</td>
                            </tr>
                        </table></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          <td width="25%" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 3 * from news where  mytype=25 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
            <tr>
              <td height="160" align="center"><table border="0" style=" border:1px #CCCCCC solid" cellspacing="0" cellpadding="1">
                  <tr>
                    <td><a href="show.asp?id=<%= rs("id") %>" target="_blank"><img  src="<%= rs("tu") %>" width="167" height="120" border="0" alt="<%= rs("bt") %>"></a></td>
                  </tr>
                </table>
                <a href="show.asp?id=<%= rs("id") %>" target="_blank"><%= left(rs("bt"),15) %></a></td>
            </tr>
            <% 
		
			rs.movenext 
wend 
			 %>
          </table>
          <table cellspacing="0" cellpadding="0">
              <tr>
                <TD align="middle"></td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
		  <!-- 您现在的位置:始 -->
		  <TABLE WIDTH=383 BORDER=0 CELLPADDING=0 CELLSPACING=0>
            <tr>
              <td><a href="list.asp?tp=17" target="_blank"><IMG SRC="images/news.jpg" ALT="" WIDTH=383 HEIGHT=32 border="0"></a></td>
            </tr>
            <tr>
              <TD height="245" background="images/sqfb_2.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 10 * from news where  mytype=17 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                  <tr>
                    <td height="24">&nbsp;<font color="#DE0500">·</font> <a href="show.asp?id=<%=rs("id")%>" target="_blank">
                      <% If rs("color")<>"" Then %>
                      <font color="<%= rs("color") %>"><%=left(rs("bt"),23)%> (<%= rs("riqi") %>)</font>
                      <% Else %>
                      <font color="#DE0500"><%=left(rs("bt"),23)%> (<%= rs("riqi") %>)</font>
                      <% End If %>
                    </a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
              </table></td>
            </tr>
            <tr>
              <td><IMG SRC="images/sqfb_3.jpg" WIDTH=383 HEIGHT=7 ALT=""></td>
            </tr>
          </TABLE>
		  <!-- 您现在的位置:束 --></td>
          <td width="2"></td>
          <td>
		  <!--羲之故里开始 -->
		  <TABLE WIDTH=381 BORDER=0 CELLPADDING=0 CELLSPACING=0>
            <tr>
              <td><a href="list.asp?tp=21" target="_blank"><IMG SRC="images/xzgj_1.jpg" ALT="" WIDTH=381 HEIGHT=32 border="0"></a></td>
            </tr>
            <tr>
              <TD height="245" valign="top" background="images/xzgj_2.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
			                    <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 2 * from news where  mytype=21 order by id desc"
rs.open sql,conn,1 
if not rs.eof or bof then
while not rs.eof 
%>
               
                  <td height="149" align="center"><table border="0" style=" border:1px #CCCCCC solid" cellspacing="0" cellpadding="1">
                    <tr>
                      <td><a href="show.asp?id=<%= rs("id") %>" target="_blank"><img  src="<%= rs("tu") %>" width="160" height="128" border="0" alt="<%= rs("bt") %>"></a></td>
                    </tr>
                  </table></td>
                
				                  <% rs.movenext 
wend 
end if 
			 %></tr>
              </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <% set rs= Server.CreateObject("adodb.recordset")
sql="select top 4 * from news where  mytype=21 order by id desc"
rs.open sql,conn,1 
while not rs.eof 
%>
                  <tr>
                    <td height="24">&nbsp;<font color="#DE0500">·</font> <a href="show.asp?id=<%=rs("id")%>" target="_blank">
                      <% If rs("color")<>"" Then %>
                      <font color="<%= rs("color") %>"><%=left(rs("bt"),23)%> (<%= rs("riqi") %>)</font>
                      <% Else %>
                      <font color="#DE0500"><%=left(rs("bt"),23)%> (<%= rs("riqi") %>)</font>
                      <% End If %>
                    </a></td>
                  </tr>
                  <% rs.movenext 
wend 
			 %>
                </table></td>
            </tr>
            <tr>
              <td><IMG SRC="images/xzgj_3.jpg" WIDTH=381 HEIGHT=7 ALT=""></td>
            </tr>
          </TABLE>
		  <!--羲之故里结束 -->
		  </td>
        </tr>
      </table>
      <!--格线 -->
	  <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="3"></td>
        </tr>
      </table>
	  <!--格线 -->
	  <!--精彩活动开始 -->
	  <TABLE WIDTH=768 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<tr>
		<TD width="46"><a href="list.asp?tp=19" target="_blank"><IMG SRC="images/huodong_1.jpg" ALT="" WIDTH=46 HEIGHT=178 border="0"></a></td>
		<TD width="704" background="images/huodong_2.jpg" bgcolor="#FFFFFF"><!---代码开始--->
      <div id=demo style="overflow:hidden;width:703;border:0">
        <table  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td id=demo1><table cellpadding=0 cellspacing=0 bgcolor="">
                <tr>
                  <td valign=center>
				  <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><% set rs= Server.CreateObject("adodb.recordset")
sql="select top 20 * from news where  mytype=19 order by id desc"
rs.open sql,conn,1 
if not rs.eof or bof then
while not rs.eof 
%>
          
            <td height="149" align="center"><table border="0" cellspacing="0" cellpadding="1">
                <tr>
                  <td>&nbsp;&nbsp;</td>
                  <td style=" border:1px #CCCCCC solid"><a href="show.asp?id=<%= rs("id") %>" target="_blank"><img  src="<%= rs("tu") %>" width="160" height="120" border="0" alt="<%= rs("bt") %>"></a></td>
                </tr>
                <tr>
                  <td>&nbsp;&nbsp;</td>
                  <td align="center"><a href="show.asp?id=<%= rs("id") %>" target="_blank"><%= left(rs("bt"),12) %></a></td>
                </tr>
            </table></td>
          
          <% rs.movenext 
wend 
end if 
			 %></tr>
        </table></td></tr>
            </table></td>
            <td id=demo2 width="0"></td>
          </tr>
        </table>
      </div>
    <script>
 var speed=1// 您现在的位置:度越慢
 demo2.innerHTML=demo1.innerHTML
 function Marquee(){
 if(demo2.offsetWidth-demo.scrollLeft<=1)
 demo.scrollLeft-=demo1.offsetWidth
 else{
 demo.scrollLeft++
 }
 }
 var MyMar=setInterval(Marquee,speed)
 demo.onmouseover=function() {clearInterval(MyMar)}
 demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)}
 </script><!---代码结束---></td>
		<TD width="18">
			<IMG SRC="images/huodong_3.jpg" WIDTH=18 HEIGHT=178 ALT=""></td>
	</tr>
</TABLE>
      <!--格线开始 -->
	  <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="3"></td>
        </tr>
      </table>
	  
      
<!--#include file="link.asp" -->
	  
	  <!--格线开始 -->
      <table border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      </td>
  </tr>
</table>

<!--#include file="foot.asp" -->

</body>
</html>
