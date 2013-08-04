<!--#include file="common/conn.asp"-->
<!--#include file="common/WebConfig.asp"-->
<!--#include file="common/config.asp"-->
<%
if isNull(tp) then
tp=request("tp")
end if
title = GetNewsTitle(tp)
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<meta name="author" content="huqingyu@gmail.com,浙林龙哥" />
<meta name="copyright" content="seirsoft.com" />
<meta name="description" content="中国国旅-CITS" />
<meta content="中国国旅-CITS|中国国旅" name="keywords" />
<title><%=title%>-<%=webname%>-pic-goods</title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/pic_goods.css" rel="stylesheet" />
head>
<body>
<!--#include file="top.asp" -->
<div id="J_page" class="w980 center">
<div style="border:1px solid #8CC363; background-color:#E7F5DD;padding:5px;margin:0 0 10px 0;line-height:20px">
<b>您现在的位置:</b><a href="index.asp">首页</a> &gt;&gt; <%=title%>
</div>
<table width="980" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="780" align="center" valign="top">

	<br /><div style="text-align:center"><h1><%=title%></h1></div>

		<ul class="pic_goods_ul">
		<%
 		  set rs=server.createobject("adodb.recordset") 
		  sql="select * from pic_goods where mytype="&tp&"  order  by id desc"
		  rs.open sql,conn,1
		  
		  rs.pagesize=16'每页显示多少条
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
		  <li>
			<div>
			<a href="__pic_goods_show.asp?id=<%=rs("id")%>" target="_blank">
			
			<%
				if rs("tu") <> "" then
					Response.Write("<img src='" +rs("tu")+ "' width='150px' height='150px' />")
				else
					Response.Write("<img src='image/blank.gif' width='150px' height='150px' />")
				end if
			%>
			<br />
			<%= left(rs("bt"),34)%>
			</a>
			<div><%= rs("price")%>元</div>
			</div>
		  </li>
		<% 
         rs.movenext
         if rs.eof then exit for 
         next
         end if 
         %>
		</ul>
						
		<table width="95%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td height="22" align="center">&nbsp;&nbsp;&nbsp;&nbsp;
			<span style="color:#666666">[共<%=rs.pagecount%>页&nbsp;当前第<%=page%>页&nbsp;<%
	if page<=1 then
	   Response.Write("首页&nbsp;&nbsp;")
       Response.Write ("上一页")
    else
	  Response.Write("<a href='?tp="&tp&"&Page=1' class='list'>首页</a>&nbsp;&nbsp;")
	  Response.Write("<a href='?tp="&tp&"&Page=" & (Page-1) & "' class='list'>上一页</a>")

    end if
	response.write "&nbsp;&nbsp;"
    if page>=Rs.PageCount then
        Response.Write ("下一页")
		Response.Write("&nbsp;&nbsp;尾页")
    else
  		Response.Write("<a href='?tp="&tp&"&Page=" & (Page+1) & "' class='list'>下一页</a>")
  		Response.Write("&nbsp;&nbsp;<a href='?tp="&tp&"&Page=" & rs.pagecount & "' class='list'>尾页</a>")
    end if

%>]</span></td>
				</tr>
			</table>

	</td>
    <td width="200" valign="top">
	<!--#include file="right_i.asp" -->
	</td>
  </tr>
</table>

<!--#include file="foot.asp" -->
</div>

<script src="js/js.js"></script>
</body>
</html>
