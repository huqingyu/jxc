
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
if request.QueryString("action")="del" then
conn.execute "delete from news where id in ("&request("selectdel")&")"
response.Redirect  "editnews.asp"
end if
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<%
if request.QueryString("action")="save" then 
mb_news_show=Request.Form("mb_news_show")
aa="http://"&Request.ServerVariables("server_name")&Request.ServerVariables("path_info")
aa= mid(aa,1,len(aa)-18)
content=replace(mb_news_show,aa,"")
session("mb_news_show")=mb_news_show
set rs=server.CreateObject("adodb.recordset")
rs.open ("select mb_news_show from mb"),conn,1,3
rs("mb_news_show")=mb_news_show
rs.update
rs.close
set rs=nothing
session("content")=""
response.write "<script>alert('更改成功！');window.location.href='Admin_mb.asp';</script>"
response.End
end if
%>
<table border="0" align="center" cellpadding="0" cellspacing="0">
<form name="form" method="post" action="Html_News.asp?action=save" onReset="return ResetForm();">
<tr>
    <td height="47" colspan="2"><div align="center"><b><font color="red">新闻内容页模板(html)</font></b></div></td>
  </tr>
  <tr>
    <td height="47" colspan="2"><div align="center"><font color="088000"><br />
          注: 网站名称(WebName); 管理邮件(WebEmail); 地址(Dizhi); 邮编(YouBian); 电话(DianHua);<br />
          <br />
          版权(Copyright); 网站标志(WebLogo); 网站banner(WebBanner); 网站地址(WebUrl); 网站公告(Gonggao)<br />
          <br />
          最新酒店信息(Left_Hotel_Top); 最新线路信息(Left_Xl_Top); 网络调查(Left_View_Top)<br />
          <br />
          新闻内容(NewsInfo); 新闻标题(NewsTitle); 发布人(NewsAdmin); 发布时间(NewsTime)<br />
          <br />
    </font></div></td>
  </tr>
  <tr>
    <td height="500" colspan="2"><div align="center">
<% set rs=server.createobject("adodb.recordset")
rs.open ("select mb_news_show from mb"),conn,1,1
%><textarea name="mb_news_show" cols="90" rows="48"><%=rs("mb_news_show")%></textarea>
<% rs.close %></div></td>
  </tr>
  <tr>
    <td width="50%" height="35"><div align="center">
      <input type="submit" name="Submit" value="提交修改">
    </div></td>
    <td width="50%"><div align="center">
      <input type="reset" name="Submit2" value="取消修改">
    </div></td>
  </tr>
</form>
</table>
<br />
</body>
</html>
