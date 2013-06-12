
<!--#include file="admin_check_permission.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta name=vs_targetSchema content="HTML 4.0">
<title>添加旅游线路</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<script language="JavaScript">
<!--
function CheckForm()
{
	if (document.myform.d_name2.value.length == 0)
 {
		alert("请输入用户名!");
		document.myform.d_name2.focus();
		return false;
	}
	if (document.myform.add2.value.length == 0)
 {
		alert("请输入导游联系地址!");
		document.myform.add2.focus();
		return false;
	}		
	if (document.myform.tel2.value.length == 0)
 {
		alert("请输入导游联系电话!");
		document.myform.tel2.focus();
		return false;
	}		
			if (document.myform.nianling2.value.length == 0)
 {
		alert("请输入导游的年龄!.");
		document.myform.nianling2.focus();
		return false;
	}		
			if (document.myform.mail2.value.length == 0)
 {
		alert("请输入导游的E-MAIL!.");
		document.myform.mail2.focus();
		return false;
	}		
			if (document.myform.info2.value.length == 0)
 {
		alert("请输入导游的信息!");
		document.myform.info2.focus();
		return false;
	}		
		return true;
}
///onSubmit="return CheckForm();"
//-->
</script>
<script language="JavaScript">
var sAction = "INSERT";
var sTitle = "插入";

var oControl;
var oSeletion;
var sRangeType;

var sFromUrl = "";
var sAlt = "";
var sBorder = "0";
var sBorderColor = "#000000";
var sFilter = "";
var sAlign = "";
var sWidth = "";
var sHeight = "";
var sVSpace = "";
var sHSpace = "";

var sCheckFlag = "file";

oSelection = dialogArguments.Editor.document.selection.createRange();
sRangeType = dialogArguments.Editor.document.selection.type;

if (sRangeType == "Control") {
	if (oSelection.item(0).tagName == "IMG"){
		sAction = "MODI";
		sTitle = "修改";
		sCheckFlag = "url";
		oControl = oSelection.item(0);
		sFromUrl = oControl.src;
		sAlt = oControl.alt;
		sBorder = oControl.border;
		sBorderColor = oControl.style.borderColor;
		sFilter = oControl.style.filter;
		sAlign = oControl.align;
		sWidth = oControl.width;
		sHeight = oControl.height;
		sVSpace = oControl.vspace;
		sHSpace = oControl.hspace;
	}
}

document.write("<title>图片属性（" + sTitle + "）</title>");

// 初始值
function InitDocument(){
	SearchSelectValue(d_filter, sFilter);
	SearchSelectValue(d_align, sAlign.toLowerCase());

	d_fromurl.value = sFromUrl;
	d_alt.value = sAlt;
	d_border.value = sBorder;
	d_bordercolor.value = sBorderColor;
	s_bordercolor.style.backgroundColor = sBorderColor;
	d_width.value = sWidth;
	d_height.value = sHeight;
	d_vspace.value = sVSpace;
	d_hspace.value = sHSpace;
}

// 本窗口返回值
function ReturnValue(){
	sFromUrl = d_fromurl.value;
	sAlt = d_alt.value;
	sBorder = d_border.value;
	sBorderColor = d_bordercolor.value;
	sFilter = d_filter.value;
	sAlign = d_align.value;
	sWidth = d_width.value;
	sHeight = d_height.value;
	sVSpace = d_vspace.value;
	sHSpace = d_hspace.value;

	if (sAction == "MODI") {
		oControl.src = sFromUrl;
		oControl.alt = sAlt;
		oControl.border = sBorder;
		oControl.style.borderColor = sBorderColor;
		oControl.style.filter = sFilter;
		oControl.align = sAlign;
		oControl.width = sWidth;
		oControl.height = sHeight;
		oControl.vspace = sVSpace;
		oControl.hspace = sHSpace;
	}else{
		var sHTML = '<img src="'+sFromUrl+'" alt="'+sAlt+'" border="'+sBorder+'" style="filter:'+sFilter+';border-color:'+sBorderColor+'" align="'+sAlign+'"';
		if (sWidth!=""){
			sHTML=sHTML+' width="'+sWidth+'"';
		}
		if (sHeight!=""){
			sHTML=sHTML+' height="'+sHeight+'"';
		}
		sHTML = sHTML+' vspace="'+sVSpace+'" hspace="'+sHSpace+'">';
		dialogArguments.insertHTML(sHTML);
	}

	window.returnValue = null;
	window.close();
}

