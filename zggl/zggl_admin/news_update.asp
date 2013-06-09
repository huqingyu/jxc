<!--#include file="admin_common/conn.asp"-->
<% if request("wang")="up" then 
bt=request("bt")
nr=request("nr")
lei=request("lei")
tu=request("tu")
ly=request("ly")
zz=request("zz")
lls=request("lls")
color=request("color")
set rs= Server.CreateObject("adodb.recordset")
sql="select * from news where id="&request("id")
rs.open sql,conn,1,3
rs("bt")=bt
rs("mytype")=lei
rs("nr")=nr
rs("tu")=tu
rs("ly")=ly
rs("zz")=zz
rs("lls")=lls
rs("color")=color
rs.update
response.Redirect("news_list.asp")
else 
id=request("id")
set rs= Server.CreateObject("adodb.recordset")
sql="select * from news where id="&id
rs.open sql,conn,1,3
end if 
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<title>后台管理 - by seirsoft.com</title>
<link href="css/news.css" rel="stylesheet" />
</head>
<body>
<form id="form1" name="form1" method="post" action="news_update.asp?wang=up">
  <table width="93%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#5580D5">
    <tr>
      <td height="28" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font color="#FFF">文章修改</font></b></td>
    </tr>
    <tr>
      <td width="12%" height="28" align="center">文章标题</td>
      <td width="88%">&nbsp;&nbsp;
        <input name="bt" type="text" id="bt" size="50" value="<%= rs("bt") %>" />
        &nbsp;&nbsp; <select name='Color' id='Color'>
          <option value=''>默认</option>
          <option value='#000' <% If rs("color")="#000" Then %>selected="selected"<% End If %> style='background-color:#000'></option>
          <option value='#FFF' <% If rs("color")="#FFF" Then %>selected="selected"<% End If %> style='background-color:#FFF'></option>
          <option value='#008000' <% If rs("color")="#008000" Then %>selected="selected"<% End If %> style='background-color:#008000'></option>
          <option value='#800000' <% If rs("color")="#800000" Then %>selected="selected"<% End If %> style='background-color:#800000'></option>
          <option value='#808000' <% If rs("color")="#808000" Then %>selected="selected"<% End If %>  style='background-color:#808000'></option>
          <option value='#000080' <% If rs("color")="#000080" Then %>selected="selected"<% End If %> style='background-color:#000080'></option>
          <option value='#800080' <% If rs("color")="#800080" Then %>selected="selected"<% End If %> style='background-color:#800080'></option>
          <option value='#808080' <% If rs("color")="#808080" Then %>selected="selected"<% End If %> style='background-color:#808080'></option>
          <option value='#FFFF00' <% If rs("color")="#FFFF00" Then %>selected="selected"<% End If %> style='background-color:#FFFF00'></option>
          <option value='#00FF00' <% If rs("color")="#00FF00" Then %>selected="selected"<% End If %> style='background-color:#00FF00'></option>
          <option value='#00FFFF' <% If rs("color")="#00FFFF" Then %>selected="selected"<% End If %> style='background-color:#00FFFF'></option>
          <option value='#FF00FF' <% If rs("color")="#FF00FF" Then %>selected="selected"<% End If %> style='background-color:#FF00FF'></option>
          <option value='#FF0000' <% If rs("color")="#FF0000" Then %>selected="selected"<% End If %> style='background-color:#FF0000'></option>
          <option value='#0000FF' <% If rs("color")="#0000FF" Then %>selected="selected"<% End If %> style='background-color:#0000FF'></option>
          <option value='#008080' <% If rs("color")="#008080" Then %>selected="selected"<% End If %> style='background-color:#008080'></option>
        </select></td>
    </tr>
	  <tr>
      <td height="28" align="center">图片</td>
      <td>&nbsp;&nbsp; <input name="tu" type="text" id="tu" value="<%= rs("tu") %>" size="50" />
      &nbsp; <input class="button" type="button" name="Submit22" value="上传图片" onclick="window.open('../Up_BookPic.asp?formname=form1&amp;editname=tu&amp;uppath=bookpic&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" /></td>
    </tr>
    <tr>
      <td height="28" align="center">文章分类</td>
      <td>&nbsp;
        <select name="lei" id="lei">
          <% set rs1= Server.CreateObject("adodb.recordset") 
sql1="select * from nlei "
rs1.open sql1,conn,1,3
while not rs1.eof 
 %>
          <option value="<%= rs1("id") %>" <% if  rs1("id")=rs("mytype") then   %> selected="selected"<% end if %>  ><%= rs1("nlei") %></option>
          <% rs1.movenext 
           wend  %>
        </select></td>
    </tr>
    <tr>
      <td height="25" align="center">文章内容</td>
      <td>&nbsp;
      <textarea name="nr" style="display:none" id="nr"><%= rs("nr") %></textarea>
      <iframe id="eWebEditor1" src="ubb/xwebeditor.asp?id=nr&amp;style=standard_coolblue1" frameborder="0" scrolling="No" width="600" height="400"></iframe></td>
    </tr>
	    <tr>
      <td height="25" align="center">文章来源</td>
      <td>&nbsp; <input name="ly" type="text" id="ly" value="<%= rs("ly") %>" /></td>
    </tr>
    <tr>
      <td height="25" align="center">文章作者</td>
      <td>&nbsp; <input name="zz" type="text" id="zz" value="<%= rs("zz") %>" /></td>
    </tr>
	<tr>
      <td height="25" align="center">点击率</td>
      <td>&nbsp; <input name="lls" type="text" id="lls" value="<%= rs("lls") %>" /></td>
    </tr>
    <tr>
      <td height="26" colspan="2" align="center"><input type="submit" name="Submit" value="保  存" />
        &nbsp;&nbsp;&nbsp; 
		<input name="id" type="hidden" id="id" value="<%= rs("id") %>" />
        <input type="reset" name="Submit2" value="重  写" /></td>
    </tr>
  </table>
</form>
</body>
</html>
