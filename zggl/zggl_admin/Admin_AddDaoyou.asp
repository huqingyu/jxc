
<!--#include file="admin_check_permission.asp"-->
<!DOCTYPE HTML>
<html>
<head>
<meta name=vs_targetSchema content="HTML 4.0">
<title>���������·</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<script language="JavaScript">
<!--
function CheckForm()
{
	if (document.myform.d_name2.value.length == 0)
 {
		alert("�������û���!");
		document.myform.d_name2.focus();
		return false;
	}
	if (document.myform.add2.value.length == 0)
 {
		alert("�����뵼����ϵ��ַ!");
		document.myform.add2.focus();
		return false;
	}		
	if (document.myform.tel2.value.length == 0)
 {
		alert("�����뵼����ϵ�绰!");
		document.myform.tel2.focus();
		return false;
	}		
			if (document.myform.nianling2.value.length == 0)
 {
		alert("�����뵼�ε�����!.");
		document.myform.nianling2.focus();
		return false;
	}		
			if (document.myform.mail2.value.length == 0)
 {
		alert("�����뵼�ε�E-MAIL!.");
		document.myform.mail2.focus();
		return false;
	}		
			if (document.myform.info2.value.length == 0)
 {
		alert("�����뵼�ε���Ϣ!");
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
var sTitle = "����";

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
		sTitle = "�޸�";
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

document.write("<title>ͼƬ���ԣ�" + sTitle + "��</title>");

// ��ʼֵ
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

// �����ڷ���ֵ
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

// ��ȷ��ʱִ��
function ok(){
	// �������������Ч��
	d_border.value = ToInt(d_border.value);
	d_width.value = ToInt(d_width.value);
	d_height.value = ToInt(d_height.value);
	d_vspace.value = ToInt(d_vspace.value);
	d_hspace.value = ToInt(d_hspace.value);
	// �߿���ɫ����Ч��
	if (!IsColor(d_bordercolor.value)){
		BaseAlert(d_bordercolor,'��ʾ��\n\n��Ч�ı߿���ɫֵ��');
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
      <td height="35" colspan="3" background="Images/topBar_bg.gif"><div align="center"><font color="#FF0000"><b>��ӵ���</b></font></div></td>
    </tr>
    <tr>
      <td width="207" height="25" align="right" bgcolor="#ebebeb">������&nbsp;</td>
      <td colspan="2"><input name="d_name2" type="text" id="d_name2"></td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">�Ա�&nbsp;</td>
      <td colspan="2"> 
        <select name="sex2" id="sex2">
          <option value="1" selected>��</option>
          <option value="0">Ů</option>
        </select>
</td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">���䣺&nbsp;</td>
      <td colspan="2"> 
        <input name="nianling2" type="text" id="nianling2">
      </td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">�ȼ���&nbsp;</td>
      <td width="293"><select name="vip2" id="vip2">
        <option value="1" selected>��ͨ��Ա</option>
        <option value="2">�߼���Ա</option>
        <option value="3">�����Ա</option>
      </select></td>
      <td width="124"><div align="center">
        <select name="tuijian2" id="tuijian2">
            <option value="0" selected>�����Ƽ�</option>
            <option value="1">��Ҫ�Ƽ�</option>
        </select>
      </div></td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">���壺&nbsp;</td>
      <td colspan="2"><select name="mingzu2" id="mingzu2">
        <option value="a" selected>��</option>
        <option value="b">��</option>
        <option value="c">��</option>
        <option value="d">ά</option>
        <option value="e">��</option>
        <option value="f">��</option>
        <option value="δ֪">δ֪</option>
      </select></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">��ϵ�绰��&nbsp;</td>
      <td colspan="2"><input name="tel2" type="text" id="tel2"></td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">��ϵ��ַ��&nbsp;</td>
      <td colspan="2"><input name="add2" type="text" id="add2"> 
      </td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">E-mail��&nbsp;</td>
      <td colspan="2"><input name="mail2" type="text" id="mail2"> 
      </td>
    </tr>
    <tr> 
      <td height="25" align="right" bgcolor="#ebebeb">������ϵ��ʽ��&nbsp;</td>
      <td colspan="2"> 
        <input name="lianxi2" type="text" id="lianxi2" value="">
      </td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�ó���·��&nbsp;</td>
      <td colspan="2"><input name="xianlu2" type="text" id="xianlu2" size="50"></td>
    </tr>
    <tr>
      <td height="25" align="right" bgcolor="#ebebeb">�������ԣ�&nbsp;</td>
      <td colspan="2"><input name="lang2" type="text" id="lang2" size="50"></td>
    </tr>
    <tr> 
      <td height="90" align="right" bgcolor="#ebebeb">���ܣ�&nbsp;</td>
      <td height="90" colspan="2"> 
        <textarea name="info2" cols="50" rows="5" id="info2"></textarea>
      </td>
    </tr>
    <tr> 
      <td height="90" align="right" bgcolor="#ebebeb">��ע��&nbsp;</td>
      <td height="90" colspan="2"> 
        <textarea name="back2" cols="50" rows="5" id="back2"></textarea>
      </td>
    </tr>
    <tr> 
      <td height="11" align="right" bgcolor="#ebebeb">��Ƭ��(����ͼ)&nbsp;</td>
      <td height="11" valign="middle"> 
        <input name="img2" type="text" id="img2" size="30">
        120*130		</td>
      <td valign="middle"><div align="center">
        <input type="button" name="Button" class="button01-out" value="� ��" onClick="JavaScript:openem()">
      </div></td>
    </tr>
    <tr>
      <td height="12" align="right" bgcolor="#ebebeb">��Ƭ��(������)&nbsp;</td>
      <td height="12" valign="middle"><input name="poho2" type="text" id="poho2" size="30">
      249*295</td>
      <td valign="middle"><div align="center">
        <input type="button" name="Button2" class="button01-out" value="� ��" onClick="JavaScript:openem()">
      </div></td>
    </tr>
    <tr align="center"> 
      <td height="31" colspan="4">
        <input type="submit" name="Submit" value="ȷ�����" onClick="return CheckForm()">
        <input type="reset" name="Submit2" value="�������" >
      </td>
    </tr>
  </table>
</form>
</body>
</html>
