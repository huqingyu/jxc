
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('���糬ʱ������û�е�½��');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")=3 then
response.Write "<div align=center><font size=80 color=red><b>��û�д���Ŀ����Ȩ�ޣ�</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<%
if request("action")="update" then
id=request("id")
set rs=server.createobject("adodb.recordset")
sqltext="select * from hotelb where id="&id
rs.open sqltext,conn,3,3
jddz=request.form("jddz")
jfjc=request.form("jfjc")
jhcz=request.form("jhcz")
jctcz=request.form("jctcz")
jgkmt=request.form("jgkmt")
jsyzx=request.form("jsyzx")
jhxjq=request.form("jhxjq")
if jddz = "" then jddz = "δ֪" end if
rs("jddz") = jddz
if jfjc = "" then jfjc = "δ֪" end if
rs("jfjc") = jfjc
if jhcz = "" then jhcz = "δ֪" end if
rs("jhcz") = jhcz
if jctcz = "" then jctcz = "δ֪" end if
rs("jctcz") = jctcz
if jgkmt = "" then jgkmt = "δ֪" end if
rs("jgkmt") = jgkmt
if jsyzx = "" then jsyzx = "δ֪" end if
rs("jsyzx") = jsyzx
if jhxjq = "" then jhxjq = "δ֪" end if
rs("jhxjq") = jhxjq
rs("c_name")=request.form("hotelname")
rs("level")=request.form("hotellevel")
rs("province")=request.form("szSheng")
rs("city")=request.form("szShi")
rs("info")=request.form("hotelinfo")
rs("logurl")=request.form("hotellogurl")
rs("logurl2")=request.form("hotellogurl2")
rs("logurl3")=request.form("hotellogurl3")
rs("logurl4")=request.form("hotellogurl4")
rs("logurl5")=request.form("hotellogurl5")
rs("logurl6")=request.form("hotellogurl6")
rs("logurl7")=request.form("hotellogurl7")
rs("logurl8")=request.form("hotellogurl8")
rs("logurl9")=request.form("hotellogurl9")
rs("logurl10")=request.form("hotellogurl10")
rs("tuijian_id")=request.form("tuijian1")
rs.update
rs.close
conn.close
response.redirect "HotelInfo.asp"

else
id=request("id")
set rs=server.createobject("adodb.recordset")
sqltext="select * from Hotelb where id="&id
rs.open sqltext,conn,1,1
%>
<!DOCTYPE HTML>
<html>
<head>
<title>�Ƶ���Ϣ�༭</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/style.css" rel="stylesheet">
</head>
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

// �����ڷ���ֵ
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

<script>

<%
	set rs_s=server.createobject("adodb.recordset")
	sql="select * from szSheng order by shengorder"
	rs_s.open sql,conn,1,1
%>
	var selects=[];
	selects['xxx']=new Array(new Option('��ѡ����С���','xxx'));
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
		new Option('<%=trim(rs_s1("shiname"))%>','<%=trim(rs_s1("shiNo"))%>'));
<%		else
%>
		new Option('<%=trim(rs_s1("shiname"))%>','<%=trim(rs_s1("shiNo"))%>'),
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
				szShi.options.length=0;
				for(var i=0;i<selects[szSheng.value].length;i++){
					szShi.add(selects[szSheng.value][i]);
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
   alert("��������д�Ƶ�����!");
   document.FORM1.hotelname.focus();
   return false;
 }

if(document.FORM1.hotelcity.value.length<1)
 {
   alert("����������Ƶ���������!");
   document.FORM1.hotelcity.focus();
   return false;
 }
}

