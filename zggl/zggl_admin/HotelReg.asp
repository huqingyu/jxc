
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>酒店信息登记</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link href="css/style.css" rel="stylesheet">
</head>
<script>
<%dim sql,i,j
	set rs_s=server.createobject("adodb.recordset")
	sql="select * from szSheng order by shengorder"
	rs_s.open sql,conn,1,1
%>
	var selects=[];
	selects['xxx']=new Array(new Option('请选择城市……','xxx'));
<%
	for i=1 to rs_s.recordcount
%>
	selects['<%=rs_s("ShengNo")%>']=new Array(
<%
	set rs_s1=server.createobject("adodb.recordset")
	sql="select * from szShi where shengid="&rs_s("id")&" order by shiorder"
	rs_s1.open sql,conn,1,1
	if rs_s1.recordcount>0 then 
		for j=1 to rs_s1.recordcount
		if j=rs_s1.recordcount then 
%>
		new Option('<%=trim(rs_s1("shiname"))%>','<%=trim(rs_s1("shiname"))%>'));
<%		else
%>
		new Option('<%=trim(rs_s1("shiname"))%>','<%=trim(rs_s1("shiname"))%>'),
<%
		end if
		rs_s1.movenext
		next
	else 
%>
		new Option('','0'));
<%
	end if
	rs_s1.close
	set rs_s1=nothing
	rs_s.movenext
	next
rs_s.close
set rs_s=nothing
%>
	function chsel(){
		with (document.FORM1){
			if(szSheng.value) {
				shucity.options.length=0;
				for(var i=0;i<selects[szSheng.value].length;i++){
					shucity.add(selects[szSheng.value][i]);
				}
			}
		}
	}
</script>
<SCRIPT language=javascript id=clientEventHandlersJS>
<!--

function form1_onsubmit() 
{
if(document.FORM1.hotelname.value.length<1)
 {
   alert("您必须填写酒店名称!");
   document.FORM1.hotelname.focus();
   return false;
 }

if(document.FORM1.hotelcity.value.length<1)
 {
   alert("您必须输入酒店所在市县!");
   document.FORM1.hotelcity.focus();
   return false;
 }
}

//-->
</SCRIPT>
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

	hotellogurl.value = sFromUrl;
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
	sFromUrl = hotellogurl.value;
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
<body>
<FORM ACTION="hotelSubmit.asp" METHOD="POST" NAME="FORM1" onsubmit="return form1_onsubmit()">
<br /><br /><br />
            <table width="65%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
              <tbody>
                <tr background="images/admin_bg_1.gif">
                  <td height="30" colspan=2 background="images/admin_bg_1.gif" align="center"><font color="red"><b>酒店信息登记</b></font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >酒店名称：</td>
                  <td width=396 height=25><input name="hotelname" maxlength="20" size="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >酒点地址：</td>
                  <td width=396 height=25><input name="jddz" id="jddz" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >距飞机场：</td>
                  <td width=396 height=25><input name="jfjc" id="jfjc" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >距火车站：</td>
                  <td width=396 height=25><input name="jhcz" id="jhcz" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >距长途车站：</td>
                  <td width=396 height=25><input name="jctcz" id="jctcz" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >距港口码头：</td>
                  <td width=396 height=25><input name="jgkmt" id="jgkmt" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >距商业中心：</td>
                  <td width=396 height=25><input name="jsyzx" id="jsyzx" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >距核心景区：</td>
                  <td width=396 height=25><input name="jhxjq" id="jhxjq" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >星级标准：</td>
                  <td  width=396 height=25 ><select name="hotellevel" size="1">
                      <option value="无">无标准</option>
                      <option value="一星级">一星级</option>
                      <option value=二星级>二星级</option>
                      <option value=三星级>三星级</option>
                      <option value=四星级>四星级</option>
                      <option value=五星级>五星级</option>
                      <option value=准三星级>准三星级</option>
                      <option value=准四星级>准四星级</option>
                      <option value=准五星级>准五星级</option>
                    </select>
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height="25" align="right" bgcolor=#EBEBEB >酒店所在地区：</td>
                  <td  width=396><select size="1" name="szSheng" onChange=chsel() style="width:150px">
<option value="xxx" selected>请选择省份……</option>
<%dim tmpShengid
tmpShengid=0
set rs_s=server.createobject("adodb.recordset")
sql="select * from szSheng order by shengorder"
rs_s.open sql,conn
while not rs_s.eof
%>
<option value="<%=rs_s("ShengNo")%>" ><%=trim(rs_s("ShengName"))%></option>
<%
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
%>
        </select>
		<select size="1" name="shucity" id="shucity" style="width:150px">
		  <%
set rs_s=server.createobject("adodb.recordset")
sql="select ShiName from szShi where shengid="&tmpShengid&" order by shiorder"
rs_s.open sql,conn
while not rs_s.eof
%>
          <option value="<%=trim(rs_s("ShiName"))%>"><%=trim(rs_s("ShiName"))%></option>
          <%
rs_s.movenext
wend
rs_s.close
set rs_s=nothing
%>
        </select></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB ><span>是否推荐</span><span>：</span></td>
                  <td height=25><select name="tuijian1" id="tuijian1">
                    <option value="1">推荐</option>
                    <option value="0" selected>不需要推荐</option>
                  </select></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >外观图片：</td>
                  <td width=396 height=25 ><input name="hotellogurl" type="text" value="UploadFile/noimags.gif" size="50">
                      <input type="button" name="Button" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >酒店大堂：</td>
                  <td width=396 height=25 ><input name="hotellogurl2" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button2" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >房间图片：</td>
                  <td width=396 height=25 ><input name="hotellogurl3" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button3" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片4：</td>
                  <td width=396 height=25 ><input name="hotellogurl4" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button4" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片5：</td>
                  <td width=396 height=25 ><input name="hotellogurl5" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button5" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片6：</td>
                  <td width=396 height=25 ><input name="hotellogurl6" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button6" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片7：</td>
                  <td width=396 height=25 ><input name="hotellogurl7" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button7" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片8：</td>
                  <td width=396 height=25 ><input name="hotellogurl8" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button8" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片9：</td>
                  <td width=396 height=25 ><input name="hotellogurl9" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button9" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >更多图片10：</td>
                  <td width=396 height=25 ><input name="hotellogurl10" type="text" value="UploadFile/noimags.gif" size="50">
                    <input type="button" name="Button10" class="button01-out" value="浏 览" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=200 align="right" bgcolor=#EBEBEB >酒店简介：</td>
                  <td height=200><font color="#FF0000">
                    <textarea rows="15" name="hotelinfo" cols="60"></textarea>
                  </font></td>
                </tr>
                <tr>
                  <td height="35" colspan=2 background="images/admin_bg_1.gif">
                    <p align="center">
                      <input type=SUBMIT value=" 添 加 " class="medium" onClick="javascript:return checksignup()" name="signup_submit">
&nbsp;&nbsp;
          <input type=RESET value="重 填" class="medium" name="signup_reset">
          <input name="button" type="button" class="main" onClick="javascript:window.history.go(-1)" value="返回" size="3">
                              </td>
                </tr>
            </table>
</div>
</form>

</body>
</html>