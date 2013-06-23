<!--#include file="newsadmin/pass.asp" -->
<%
uppath=request("uppath")&"/"		'文件上传路径
filelx=request("filelx")				'文件上传类型
formName=request("formName")			' 您现在的位置:辑框所在Form的Name
EditName=request("EditName")			' 您现在的位置:辑框的Name
%>
<!DOCTYPE HTML>
<html>
<head>
<title>图片上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/common.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />

<script>
function InputChange(oInput)
{
	var disp = 0;
	var s = oInput.value;
	var ext;
	if (s.length<5)
		return;
	ext = s.substr(s.length-3,3).toLowerCase();
	if (ext=="jpg" || ext=="gif" || ext=="bmp" || ext=="png" || ext=="tif")
	{
		if (document.all){
			window.resizeTo(450,500);
		}
		document.getElementById("t_preview").style.display = "";
		document.getElementById("i_preview").src = s;
	}else{
		if (document.all){
			window.resizeTo(450,500);
		}
		document.getElementById("t_preview").style.display = "none";
	}
}

function InsertWbtbFlash(file)
{
	var fst = document.getElementById("swfFst").value;
	var str;
	if (fst==""){
		str ="<center><object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='480' height='360'><param name='movie' value='"+ file +"'/><param name='quality' value='high'/><param name='play' value='-1'><embed src='"+ file +"' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' quality='high' width='480' height='360'></embed></object></center>";
	}else{
		str ="<table align='center'><tr><td align='center'><object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' width='480' height='360'><param name='movie' value='"+ file +"'/><param name='quality' value='high'/><param name='play' value='-1'><embed src='"+ file +"' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' quality='high' width='480' height='360'></embed></object><br/><br/><a href='"+ file +"'>"+ fst +"</a></td></tr></table>";
	}
	opener.WBTB_InsertHtml(str);
}

</script>
<script language="javascript">
<!--
function mysub()
{
		esave.style.visibility="visible";
}
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="up_BookPicPro.asp" enctype="multipart/form-data" >
  <div id="esave" style="position:absolute; top:18px; left:40px; z-index:10; visibility:hidden"> 
    <TABLE WIDTH=340 BORDER=0 CELLSPACING=0 CELLPADDING=0>
      <tr><td width=20%></td>
	<TD bgcolor=#104A7B width="60%"> 
	<TABLE WIDTH=100% height=120 BORDER=0 CELLSPACING=1 CELLPADDING=0>
	<tr> 
	          <td bgcolor=#eeeeee align=center><font color=red> 您现在的位置:请稍候...</font></td>
	</tr>
	</table>
	</td><td width=20%></td>
	</tr></table></div>
  <table width="400" border="0" align="center" cellpadding="3" cellspacing="1" bordercolorlight="#FFCC00" bordercolordark="#FFCC00" bgcolor="#5E86D7">
    <tr bgcolor="#FFCC00"> 
      <td width="400" height="29" align="left" valign="middle" background="admin/images/admin_bg_1.gif" >&nbsp;<strong><font color="#FFFFFF">图片上传</font></strong> 
        <input type="hidden" name="filepath" value="<%=uppath%>">
        <input type="hidden" name="filelx" value="<%=filelx%>">
        <input type="hidden" name="EditName" value="<%=EditName%>">
        <input type="hidden" name="FormName" value="<%=formName%>">
      <input type="hidden" name="act" value="uploadfile">      </td>
    </tr>
    <tr align="center" valign="middle"> 
      <td width="400" height="88" align="left" bgcolor="#FFFFFF" id="upid"> 选择文件: 
      <input type="file" name="file1" style="width:300'" class="tx1"  onchange="InputChange(this);"   >      </td>
    </tr>
    <tr align="center" valign="middle" bgcolor="#eeeeee"> 
      <td bgcolor="#5580D5" height="24" width="400"> 
      <input type="submit" name="Submit" value="·开始上传·" onClick="javascript:mysub()"> 
      &nbsp;</td>
    </tr>
    <tr align="center" valign="middle" bgcolor="#eeeeee">
      <td bgcolor="#5580D5" height="24"></td>
    </tr>
  </table>
<table width="300" id="t_preview" style="display:none" align="center"><tr><td align="center">
<img id="i_preview" src="" width="1" onload="this.width='300'" alt="preview"/>
</td></tr></table>
</form>
</body>
</html>