//-->
</SCRIPT>
<body>
<FORM ACTION="edithoteldetail.asp" METHOD="POST" NAME="FORM1" onsubmit="return form1_onsubmit()">
<input type=hidden name=action value="update">
<input type=hidden name=id value=<%=request("id")%>>
      <div align="center"><br /><br /><br />
        <table width="65%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
          <tbody>
            <tr background="images/admin_bg_1.gif">
              <td height="30" colspan=2 background="images/admin_bg_1.gif" align="center"><font color="red">�Ƶ���Ϣ�༭</font></td>
            </tr>
            <tr>
              <td width=112 height=25 align="right" bgcolor=#EBEBEB >�Ƶ����ƣ�</td>
              <td width=396 height=25><input name="hotelname" value="<%=rs("c_name")%>" size="20" maxlength="20">
                  <font color="#FF0000">*</font></td>
            </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >�Ƶ��ַ��</td>
                  <td width=396 height=25><input name="jddz" id="jddz" value="<%=rs("jddz")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >��ɻ�����</td>
                  <td width=396 height=25><input name="jfjc" id="jfjc" value="<%=rs("jfjc")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >���վ��</td>
                  <td width=396 height=25><input name="jhcz" id="jhcz" value="<%=rs("jhcz")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >�೤;��վ��</td>
                  <td width=396 height=25><input name="jctcz" id="jctcz" value="<%=rs("jctcz")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >��ۿ���ͷ��</td>
                  <td width=396 height=25><input name="jgkmt" id="jgkmt" value="<%=rs("jgkmt")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ҵ���ģ�</td>
                  <td width=396 height=25><input name="jsyzx" id="jsyzx" value="<%=rs("jsyzx")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ľ�����</td>
                  <td width=396 height=25><input name="jhxjq" id="jhxjq" value="<%=rs("jhxjq")%>" size="20" maxlength="20">
                      <font color="#FF0000">*</font></td>
                </tr>
            <tr>
              <td width=112 height=25 align="right" bgcolor=#EBEBEB >�Ǽ���׼��</td>
              <td  width=396 height=25 ><select name="hotellevel" size="1">
                  <option value="<%=rs("level")%>" selected><%=rs("level")%></option>     
                  <option value="��">�ޱ�׼</option>
                  <option value="һ�Ǽ�">һ�Ǽ�</option>
                  <option value=���Ǽ�>���Ǽ�</option>
                  <option value=���Ǽ�>���Ǽ�</option>
                  <option value=���Ǽ�>���Ǽ�</option>
                  <option value=���Ǽ�>���Ǽ�</option>
                  <option value=׼���Ǽ�>׼���Ǽ�</option>
                  <option value=׼���Ǽ�>׼���Ǽ�</option>
                  <option value=׼���Ǽ�>׼���Ǽ�</option>
                  </select>
                  <font color="#FF0000">*</font></td>
            </tr>
            <tr>
              <td width=112 height="25" align="right" bgcolor=#EBEBEB >�Ƶ����ڵ�����</td>
              <td  width=396>
                  <select size="1"  name="szSheng" onChange=chsel()>
          <option value="xxx" selected>��ѡ��ʡ�ݡ���</option>
          <%dim tmpShengid
tmpShengid=0
set rs_s=server.createobject("adodb.recordset")
sql="select * from szSheng  order by shengorder"
rs_s.open sql,conn,1,1
while not rs_s.eof
     if rs("province")=rs_s("ShengNo") then
          tmpShengid=rs_s("id")
%>
          <option value="<%=rs_s("ShengNo")%>" selected ><%=trim(rs_s("ShengName"))%></option>
          <%
     else
%>
          <option value="<%=rs_s("ShengNo")%>" ><%=trim(rs_s("ShengName"))%></option>
          <%
     end if
    rs_s.movenext
wend
rs_s.close
set rs_s=nothing
%>
        </select>
        <select size="1" name="szShi">
          <%
set rs_s=server.createobject("adodb.recordset")
sql="select * from szShi where shengid="&tmpShengid&" order by shiorder"
rs_s.open sql,conn,1,1
while not rs_s.eof
%>
          <option value="<%=rs_s("ShiName")%>" <%if trim(rs("city"))=trim(rs_s("ShiName")) then%>selected<%end if%>><%=trim(rs_s("ShiName"))%></option>
          <%
    rs_s.movenext
