<!--#include file="admin_common/conn.asp"-->
<% 
dim nlei
nlei = request("lei")

if request("wang")="add" then 
	bt=request("bt")
	nr=request("nr")
	lei=request("lei")
	tu=request("tu")
	zz=request("zz")
	price=request("price")

	set rs= Server.CreateObject("adodb.recordset")
	sql="select * from pic_goods"
	rs.open sql,conn,1,3
	rs.addnew
	rs("bt")=bt
	rs("mytype")=lei
	rs("nr")=nr
	rs("tu")=tu
	rs("zz")=zz
	rs("price")=price
	
	rs.update
	response.Redirect("pic_goods_list.asp?lei="+lei)
end if 
if request("del")<>"" then 
	id=request("del")
	conn.execute("delete from pic_goods where id="&id)
	response.Redirect("pic_goods_list.asp")
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
<br />
<form id="form1" name="form1" method="post" action="pic_goods.asp?wang=add">
  <table border="0" align="center" cellpadding="1" cellspacing="1">
    <tr>
      <td height="28" colspan="2" align="center" background="images/admin_bg_1.gif"><b><font class="STYLE1">添加</font>
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
	  </b>
	  <input name='lei' type='hidden' value="<%=nlei%>" />
	  </td>
    </tr>
    <tr>
      <td width="12%" height="28" align="center">名称</td>
      <td width="88%">&nbsp;&nbsp;
        <input name="bt" type="text" id="bt" size="50" />
      </td>
    </tr>
    <tr>
      <td height="25" align="center">价格</td>
      <td>&nbsp; <input name="price" type="text" />元</td>
    </tr>
    <tr>
      <td height="28" align="center">图片</td>
      <td>&nbsp;&nbsp; <input name="tu" type="text" id="tu" size="50" />
        &nbsp; <input class="button" type="button" name="Submit22" value="上传图片" onclick="window.open('../Up_BookPic.asp?formname=form1&amp;editname=tu&amp;uppath=bookpic&amp;filelx=jpg','','status=no,scrollbars=no,top=20,left=110,width=420,height=165')" /></td>
    </tr>
    <tr>
      <td height="25" align="center">备注</td>
      <td>&nbsp;
      <input name="nr" type="hidden" id="nr" />
      <iframe id="xWebEditor1" src="ubb/xwebeditor.asp?id=nr&amp;style=standard_coolblue1" frameborder="0" scrolling="No" width="600" height="400"></iframe></td>
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
