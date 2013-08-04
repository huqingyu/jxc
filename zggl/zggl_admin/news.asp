<!--#include file="admin_common/conn.asp"-->
<% 
dim nlei
nlei = request("lei")

if request("wang")="add" then 
	bt=request("bt")
	nr=request("nr")
	lei=request("lei")
	tu=request("tu")
	ly=request("ly")
	zz=request("zz")

	color=request("color")
	set rs= Server.CreateObject("adodb.recordset")
	sql="select * from news"
	rs.open sql,conn,1,3
	rs.addnew
	rs("bt")=bt
	rs("mytype")=lei
	rs("nr")=nr
	rs("tu")=tu
	rs("ly")=ly
	rs("zz")=zz

	rs("color")=color
	rs.update
	response.Redirect("news_list.asp?lei="+lei)
end if 
if request("del")<>"" then 
	id=request("del")
	conn.execute("delete from news where id="&id)
	response.Redirect("news_list.asp")
end if 
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<form id="form1" name="form1" method="post" action="news.asp?wang=add">
  <table border="0" align="center" cellpadding="1" cellspacing="1" bgColor="#aaccff">
    <tr>
      <td height="28" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font class="STYLE1">添加</font>
	  <%
	  if nlei = 63 then			
	  Response.Write("公告")
	  elseif nlei = 64 then    
	  Response.Write("新闻")
	  elseif nlei = 73 then    
	  Response.Write("高尔夫")
	  elseif nlei = 82 then    
	  Response.Write("租车")
	  elseif nlei = 75 then    
	  Response.Write("会议")
	  elseif nlei = 66 then    
	  Response.Write("签证")
	  elseif nlei = 76 then    
	  Response.Write("常识")
	  end if
	  %>
	  
	  </b></td>
    </tr>
    <tr>
      <td width="12%" height="28" align="center">标题</td>
      <td width="88%">&nbsp;&nbsp;
        <input name="bt" type="text" id="bt" size="50" />
        &nbsp; <select name='Color' id='Color'>
          <option value='' selected="selected">颜色</option>
          <option value=''>默认</option>
          <option value='#000' style='background-color:#000'></option>
          <option value='#FFF' style='background-color:#FFF'></option>
          <option value='#008000' style='background-color:#008000'></option>
          <option value='#800000' style='background-color:#800000'></option>
          <option value='#808000' style='background-color:#808000'></option>
          <option value='#000080' style='background-color:#000080'></option>
          <option value='#800080' style='background-color:#800080'></option>
          <option value='#808080' style='background-color:#808080'></option>
          <option value='#FFFF00' style='background-color:#FFFF00'></option>
          <option value='#00FF00' style='background-color:#00FF00'></option>
          <option value='#00FFFF' style='background-color:#00FFFF'></option>
          <option value='#FF00FF' style='background-color:#FF00FF'></option>
          <option value='#FF0000' style='background-color:#FF0000'></option>
          <option value='#0000FF' style='background-color:#0000FF'></option>
          <option value='#008080' style='background-color:#008080'></option>
        </select></td>
    </tr>
    <tr>
      <td height="28" align="center">图片</td>
      <td>&nbsp;&nbsp; <input name="tu" type="text" id="tu" size="50" />
        &nbsp; <input class="button" type="button" name="Submit22" value="上传图片" onclick="window.open('../Up_BookPic.asp?formname=form1&amp;editname=tu&amp;uppath=bookpic&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" /></td>
    </tr>
<%
if nlei <> "" then
	Response.Write("<tr><td></td><td><input name='lei' type='hidden' value='" +nlei+ "' /></td></tr>")
else
%>
    <tr>
      <td height="28" align="center">分类</td>
      <td>&nbsp;&nbsp;
        <select name="lei" id="lei">
          <% 
	set rs= Server.CreateObject("adodb.recordset") 
	sql="select * from nlei "
	rs.open sql,conn,1,3
	while not rs.eof 
%>
          <option value="<%= rs("id") %>"><%= rs("nlei") %></option>
          <% rs.movenext 
  wend  
%>
        </select></td>
    </tr>
<%
end if
%>
    <tr>
      <td height="25" align="center">内容</td>
      <td>&nbsp;
      <input name="nr" type="hidden" id="nr" />
      <iframe id="xWebEditor1" src="ubb/xwebeditor.asp?id=nr&amp;style=standard_coolblue1" frameborder="0" scrolling="No" width="600" height="400"></iframe></td>
    </tr>
    <tr>
      <td height="25" align="center">来源</td>
      <td>&nbsp; <input name="ly" type="text" id="ly" /></td>
    </tr>
    <tr>
      <td height="25" align="center">作者</td>
      <td>&nbsp; <input name="zz" type="text" id="zz" /></td>
    </tr>
    <tr>
      <td height="26" colspan="2" align="center"><input type="submit" name="Submit" value="保 存" />
        &nbsp;&nbsp;&nbsp; 
        <input type="reset" name="Submit2" value="重  写" /></td>
    </tr>
  </table>
</form>
</body>
</html>
