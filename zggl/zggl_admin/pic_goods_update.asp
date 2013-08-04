<!--#include file="admin_common/conn.asp"-->
<% 

if request("wang")="up" then 
bt=request("bt")
nr=request("nr")
lei=request("lei")
tu=request("tu")
zz=request("zz")
price=request("price")
set rs= Server.CreateObject("adodb.recordset")
sql="select * from pic_goods where id="&request("id")
rs.open sql,conn,1,3
rs("bt")=bt
rs("mytype")=lei
rs("nr")=nr
rs("tu")=tu
rs("zz")=zz
rs("price")=price
rs.update
response.Redirect("pic_goods_list.asp")
else 
id=request("id")
set rs= Server.CreateObject("adodb.recordset")
sql="select * from pic_goods where id="&id
rs.open sql,conn,1,3
end if
nlei = rs("mytype")

 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<br />
<script>
function openScript(url, width, height){
	window.open(url,"openScript",'width=' + width + ',height=' + height + ',left=450,top=300,resizable=1,scrollbars=no,menubar=no,status=no' );
}
function openem()
{ 
openScript('upload.asp?UP=admin&amp;formname=form1&amp;editname=tu&amp;uppath=bookpic&amp;filelx=jpg',300,100); 
}
</script>
<form id="form1" name="form1" method="post" action="pic_goods_update.asp?wang=up">
  <table width="80%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#aaaaFF">
    <tr>
      <td height="28" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font class="STYLE1">修改</font>
	  	  <%
	  if nlei = 73 then    
		Response.Write("高尔夫")
	  elseif nlei = 82 then    
		Response.Write("租车")
	  elseif nlei = 75 then    
		Response.Write("会议")
	  else
		response.Redirect("pic_goods_list.asp")
	  end if
	  %>
	  
	  </b></td>
    </tr>
    <tr>
      <td align="right">名称</td>
      <td>&nbsp;&nbsp;
        <input name="bt" type="text" size="50" value="<%= rs("bt") %>" />
        </td>
    </tr>
    <tr>
      <td align="right">价格</td>
      <td>&nbsp;&nbsp;
        <input name="price" type="text" size="50" value="<%= rs("price") %>" />
        </td>
    </tr>
	<tr>
      <td align="right">图片</td>
      <td>&nbsp;&nbsp; <input name="tu" type="text" id="tu" value="<%= rs("tu") %>" size="50" />
      &nbsp; <input class="button" type="button" name="Submit22" value="上传图片" onclick="openem()" /></td>
    </tr>
    <tr>
      <td align="right">内容</td>
      <td>&nbsp;
      <textarea name="nr" style="display:none" id="nr"><%= rs("nr") %></textarea>
      <iframe id="eWebEditor1" src="ubb/xwebeditor.asp?id=nr&amp;style=standard_coolblue1" frameborder="0" scrolling="No" width="600" height="400"></iframe></td>
    </tr>
    <tr>
      <td align="right">作者</td>
      <td>&nbsp; <input name="zz" type="text" id="zz" value="<%= rs("zz") %>" /></td>
    </tr>
    <tr>
      <td height="26" colspan="2" align="center">
	  
		<input type="submit" name="Submit" value="保  存" />
        &nbsp;&nbsp;&nbsp; 
		<input type="reset" name="Submit2" value="重  写" />
		
		<input name="id" type="hidden" id="id" value="<%= rs("id") %>" />
        <input name="lei" type="hidden" size="50" value="<%= rs("mytype") %>" />
        </td>
    </tr>
  </table>
</form>
</body>
</html>
