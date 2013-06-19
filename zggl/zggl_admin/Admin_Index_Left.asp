
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>管理导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type=text/css>
body  {
	background:url(images/admin_bg_1.gif);
	margin:0px;
	font:9pt 宋体;
	FONT-SIZE: 9pt;
	text-decoration: none;
	SCROLLBAR-FACE-COLOR: #eaeaea;
	SCROLLBAR-HIGHLIGHT-COLOR: #FFF;
	SCROLLBAR-SHADOW-COLOR: #b9b9b9;
	SCROLLBAR-3DLIGHT-COLOR: #b9b9b9;
	SCROLLBAR-ARROW-COLOR: #666666;
	SCROLLBAR-TRACK-COLOR: #eaeaea;
	SCROLLBAR-DARKSHADOW-COLOR: #FFF;
}
table  { border:0px; }
td  { font:normal 12px 宋体; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#cc0000;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#EAEAEA; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#505050; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#FF6600; font-weight:bold; }
</style>
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display='';");
}
else
{
eval("submenu" + sid + ".style.display='none';");
}
}
</SCRIPT>
</head>
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<tr><td valign=top>
<table width=158 border="0" align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=42 valign=bottom>
	  <img src="Images/title.gif" width=158 height=38>
    </td>
  </tr>
</table>


<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=130>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>                                                                                          
</body>
</html>