wend
rs_s.close
set rs_s=nothing
%>
        </select>
        <font color="#FF0000">*</font> 
</td>
            </tr>
            <tr>
              <td width=112 height=25 align="right" bgcolor=#EBEBEB ><span>�Ƿ��Ƽ�</span><span>��</span></td>
              <td height=25><span>
                <select name="tuijian1" id="select">
                  <option value="1" <%if rs("tuijian_id")="1" then%>selected<%end if%>>�Ƽ�</option>
                  <option value="0" <%if rs("tuijian_id")="0" then%>selected<%end if%>>����Ҫ�Ƽ�</option>
                </select>
              </span></td>
            </tr>
            <tr>
              <td width=112 height=25 align="right" bgcolor=#EBEBEB >���ͼƬ��</td>
              <td width=396 height=25 ><input name="hotellogurl" type="text" value="<%=rs("logurl")%>" size="50">
                <input type="button" name="Button1" class="button01-out" value="� ��" onClick="JavaScript:openem()">
                                </td>
            </tr>
            <tr>
              <td width=112 height=25 align="right" bgcolor=#EBEBEB >�Ƶ���ã�</td>
              <td width=396 height=25 ><input name="hotellogurl2" type="text" value="<%=rs("logurl2")%>" size="50">
                <input type="button" name="Button2" class="button01-out" value="� ��" onClick="JavaScript:openem()">
                                </td>
            </tr>
            <tr>
              <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ��</td>
              <td width=396 height=25 ><input name="hotellogurl3" type="text" value="<%=rs("logurl3")%>" size="50">
                <input type="button" name="Button3" class="button01-out" value="� ��" onClick="JavaScript:openem()">
                                </td>
            </tr>
			
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ4��</td>
                  <td width=396 height=25 ><input name="hotellogurl4" type="text" value="<%=rs("logurl4")%>" size="50">
                    <input type="button" name="Button4" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ5��</td>
                  <td width=396 height=25 ><input name="hotellogurl5" type="text" value="<%=rs("logurl5")%>" size="50">
                    <input type="button" name="Button5" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ6��</td>
                  <td width=396 height=25 ><input name="hotellogurl6" type="text" value="<%=rs("logurl6")%>" size="50">
                    <input type="button" name="Button6" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ7��</td>
                  <td width=396 height=25 ><input name="hotellogurl7" type="text" value="<%=rs("logurl7")%>" size="50">
                    <input type="button" name="Button7" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ8��</td>
                  <td width=396 height=25 ><input name="hotellogurl8" type="text" value="<%=rs("logurl8")%>" size="50">
                    <input type="button" name="Button8" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ9��</td>
                  <td width=396 height=25 ><input name="hotellogurl9" type="text" value="<%=rs("logurl9")%>" size="50">
                    <input type="button" name="Button9" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
                <tr>
                  <td width=112 height=25 align="right" bgcolor=#EBEBEB >����ͼƬ10��</td>
                  <td width=396 height=25 ><input name="hotellogurl10" type="text" value="<%=rs("logurl10")%>" size="50">
                    <input type="button" name="Button10" class="button01-out" value="� ��" onClick="JavaScript:openem()"></td>
                </tr>
			
            <tr>
              <td width=112 height=200 align="right" bgcolor=#EBEBEB >�Ƶ��飺</td>
              <td height=200><font color="#FF0000">
                <textarea rows="15" name="hotelinfo" cols="60"><%=rs("info")%></textarea>
              </font></td>
            </tr>
            <tr>
              <td height="35" colspan=2 background="images/admin_bg_1.gif">
                <p align="center">
                  <input type=SUBMIT value=" �� �� " class="medium" onClick="javascript:return checksignup()" name="signup_submit">
                  <input type=RESET value="�� ��" class="medium" name="signup_reset">
                  <input name="button" type="button" class="main" onClick="javascript:window.history.go(-1)" value="����" size="3">
</td>
            </tr>
                </table>
      </div>
      <p align="center">��
</form>

</body>
</html>
<%
rs.close
conn.close
end if
%>