// 点确定时执行
function ok(){
	// 数字型输入的有效性
	d_border.value = ToInt(d_border.value);
	d_width.value = ToInt(d_width.value);
	d_height.value = ToInt(d_height.value);
	d_vspace.value = ToInt(d_vspace.value);
	d_hspace.value = ToInt(d_hspace.value);
	// 边框颜色的有效性
	if (!IsColor(d_bordercolor.value)){
		BaseAlert(d_bordercolor,'提示：\n\n无效的边框颜色值！');
		return false;
	}
	ReturnValue();
}
function openScript(url, width, height){
	var Win = window.open(url,"openScript",'width=' + width + ',height=' + height + ',left=450,top=300,resizable=1,scrollbars=no,menubar=no,status=no' );
}
function openem()
{ 
openScript('upload.asp?UP=admin',300,100); 
}
</script>
<body onload="InitDocument()">
<form action="add_daoyou_ok.asp" method="post" name="myform">
<br /><br /><br />
  <table width="65%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#999999" borderColorDark=#FFF bgcolor="#F9F9F9">
    <tr> 
      <td height="35" colspan="3" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>添加导游</b></font></div></td>
    </tr>
    <tr>
      <td width="207" height="25" align="right" bgcolor="#ebebeb">姓名：&nbsp;</td>
      <td colspan="2"><input name="d_name2" type="text" id="d_name2"></td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">性别：&nbsp;</td>
      <td colspan="2"> 
        <select name="sex2" id="sex2">
          <option value="1" selected>男</option>
          <option value="0">女</option>
        </select>
</td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">年龄：&nbsp;</td>
      <td colspan="2"> 
        <input name="nianling2" type="text" id="nianling2">
      </td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">等级：&nbsp;</td>
      <td width="293"><select name="vip2" id="vip2">
        <option value="1" selected>普通会员</option>
        <option value="2">高级会员</option>
        <option value="3">铂金会员</option>
      </select></td>
      <td width="124"><div align="center">
        <select name="tuijian2" id="tuijian2">
            <option value="0" selected>不需推荐</option>
            <option value="1">需要推荐</option>
        </select>
      </div></td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">民族：&nbsp;</td>
      <td colspan="2"><select name="mingzu2" id="mingzu2">
        <option value="a" selected>汉</option>
        <option value="b">回</option>
        <option value="c">彝</option>
        <option value="d">维</option>
        <option value="e">哈</option>
        <option value="f">蒙</option>
        <option value="未知">未知</option>
      </select></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">联系电话：&nbsp;</td>
      <td colspan="2"><input name="tel2" type="text" id="tel2"></td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">联系地址：&nbsp;</td>
      <td colspan="2"><input name="add2" type="text" id="add2"> 
      </td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">E-mail：&nbsp;</td>
      <td colspan="2"><input name="mail2" type="text" id="mail2"> 
      </td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">其它联系方式：&nbsp;</td>
      <td colspan="2"> 
        <input name="lianxi2" type="text" id="lianxi2" value="">
      </td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">擅长线路：&nbsp;</td>
      <td colspan="2"><input name="xianlu2" type="text" id="xianlu2" size="50"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">掌握语言：&nbsp;</td>
      <td colspan="2"><input name="lang2" type="text" id="lang2" size="50"></td>
    </tr>
    <tr> 
      <td height="90" align="right" bgcolor="#ebebeb">介绍：&nbsp;</td>
      <td height="90" colspan="2"> 
        <textarea name="info2" cols="50" rows="5" id="info2"></textarea>
      </td>
    </tr>
    <tr> 
      <td height="90" align="right" bgcolor="#ebebeb">备注：&nbsp;</td>
      <td height="90" colspan="2"> 
        <textarea name="back2" cols="50" rows="5" id="back2"></textarea>
      </td>
    </tr>
    <tr> 
      <td height="11" align="right" bgcolor="#ebebeb">照片：(缩略图)&nbsp;</td>
      <td height="11" valign="middle"> 
        <input name="img2" type="text" id="img2" size="30">
        120*130		</td>
      <td valign="middle"><div align="center">
        <input type="button" name="Button" class="button01-out" value="浏 览" onClick="JavaScript:openem()">
      </div></td>
    </tr>
    <tr>
      <td height="12" align="right" bgcolor="#ebebeb">照片：(生活照)&nbsp;</td>
      <td height="12" valign="middle"><input name="poho2" type="text" id="poho2" size="30">
      249*295</td>
      <td valign="middle"><div align="center">
        <input type="button" name="Button2" class="button01-out" value="浏 览" onClick="JavaScript:openem()">
      </div></td>
    </tr>
    <tr align="center"> 
      <td height="31" colspan="4">
        <input type="submit" name="Submit" value="确定添加" onClick="return CheckForm()">
        <input type="reset" name="Submit2" value="清除所有" >
      </td>
    </tr>
  </table>
</form>
</body>
</html>
