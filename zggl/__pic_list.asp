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
<meta name="author" content="huqingyu@gmail.com,��������" />
<meta name="copyright" content="seirsoft.com" />
<meta name="description" content="�й�����-CITS" />
<meta content="�й�����-CITS|�й�����" name="keywords" />
<title><%=title%>-<%=webname%>-pic-goods</title>
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/pic_goods.css" rel="stylesheet" />
head>
<body>
<!--#include file="top.asp" -->
<div id="J_page" class="w980 center">
<div style="border:1px solid #8CC363; background-color:#E7F5DD;padding:5px;margin:0 0 10px 0;line-height:20px">
<b>�����ڵ�λ��:</b><a href="index.asp">��ҳ</a> &gt;&gt; <%=title%>
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
		  
		  rs.pagesize=16'ÿҳ��ʾ������
          pagecount=rs.pagecount '��ҳ��
		  
		     if rs.bof and rs.eof then
              response.write ""
              else
					 
              page=clng(request.querystring("page"))
              if page<1 then page=1
              if page>rs.pagecount then page=rs.pagecount
              rs.absolutepage=page  '��������ҳ
  
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
			<div><%= rs("price")%>Ԫ</div>
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
			<span style="color:#666666">[��<%=rs.pagecount%>ҳ&nbsp;��ǰ��<%=page%>ҳ&nbsp;<%
	if page<=1 then
	   Response.Write("��ҳ&nbsp;&nbsp;")
       Response.Write ("��һҳ")
    else
	  Response.Write("<a href='?tp="&tp&"&Page=1' class='list'>��ҳ</a>&nbsp;&nbsp;")
	  Response.Write("<a href='?tp="&tp&"&Page=" & (Page-1) & "' class='list'>��һҳ</a>")

    end if
	response.write "&nbsp;&nbsp;"
    if page>=Rs.PageCount then
        Response.Write ("��һҳ")
		Response.Write("&nbsp;&nbsp;βҳ")
    else
  		Response.Write("<a href='?tp="&tp&"&Page=" & (Page+1) & "' class='list'>��һҳ</a>")
  		Response.Write("&nbsp;&nbsp;<a href='?tp="&tp&"&Page=" & rs.pagecount & "' class='list'>βҳ</a>")
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
