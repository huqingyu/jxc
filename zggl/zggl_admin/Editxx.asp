
<%if session("admin")="" then
response.Write "<script language='javascript'>alert('网络超时或您还没有登陆！');window.location.href='Admin_Login.asp';</script>"
response.End
else
if session("flag")>1 then
response.Write "<div align=center><font size=80 color=red><b>您没有此项目管理权限！</b></font></div>"
response.End
end if
end if
%>
<!--#include file="admin_common/conn.asp" -->
<!DOCTYPE HTML>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<script language="javascript">
<!--
function checkdata()
{
if (document.form1.viewhtml.checked == true)
	{
	  alert("对不起，请取消“查看HTML源代码”后再添加！")
	  document.form1.viewhtml.focus()
	  return false
	 }
if (document.form1.Content.value.length==0)
	{
	  alert("对不起，请输入文章内容！")
	  return false
	 }
}

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<script  language="JavaScript">
<!-- Hide from older browsers...

//Function to format text in the text box
function FormatText(command, option){
	
  	frames.message.document.execCommand(command, true, option);
  	frames.message.focus();
}

//Function to add image
function AddImage(){	
	imagePath = prompt('请输入图片地址', 'http://');				
	
	if ((imagePath != null) && (imagePath != "")){					
		frames.message.document.execCommand('InsertImage', false, imagePath);
  		frames.message.focus();
	}
	frames.message.focus();			
}

//Function to clear form
function ResetForm(){

	if (window.confirm('确认要清空对话框内容?')){
	 	frames.message.document.body.innerHTML = ''; 
	 	return true;
	 } 
	 return false;		
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}

function setMode(newMode)
{
  bTextMode = newMode;
  var cont;
  if (bTextMode) {
    cleanHtml();
    cleanHtml();

    cont=message.document.body.innerHTML;
    message.document.body.innerText=cont;
  } else {
    cont=message.document.body.innerText;
    message.document.body.innerHTML=cont;
  }
  message.focus();
}

function cleanHtml()
{
  var fonts = message.document.body.all.tags("FONT");
  var curr;
  for (var i = fonts.length - 1; i >= 0; i--) {
    curr = fonts[i];
    if (curr.style.backgroundColor == "#FFF") curr.outerHTML	= curr.innerHTML;
  }

}

// -->
</script>
<script language="JavaScript">

function help()
{
    var helpmess;
    helpmess="---------------填写帮助---------------\r\n\r\n"+
         "1.请不要发表有危险性的脚本。\r\n\r\n"+
         "2.如果要书写源代码，请选中\r\n\r\n"+
         "　查看HTML源代码书写.\r\n\r\n"+
         "3.需要你自己运行,才能看效果.\r\n\r\n"+
         "4.如果书写js，尽量不要在这儿书写.\r\n\r\n";
    alert(helpmess);
}
</script>
<script src="js/edit.js"></script>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<br /><table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td rowspan="2"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="12v">
              <tr> 
                <td class="12v" > 
                  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" id="AutoNumber3" height="0" width="100%">
                    <tr> 
                      <td> 
                        <%dim action
action=request.QueryString("action")
select case action
case ""%>
                        <table width="100%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
                          <tr> 
                            <td height="30" background="images/admin_bg_1.gif"> 
                            <div align="center"><font color="#000000">网站其它信息设置</font></div>                            </td>
                          </tr>
                          <tr> 
                            <td height="64"><br />
                              <table width="80%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#CCCCCC">
                                <tr align="center"> 
                                  <td width="27%" height="22"> <a href="editxx.asp?action=huikuanfangshi">付款方式</a></td>
                                  <td width="34%" height="22"><a href="editxx.asp?action=changjianwenti">常见问题</a> </td>
                                  <td width="39%" height="22">&nbsp; </td>
                                </tr>
                                <tr align="center"> 
                                  <td height="22"> <a href="editxx.asp?action=jiaoyitiaokuan">交易条款</a></td>
                                  <td height="22"><a href="editxx.asp?action=gongzuoshijian">我们的工作时间</a> </td>
                                  <td height="22">&nbsp; </td>
                                </tr>
                                <tr align="center"> 
                                  <td height="22"><a href="editxx.asp?action=vip">VIP特惠</a></td>
                                  <td height="22"><a href="editxx.asp?action=shiyongfalv">适用法律和版权声明</a></td>
                                  <td height="22">&nbsp;</td>
                                </tr>
                                <tr align="center"> 
                                  <td height="22"><a href="editxx.asp?action=about">关于本站</a></td>
                                  <td height="22"><a href="editxx.asp?action=regtiaoyue">更改注册条约</a> </td>
                                  <td height="22">&nbsp; </td>
                                </tr>
                                <tr align="center"> 
                                  <td height="22"><a href="editxx.asp?action=gouwuliucheng">消费流程</a> </td>
                                  <td height="22"><a href="editxx.asp?action=jifen">积分奖励</a> </td>
                                  <td height="22">&nbsp; </td>
                                </tr>
                                <tr align="center"> 
                                  <td height="22"><a href="editxx.asp?action=lxwm">联系我们</a> </td>
                                  <td height="22">&nbsp;</td>
                                  <td height="22">&nbsp; </td>
                                </tr>
                              </table>
                              <br />
                            </td>
                          </tr>
                        </table>
<%case else%>
                        <table width="100%" border=1 align="center" cellPadding=0 cellSpacing=0  bgcolor="#F9F9F9">
                          <tr> 
                            <td align="center" height="30" background="images/admin_bg_1.gif"> <font color="#000000"> 
                              <%
if action="huikuanfangshi" then response.write "付 款 方 式"
if action="gouwuliucheng" then response.write "消 费 流 程"
if action="regtiaoyue" then response.write "更 改 注 册 条 约"
if action="gongzuoshijian" then response.write "我们的工作时间"
if action="jifen" then response.write "积 分 奖 励"
if action="vip" then response.write "VIP 特 惠"
if action="about" then response.write "关 于 本 站"
if action="lxwm" then response.write "联 系 我 们"
if action="jiaoyitiaokuan" then response.write "交 易 条 款"
if action="changjianwenti" then response.write "常 见 问 题"
if action="shiyongfalv" then response.write "适用法律和版权声明"
%>
                            </font> </td>
                          </tr>
                          <tr> 
                            <td height="83"><br />
                              <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <form name="form1" method="post" action="savexx.asp?action=<%=action%>" OnSubmit="return checkdata()" onReset="return ResetForm();">
                                  <tr> 
                                    <td> 
                                      <div align="center"> 
                                        <table width="430" border="0" cellspacing="1" cellpadding="1">
                                          <tr> 
                                            <td>&nbsp; 
                                              <select name="selectFont"  class="wenbenkuang" onChange="FormatText('fontname', selectFont.options[selectFont.selectedIndex].value);document.form1.selectFont.options[0].selected = true;"  style="font-family: 宋体; font-size: 9pt" onMouseOver="window.status='选择选定文字的字体。';return true;" onMouseOut="window.status='';return true;">
                                                <option selected>选择字体</option>
                                                <option value="宋体">宋体</option>
                                                <option value="楷体_GB2312">楷体</option>
                                                <option value="新宋体">新宋体</option>
                                                <option value="黑体">黑体</option>
                                                <option value="隶书">隶书</option>
                                                <option value="幼圆">幼圆</option>
                                                <OPTION value="Andale Mono">Andale 
                                                Mono</OPTION>
                                                <OPTION value=Arial>Arial</OPTION>
                                                <OPTION value="Arial Black">Arial 
                                                Black</OPTION>
                                                <OPTION value="Book Antiqua">Book 
                                                Antiqua</OPTION>
                                                <OPTION value="Century Gothic">Century 
                                                Gothic</OPTION>
                                                <OPTION value="Comic Sans MS">Comic 
                                                Sans MS</OPTION>
                                                <OPTION value="Courier New">Courier 
                                                New</OPTION>
                                                <OPTION value=Georgia>Georgia</OPTION>
                                                <OPTION value=Impact>Impact</OPTION>
                                                <OPTION value=Tahoma>Tahoma</OPTION>
                                                <OPTION value="Times New Roman" >Times 
                                                New Roman</OPTION>
                                                <OPTION value="Trebuchet MS">Trebuchet 
                                                MS</OPTION>
                                                <OPTION value="Script MT Bold">Script 
                                                MT Bold</OPTION>
                                                <OPTION value=Stencil>Stencil</OPTION>
                                                <OPTION value=Verdana>Verdana</OPTION>
                                                <OPTION value="Lucida Console">Lucida 
                                                Console</OPTION>
                                              </select>
                                              <select name="selectColour"  class="wenbenkuang" onChange="FormatText('ForeColor',selectColour.options[selectColour.selectedIndex].value);document.form1.selectColour.options[0].selected = true;" onMouseOver="window.status='选择选定文字的颜色。';return true;" onMouseOut="window.status='';return true;">
                                                <option value="0" selected>选择文字颜色</option>
                                                <option style="background-color:#F0F8FF;color: #F0F8FF" value="#F0F8FF">#F0F8FF</option>
                                                <option style="background-color:#FAEBD7;color: #FAEBD7" value="#FAEBD7">#FAEBD7</option>
                                                <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">#00FFFF</option>
                                                <option style="background-color:#7FFFD4;color: #7FFFD4" value="#7FFFD4">#7FFFD4</option>
                                                <option style="background-color:#F0FFFF;color: #F0FFFF" value="#F0FFFF">#F0FFFF</option>
                                                <option style="background-color:#F5F5DC;color: #F5F5DC" value="#F5F5DC">#F5F5DC</option>
                                                <option style="background-color:#FFE4C4;color: #FFE4C4" value="#FFE4C4">#FFE4C4</option>
                                                <option style="background-color:#000000;color: #000000" value="#000000">#000000</option>
                                                <option style="background-color:#FFEBCD;color: #FFEBCD" value="#FFEBCD">#FFEBCD</option>
                                                <option style="background-color:#0000FF;color: #0000FF" value="#0000FF">#0000FF</option>
                                                <option style="background-color:#8A2BE2;color: #8A2BE2" value="#8A2BE2">#8A2BE2</option>
                                                <option style="background-color:#A52A2A;color: #A52A2A" value="#A52A2A">#A52A2A</option>
                                                <option style="background-color:#DEB887;color: #DEB887" value="#DEB887">#DEB887</option>
                                                <option style="background-color:#5F9EA0;color: #5F9EA0" value="#5F9EA0">#5F9EA0</option>
                                                <option style="background-color:#7FFF00;color: #7FFF00" value="#7FFF00">#7FFF00</option>
                                                <option style="background-color:#D2691E;color: #D2691E" value="#D2691E">#D2691E</option>
                                                <option style="background-color:#FF7F50;color: #FF7F50" value="#FF7F50">#FF7F50</option>
                                                <option style="background-color:#6495ED;color: #6495ED" value="#6495ED">#6495ED</option>
                                                <option style="background-color:#FFF8DC;color: #FFF8DC" value="#FFF8DC">#FFF8DC</option>
                                                <option style="background-color:#DC143C;color: #DC143C" value="#DC143C">#DC143C</option>
                                                <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">#00FFFF</option>
                                                <option style="background-color:#00008B;color: #00008B" value="#00008B">#00008B</option>
                                                <option style="background-color:#008B8B;color: #008B8B" value="#008B8B">#008B8B</option>
                                                <option style="background-color:#B8860B;color: #B8860B" value="#B8860B">#B8860B</option>
                                                <option style="background-color:#A9A9A9;color: #A9A9A9" value="#A9A9A9">#A9A9A9</option>
                                                <option style="background-color:#006400;color: #006400" value="#006400">#006400</option>
                                                <option style="background-color:#BDB76B;color: #BDB76B" value="#BDB76B">#BDB76B</option>
                                                <option style="background-color:#8B008B;color: #8B008B" value="#8B008B">#8B008B</option>
                                                <option style="background-color:#556B2F;color: #556B2F" value="#556B2F">#556B2F</option>
                                                <option style="background-color:#FF8C00;color: #FF8C00" value="#FF8C00">#FF8C00</option>
                                                <option style="background-color:#9932CC;color: #9932CC" value="#9932CC">#9932CC</option>
                                                <option style="background-color:#8B0000;color: #8B0000" value="#8B0000">#8B0000</option>
                                                <option style="background-color:#E9967A;color: #E9967A" value="#E9967A">#E9967A</option>
                                                <option style="background-color:#8FBC8F;color: #8FBC8F" value="#8FBC8F">#8FBC8F</option>
                                                <option style="background-color:#483D8B;color: #483D8B" value="#483D8B">#483D8B</option>
                                                <option style="background-color:#2F4F4F;color: #2F4F4F" value="#2F4F4F">#2F4F4F</option>
                                                <option style="background-color:#00CED1;color: #00CED1" value="#00CED1">#00CED1</option>
                                                <option style="background-color:#9400D3;color: #9400D3" value="#9400D3">#9400D3</option>
                                                <option style="background-color:#FF1493;color: #FF1493" value="#FF1493">#FF1493</option>
                                                <option style="background-color:#00BFFF;color: #00BFFF" value="#00BFFF">#00BFFF</option>
                                                <option style="background-color:#696969;color: #696969" value="#696969">#696969</option>
                                                <option style="background-color:#1E90FF;color: #1E90FF" value="#1E90FF">#1E90FF</option>
                                                <option style="background-color:#B22222;color: #B22222" value="#B22222">#B22222</option>
                                                <option style="background-color:#FFFAF0;color: #FFFAF0" value="#FFFAF0">#FFFAF0</option>
                                                <option style="background-color:#228B22;color: #228B22" value="#228B22">#228B22</option>
                                                <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">#FF00FF</option>
                                                <option style="background-color:#DCDCDC;color: #DCDCDC" value="#DCDCDC">#DCDCDC</option>
                                                <option style="background-color:#F8F8FF;color: #F8F8FF" value="#F8F8FF">#F8F8FF</option>
                                                <option style="background-color:#FFD700;color: #FFD700" value="#FFD700">#FFD700</option>
                                                <option style="background-color:#DAA520;color: #DAA520" value="#DAA520">#DAA520</option>
                                                <option style="background-color:#808080;color: #808080" value="#808080">#808080</option>
                                                <option style="background-color:#008000;color: #008000" value="#008000">#008000</option>
                                                <option style="background-color:#ADFF2F;color: #ADFF2F" value="#ADFF2F">#ADFF2F</option>
                                                <option style="background-color:#F0FFF0;color: #F0FFF0" value="#F0FFF0">#F0FFF0</option>
                                                <option style="background-color:#FF69B4;color: #FF69B4" value="#FF69B4">#FF69B4</option>
                                                <option style="background-color:#CD5C5C;color: #CD5C5C" value="#CD5C5C">#CD5C5C</option>
                                                <option style="background-color:#4B0082;color: #4B0082" value="#4B0082">#4B0082</option>
                                                <option style="background-color:#FFFFF0;color: #FFFFF0" value="#FFFFF0">#FFFFF0</option>
                                                <option style="background-color:#F0E68C;color: #F0E68C" value="#F0E68C">#F0E68C</option>
                                                <option style="background-color:#E6E6FA;color: #E6E6FA" value="#E6E6FA">#E6E6FA</option>
                                                <option style="background-color:#FFF0F5;color: #FFF0F5" value="#FFF0F5">#FFF0F5</option>
                                                <option style="background-color:#7CFC00;color: #7CFC00" value="#7CFC00">#7CFC00</option>
                                                <option style="background-color:#FFFACD;color: #FFFACD" value="#FFFACD">#FFFACD</option>
                                                <option style="background-color:#ADD8E6;color: #ADD8E6" value="#ADD8E6">#ADD8E6</option>
                                                <option style="background-color:#F08080;color: #F08080" value="#F08080">#F08080</option>
                                                <option style="background-color:#E0FFFF;color: #E0FFFF" value="#E0FFFF">#E0FFFF</option>
                                                <option style="background-color:#FAFAD2;color: #FAFAD2" value="#FAFAD2">#FAFAD2</option>
                                                <option style="background-color:#90EE90;color: #90EE90" value="#90EE90">#90EE90</option>
                                                <option style="background-color:#D3D3D3;color: #D3D3D3" value="#D3D3D3">#D3D3D3</option>
                                                <option style="background-color:#FFB6C1;color: #FFB6C1" value="#FFB6C1">#FFB6C1</option>
                                                <option style="background-color:#FFA07A;color: #FFA07A" value="#FFA07A">#FFA07A</option>
                                                <option style="background-color:#20B2AA;color: #20B2AA" value="#20B2AA">#20B2AA</option>
                                                <option style="background-color:#87CEFA;color: #87CEFA" value="#87CEFA">#87CEFA</option>
                                                <option style="background-color:#778899;color: #778899" value="#778899">#778899</option>
                                                <option style="background-color:#B0C4DE;color: #B0C4DE" value="#B0C4DE">#B0C4DE</option>
                                                <option style="background-color:#FFFFE0;color: #FFFFE0" value="#FFFFE0">#FFFFE0</option>
                                                <option style="background-color:#00FF00;color: #00FF00" value="#00FF00">#00FF00</option>
                                                <option style="background-color:#32CD32;color: #32CD32" value="#32CD32">#32CD32</option>
                                                <option style="background-color:#FAF0E6;color: #FAF0E6" value="#FAF0E6">#FAF0E6</option>
                                                <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">#FF00FF</option>
                                                <option style="background-color:#800000;color: #800000" value="#800000">#800000</option>
                                                <option style="background-color:#66CDAA;color: #66CDAA" value="#66CDAA">#66CDAA</option>
                                                <option style="background-color:#0000CD;color: #0000CD" value="#0000CD">#0000CD</option>
                                                <option style="background-color:#BA55D3;color: #BA55D3" value="#BA55D3">#BA55D3</option>
                                                <option style="background-color:#9370DB;color: #9370DB" value="#9370DB">#9370DB</option>
                                                <option style="background-color:#3CB371;color: #3CB371" value="#3CB371">#3CB371</option>
                                                <option style="background-color:#7B68EE;color: #7B68EE" value="#7B68EE">#7B68EE</option>
                                                <option style="background-color:#00FA9A;color: #00FA9A" value="#00FA9A">#00FA9A</option>
                                                <option style="background-color:#48D1CC;color: #48D1CC" value="#48D1CC">#48D1CC</option>
                                                <option style="background-color:#C71585;color: #C71585" value="#C71585">#C71585</option>
                                                <option style="background-color:#191970;color: #191970" value="#191970">#191970</option>
                                                <option style="background-color:#F5FFFA;color: #F5FFFA" value="#F5FFFA">#F5FFFA</option>
                                                <option style="background-color:#FFE4E1;color: #FFE4E1" value="#FFE4E1">#FFE4E1</option>
                                                <option style="background-color:#FFE4B5;color: #FFE4B5" value="#FFE4B5">#FFE4B5</option>
                                                <option style="background-color:#FFDEAD;color: #FFDEAD" value="#FFDEAD">#FFDEAD</option>
                                                <option style="background-color:#000080;color: #000080" value="#000080">#000080</option>
                                                <option style="background-color:#FDF5E6;color: #FDF5E6" value="#FDF5E6">#FDF5E6</option>
                                                <option style="background-color:#808000;color: #808000" value="#808000">#808000</option>
                                                <option style="background-color:#6B8E23;color: #6B8E23" value="#6B8E23">#6B8E23</option>
                                                <option style="background-color:#FFA500;color: #FFA500" value="#FFA500">#FFA500</option>
                                                <option style="background-color:#FF4500;color: #FF4500" value="#FF4500">#FF4500</option>
                                                <option style="background-color:#DA70D6;color: #DA70D6" value="#DA70D6">#DA70D6</option>
                                                <option style="background-color:#EEE8AA;color: #EEE8AA" value="#EEE8AA">#EEE8AA</option>
                                                <option style="background-color:#98FB98;color: #98FB98" value="#98FB98">#98FB98</option>
                                                <option style="background-color:#AFEEEE;color: #AFEEEE" value="#AFEEEE">#AFEEEE</option>
                                                <option style="background-color:#DB7093;color: #DB7093" value="#DB7093">#DB7093</option>
                                                <option style="background-color:#FFEFD5;color: #FFEFD5" value="#FFEFD5">#FFEFD5</option>
                                                <option style="background-color:#FFDAB9;color: #FFDAB9" value="#FFDAB9">#FFDAB9</option>
                                                <option style="background-color:#CD853F;color: #CD853F" value="#CD853F">#CD853F</option>
                                                <option style="background-color:#FFC0CB;color: #FFC0CB" value="#FFC0CB">#FFC0CB</option>
                                                <option style="background-color:#DDA0DD;color: #DDA0DD" value="#DDA0DD">#DDA0DD</option>
                                                <option style="background-color:#B0E0E6;color: #B0E0E6" value="#B0E0E6">#B0E0E6</option>
                                                <option style="background-color:#800080;color: #800080" value="#800080">#800080</option>
                                                <option style="background-color:#FF0000;color: #FF0000" value="#FF0000">#FF0000</option>
                                                <option style="background-color:#BC8F8F;color: #BC8F8F" value="#BC8F8F">#BC8F8F</option>
                                                <option style="background-color:#4169E1;color: #4169E1" value="#4169E1">#4169E1</option>
                                                <option style="background-color:#8B4513;color: #8B4513" value="#8B4513">#8B4513</option>
                                                <option style="background-color:#FA8072;color: #FA8072" value="#FA8072">#FA8072</option>
                                                <option style="background-color:#F4A460;color: #F4A460" value="#F4A460">#F4A460</option>
                                                <option style="background-color:#2E8B57;color: #2E8B57" value="#2E8B57">#2E8B57</option>
                                                <option style="background-color:#FFF5EE;color: #FFF5EE" value="#FFF5EE">#FFF5EE</option>
                                                <option style="background-color:#A0522D;color: #A0522D" value="#A0522D">#A0522D</option>
                                                <option style="background-color:#C0C0C0;color: #C0C0C0" value="#C0C0C0">#C0C0C0</option>
                                                <option style="background-color:#87CEEB;color: #87CEEB" value="#87CEEB">#87CEEB</option>
                                                <option style="background-color:#6A5ACD;color: #6A5ACD" value="#6A5ACD">#6A5ACD</option>
                                                <option style="background-color:#708090;color: #708090" value="#708090">#708090</option>
                                                <option style="background-color:#FFFAFA;color: #FFFAFA" value="#FFFAFA">#FFFAFA</option>
                                                <option style="background-color:#00FF7F;color: #00FF7F" value="#00FF7F">#00FF7F</option>
                                                <option style="background-color:#4682B4;color: #4682B4" value="#4682B4">#4682B4</option>
                                                <option style="background-color:#D2B48C;color: #D2B48C" value="#D2B48C">#D2B48C</option>
                                                <option style="background-color:#008080;color: #008080" value="#008080">#008080</option>
                                                <option style="background-color:#D8BFD8;color: #D8BFD8" value="#D8BFD8">#D8BFD8</option>
                                                <option style="background-color:#FF6347;color: #FF6347" value="#FF6347">#FF6347</option>
                                                <option style="background-color:#40E0D0;color: #40E0D0" value="#40E0D0">#40E0D0</option>
                                                <option style="background-color:#EE82EE;color: #EE82EE" value="#EE82EE">#EE82EE</option>
                                                <option style="background-color:#F5DEB3;color: #F5DEB3" value="#F5DEB3">#F5DEB3</option>
                                                <option style="background-color:#FFF;color: #FFF" value="#FFF">#FFF</option>
                                                <option style="background-color:#F5F5F5;color: #F5F5F5" value="#F5F5F5">#F5F5F5</option>
                                                <option style="background-color:#FFFF00;color: #FFFF00" value="#FFFF00">#FFFF00</option>
                                                <option style="background-color:#9ACD32;color: #9ACD32" value="#9ACD32">#9ACD32</option>
                                              </select>
                                              <select name="selectbgColour"  class="wenbenkuang" onChange="FormatText('BackColor',selectbgColour.options[selectbgColour.selectedIndex].value);document.form1.selectbgColour.options[0].selected = true;" onMouseOver="window.status='选择选定文字的背景颜色。';return true;" onMouseOut="window.status='';return true;">
                                                <option value="0" selected>选择文字背景颜色</option>
                                                <option style="background-color:#F0F8FF;color: #F0F8FF" value="#F0F8FF">#F0F8FF</option>
                                                <option style="background-color:#FAEBD7;color: #FAEBD7" value="#FAEBD7">#FAEBD7</option>
                                                <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">#00FFFF</option>
                                                <option style="background-color:#7FFFD4;color: #7FFFD4" value="#7FFFD4">#7FFFD4</option>
                                                <option style="background-color:#F0FFFF;color: #F0FFFF" value="#F0FFFF">#F0FFFF</option>
                                                <option style="background-color:#F5F5DC;color: #F5F5DC" value="#F5F5DC">#F5F5DC</option>
                                                <option style="background-color:#FFE4C4;color: #FFE4C4" value="#FFE4C4">#FFE4C4</option>
                                                <option style="background-color:#000000;color: #000000" value="#000000">#000000</option>
                                                <option style="background-color:#FFEBCD;color: #FFEBCD" value="#FFEBCD">#FFEBCD</option>
                                                <option style="background-color:#0000FF;color: #0000FF" value="#0000FF">#0000FF</option>
                                                <option style="background-color:#8A2BE2;color: #8A2BE2" value="#8A2BE2">#8A2BE2</option>
                                                <option style="background-color:#A52A2A;color: #A52A2A" value="#A52A2A">#A52A2A</option>
                                                <option style="background-color:#DEB887;color: #DEB887" value="#DEB887">#DEB887</option>
                                                <option style="background-color:#5F9EA0;color: #5F9EA0" value="#5F9EA0">#5F9EA0</option>
                                                <option style="background-color:#7FFF00;color: #7FFF00" value="#7FFF00">#7FFF00</option>
                                                <option style="background-color:#D2691E;color: #D2691E" value="#D2691E">#D2691E</option>
                                                <option style="background-color:#FF7F50;color: #FF7F50" value="#FF7F50">#FF7F50</option>
                                                <option style="background-color:#6495ED;color: #6495ED" value="#6495ED">#6495ED</option>
                                                <option style="background-color:#FFF8DC;color: #FFF8DC" value="#FFF8DC">#FFF8DC</option>
                                                <option style="background-color:#DC143C;color: #DC143C" value="#DC143C">#DC143C</option>
                                                <option style="background-color:#00FFFF;color: #00FFFF" value="#00FFFF">#00FFFF</option>
                                                <option style="background-color:#00008B;color: #00008B" value="#00008B">#00008B</option>
                                                <option style="background-color:#008B8B;color: #008B8B" value="#008B8B">#008B8B</option>
                                                <option style="background-color:#B8860B;color: #B8860B" value="#B8860B">#B8860B</option>
                                                <option style="background-color:#A9A9A9;color: #A9A9A9" value="#A9A9A9">#A9A9A9</option>
                                                <option style="background-color:#006400;color: #006400" value="#006400">#006400</option>
                                                <option style="background-color:#BDB76B;color: #BDB76B" value="#BDB76B">#BDB76B</option>
                                                <option style="background-color:#8B008B;color: #8B008B" value="#8B008B">#8B008B</option>
                                                <option style="background-color:#556B2F;color: #556B2F" value="#556B2F">#556B2F</option>
                                                <option style="background-color:#FF8C00;color: #FF8C00" value="#FF8C00">#FF8C00</option>
                                                <option style="background-color:#9932CC;color: #9932CC" value="#9932CC">#9932CC</option>
                                                <option style="background-color:#8B0000;color: #8B0000" value="#8B0000">#8B0000</option>
                                                <option style="background-color:#E9967A;color: #E9967A" value="#E9967A">#E9967A</option>
                                                <option style="background-color:#8FBC8F;color: #8FBC8F" value="#8FBC8F">#8FBC8F</option>
                                                <option style="background-color:#483D8B;color: #483D8B" value="#483D8B">#483D8B</option>
                                                <option style="background-color:#2F4F4F;color: #2F4F4F" value="#2F4F4F">#2F4F4F</option>
                                                <option style="background-color:#00CED1;color: #00CED1" value="#00CED1">#00CED1</option>
                                                <option style="background-color:#9400D3;color: #9400D3" value="#9400D3">#9400D3</option>
                                                <option style="background-color:#FF1493;color: #FF1493" value="#FF1493">#FF1493</option>
                                                <option style="background-color:#00BFFF;color: #00BFFF" value="#00BFFF">#00BFFF</option>
                                                <option style="background-color:#696969;color: #696969" value="#696969">#696969</option>
                                                <option style="background-color:#1E90FF;color: #1E90FF" value="#1E90FF">#1E90FF</option>
                                                <option style="background-color:#B22222;color: #B22222" value="#B22222">#B22222</option>
                                                <option style="background-color:#FFFAF0;color: #FFFAF0" value="#FFFAF0">#FFFAF0</option>
                                                <option style="background-color:#228B22;color: #228B22" value="#228B22">#228B22</option>
                                                <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">#FF00FF</option>
                                                <option style="background-color:#DCDCDC;color: #DCDCDC" value="#DCDCDC">#DCDCDC</option>
                                                <option style="background-color:#F8F8FF;color: #F8F8FF" value="#F8F8FF">#F8F8FF</option>
                                                <option style="background-color:#FFD700;color: #FFD700" value="#FFD700">#FFD700</option>
                                                <option style="background-color:#DAA520;color: #DAA520" value="#DAA520">#DAA520</option>
                                                <option style="background-color:#808080;color: #808080" value="#808080">#808080</option>
                                                <option style="background-color:#008000;color: #008000" value="#008000">#008000</option>
                                                <option style="background-color:#ADFF2F;color: #ADFF2F" value="#ADFF2F">#ADFF2F</option>
                                                <option style="background-color:#F0FFF0;color: #F0FFF0" value="#F0FFF0">#F0FFF0</option>
                                                <option style="background-color:#FF69B4;color: #FF69B4" value="#FF69B4">#FF69B4</option>
                                                <option style="background-color:#CD5C5C;color: #CD5C5C" value="#CD5C5C">#CD5C5C</option>
                                                <option style="background-color:#4B0082;color: #4B0082" value="#4B0082">#4B0082</option>
                                                <option style="background-color:#FFFFF0;color: #FFFFF0" value="#FFFFF0">#FFFFF0</option>
                                                <option style="background-color:#F0E68C;color: #F0E68C" value="#F0E68C">#F0E68C</option>
                                                <option style="background-color:#E6E6FA;color: #E6E6FA" value="#E6E6FA">#E6E6FA</option>
                                                <option style="background-color:#FFF0F5;color: #FFF0F5" value="#FFF0F5">#FFF0F5</option>
                                                <option style="background-color:#7CFC00;color: #7CFC00" value="#7CFC00">#7CFC00</option>
                                                <option style="background-color:#FFFACD;color: #FFFACD" value="#FFFACD">#FFFACD</option>
                                                <option style="background-color:#ADD8E6;color: #ADD8E6" value="#ADD8E6">#ADD8E6</option>
                                                <option style="background-color:#F08080;color: #F08080" value="#F08080">#F08080</option>
                                                <option style="background-color:#E0FFFF;color: #E0FFFF" value="#E0FFFF">#E0FFFF</option>
                                                <option style="background-color:#FAFAD2;color: #FAFAD2" value="#FAFAD2">#FAFAD2</option>
                                                <option style="background-color:#90EE90;color: #90EE90" value="#90EE90">#90EE90</option>
                                                <option style="background-color:#D3D3D3;color: #D3D3D3" value="#D3D3D3">#D3D3D3</option>
                                                <option style="background-color:#FFB6C1;color: #FFB6C1" value="#FFB6C1">#FFB6C1</option>
                                                <option style="background-color:#FFA07A;color: #FFA07A" value="#FFA07A">#FFA07A</option>
                                                <option style="background-color:#20B2AA;color: #20B2AA" value="#20B2AA">#20B2AA</option>
                                                <option style="background-color:#87CEFA;color: #87CEFA" value="#87CEFA">#87CEFA</option>
                                                <option style="background-color:#778899;color: #778899" value="#778899">#778899</option>
                                                <option style="background-color:#B0C4DE;color: #B0C4DE" value="#B0C4DE">#B0C4DE</option>
                                                <option style="background-color:#FFFFE0;color: #FFFFE0" value="#FFFFE0">#FFFFE0</option>
                                                <option style="background-color:#00FF00;color: #00FF00" value="#00FF00">#00FF00</option>
                                                <option style="background-color:#32CD32;color: #32CD32" value="#32CD32">#32CD32</option>
                                                <option style="background-color:#FAF0E6;color: #FAF0E6" value="#FAF0E6">#FAF0E6</option>
                                                <option style="background-color:#FF00FF;color: #FF00FF" value="#FF00FF">#FF00FF</option>
                                                <option style="background-color:#800000;color: #800000" value="#800000">#800000</option>
                                                <option style="background-color:#66CDAA;color: #66CDAA" value="#66CDAA">#66CDAA</option>
                                                <option style="background-color:#0000CD;color: #0000CD" value="#0000CD">#0000CD</option>
                                                <option style="background-color:#BA55D3;color: #BA55D3" value="#BA55D3">#BA55D3</option>
                                                <option style="background-color:#9370DB;color: #9370DB" value="#9370DB">#9370DB</option>
                                                <option style="background-color:#3CB371;color: #3CB371" value="#3CB371">#3CB371</option>
                                                <option style="background-color:#7B68EE;color: #7B68EE" value="#7B68EE">#7B68EE</option>
                                                <option style="background-color:#00FA9A;color: #00FA9A" value="#00FA9A">#00FA9A</option>
                                                <option style="background-color:#48D1CC;color: #48D1CC" value="#48D1CC">#48D1CC</option>
                                                <option style="background-color:#C71585;color: #C71585" value="#C71585">#C71585</option>
                                                <option style="background-color:#191970;color: #191970" value="#191970">#191970</option>
                                                <option style="background-color:#F5FFFA;color: #F5FFFA" value="#F5FFFA">#F5FFFA</option>
                                                <option style="background-color:#FFE4E1;color: #FFE4E1" value="#FFE4E1">#FFE4E1</option>
                                                <option style="background-color:#FFE4B5;color: #FFE4B5" value="#FFE4B5">#FFE4B5</option>
                                                <option style="background-color:#FFDEAD;color: #FFDEAD" value="#FFDEAD">#FFDEAD</option>
                                                <option style="background-color:#000080;color: #000080" value="#000080">#000080</option>
                                                <option style="background-color:#FDF5E6;color: #FDF5E6" value="#FDF5E6">#FDF5E6</option>
                                                <option style="background-color:#808000;color: #808000" value="#808000">#808000</option>
                                                <option style="background-color:#6B8E23;color: #6B8E23" value="#6B8E23">#6B8E23</option>
                                                <option style="background-color:#FFA500;color: #FFA500" value="#FFA500">#FFA500</option>
                                                <option style="background-color:#FF4500;color: #FF4500" value="#FF4500">#FF4500</option>
                                                <option style="background-color:#DA70D6;color: #DA70D6" value="#DA70D6">#DA70D6</option>
                                                <option style="background-color:#EEE8AA;color: #EEE8AA" value="#EEE8AA">#EEE8AA</option>
                                                <option style="background-color:#98FB98;color: #98FB98" value="#98FB98">#98FB98</option>
                                                <option style="background-color:#AFEEEE;color: #AFEEEE" value="#AFEEEE">#AFEEEE</option>
                                                <option style="background-color:#DB7093;color: #DB7093" value="#DB7093">#DB7093</option>
                                                <option style="background-color:#FFEFD5;color: #FFEFD5" value="#FFEFD5">#FFEFD5</option>
                                                <option style="background-color:#FFDAB9;color: #FFDAB9" value="#FFDAB9">#FFDAB9</option>
                                                <option style="background-color:#CD853F;color: #CD853F" value="#CD853F">#CD853F</option>
                                                <option style="background-color:#FFC0CB;color: #FFC0CB" value="#FFC0CB">#FFC0CB</option>
                                                <option style="background-color:#DDA0DD;color: #DDA0DD" value="#DDA0DD">#DDA0DD</option>
                                                <option style="background-color:#B0E0E6;color: #B0E0E6" value="#B0E0E6">#B0E0E6</option>
                                                <option style="background-color:#800080;color: #800080" value="#800080">#800080</option>
                                                <option style="background-color:#FF0000;color: #FF0000" value="#FF0000">#FF0000</option>
                                                <option style="background-color:#BC8F8F;color: #BC8F8F" value="#BC8F8F">#BC8F8F</option>
                                                <option style="background-color:#4169E1;color: #4169E1" value="#4169E1">#4169E1</option>
                                                <option style="background-color:#8B4513;color: #8B4513" value="#8B4513">#8B4513</option>
                                                <option style="background-color:#FA8072;color: #FA8072" value="#FA8072">#FA8072</option>
                                                <option style="background-color:#F4A460;color: #F4A460" value="#F4A460">#F4A460</option>
                                                <option style="background-color:#2E8B57;color: #2E8B57" value="#2E8B57">#2E8B57</option>
                                                <option style="background-color:#FFF5EE;color: #FFF5EE" value="#FFF5EE">#FFF5EE</option>
                                                <option style="background-color:#A0522D;color: #A0522D" value="#A0522D">#A0522D</option>
                                                <option style="background-color:#C0C0C0;color: #C0C0C0" value="#C0C0C0">#C0C0C0</option>
                                                <option style="background-color:#87CEEB;color: #87CEEB" value="#87CEEB">#87CEEB</option>
                                                <option style="background-color:#6A5ACD;color: #6A5ACD" value="#6A5ACD">#6A5ACD</option>
                                                <option style="background-color:#708090;color: #708090" value="#708090">#708090</option>
                                                <option style="background-color:#FFFAFA;color: #FFFAFA" value="#FFFAFA">#FFFAFA</option>
                                                <option style="background-color:#00FF7F;color: #00FF7F" value="#00FF7F">#00FF7F</option>
                                                <option style="background-color:#4682B4;color: #4682B4" value="#4682B4">#4682B4</option>
                                                <option style="background-color:#D2B48C;color: #D2B48C" value="#D2B48C">#D2B48C</option>
                                                <option style="background-color:#008080;color: #008080" value="#008080">#008080</option>
                                                <option style="background-color:#D8BFD8;color: #D8BFD8" value="#D8BFD8">#D8BFD8</option>
                                                <option style="background-color:#FF6347;color: #FF6347" value="#FF6347">#FF6347</option>
                                                <option style="background-color:#40E0D0;color: #40E0D0" value="#40E0D0">#40E0D0</option>
                                                <option style="background-color:#EE82EE;color: #EE82EE" value="#EE82EE">#EE82EE</option>
                                                <option style="background-color:#F5DEB3;color: #F5DEB3" value="#F5DEB3">#F5DEB3</option>
                                                <option style="background-color:#FFF;color: #FFF" value="#FFF">#FFF</option>
                                                <option style="background-color:#F5F5F5;color: #F5F5F5" value="#F5F5F5">#F5F5F5</option>
                                                <option style="background-color:#FFFF00;color: #FFFF00" value="#FFFF00">#FFFF00</option>
                                                <option style="background-color:#9ACD32;color: #9ACD32" value="#9ACD32">#9ACD32</option>
                                              </select>
                                              <br />
                                              &nbsp; 
                                              <select language="javascript"  class="wenbenkuang"  id="FontSize" title="字号大小" onChange="FormatText('fontsize',this[this.selectedIndex].value);" name="select" onMouseOver="window.status='选择选定文字的字号大小。';return true;" onMouseOut="window.status='';return true;">
                                                <option class="heading" selected>字号 
                                                <option value="7">一号 
                                                <option value="6">二号 
                                                <option value="5">三号 
                                                <option value="4">四号 
                                                <option value="3">五号 
                                                <option value="2">六号 
                                                <option value="1">七号</option>
                                              </select>
                                              <input onClick="setMode(this.checked);" name="viewhtml" type="checkbox" value="ON">
                                              查看HTML源代码<br />
                                               &nbsp; <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/selectall.gif" align="absmiddle" border="0" alt="全部选择" onClick="FormatText('selectall')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/cut.gif"  align="absmiddle" onClick="FormatText('cut')" style="cursor: hand;" alt="剪切"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)"src="images/EditIcon/copy.gif"  align="absmiddle" onClick="FormatText('copy')" style="cursor: hand;" alt="复制"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/paste.gif"  align="absmiddle" onClick="FormatText('paste')" style="cursor: hand;" alt="粘贴"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/DELETE.gif" align="absmiddle" border="0" alt="删除" onClick="FormatText('DELETE')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/undo.gif" align="absmiddle" border="0" alt="撤消" onClick="FormatText('undo')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/redo.gif" align="absmiddle" border="0" alt="恢复" onClick="FormatText('redo')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/bold.gif" align="absmiddle" alt="粗体" onClick="FormatText('bold', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/italic.gif" align="absmiddle" alt="斜体" onClick="FormatText('italic', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/underline.gif" align="absmiddle" alt="下划线" onClick="FormatText('underline', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/ALEFT.gif" align="absmiddle" onClick="FormatText('Justifyleft', '')" style="cursor: hand;" alt="左对齐"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/center.gif" align="absmiddle" border="0" alt="居中" onClick="FormatText('JustifyCenter', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/aright.gif" align="absmiddle" onClick="FormatText('JustifyRight', '')" style="cursor: hand;" alt="右对齐"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/list.gif" align="absmiddle" border="0" alt="项目符号" onClick="FormatText('InsertUnorderedList', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/number.gif" align="absmiddle" alt="编号" border="0" onClick="FormatText('insertorderedlist', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/outdent.gif" align="absmiddle" onClick="FormatText('Outdent', '')" style="cursor: hand;" alt="回退"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/indent.gif" align="absmiddle" border="0" alt="缩进" onClick="FormatText('indent', '')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/line.gif" align="absmiddle" alt="普通水平线" border="0" onClick="FormatText('InsertHorizontalRule', '')"  style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/line.gif" align="absmiddle" alt="特殊水平线" border="0" onClick="hr()"  style="cursor: hand;">  &nbsp; <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/link.gif" align="absmiddle" border="0" alt="超级链接" onClick="FormatText('createLink')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/unlink.gif" align="absmiddle" border="0" alt="取消超级链接" onClick="FormatText('unLink')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/sup.gif" align="absmiddle" border="0" alt="上标" onClick="FormatText('superscript')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/sub.gif" align="absmiddle" border="0" alt="下标" onClick="FormatText('subscript')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/clear.gif" align="absmiddle" border="0" alt="删除文字格式" onClick="FormatText('RemoveFormat')" style="cursor: hand;"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/FIELDSET.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入栏目框" language="javascript" onClick="FIELDSET()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/iframe.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入网页" language="javascript" onClick="iframe()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/table.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入表格" language="javascript" onClick="fortable()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/swf.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入FLASH" language="javascript" onClick="swf()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/mp.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入视频文件，支持格式为：avi、wmv、asf" language="javascript" onClick="wmv()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/real.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入RealPlay文件，支持格式为：rm、ra、ram" language="javascript" onClick="rm()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/image.gif" align="absmiddle" border="0" style="cursor:hand;" alt="插入网上图片，支持格式为：gif、jpg、png、bmp" language="javascript" onClick="pic()"> <img class=None onMouseDown="Check(this,2)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" onMouseUp="Check(this,1)" src="images/EditIcon/help.gif" align="absmiddle" border="0" style="cursor:hand;" alt="使用帮助" language="javascript" onClick="help()">
                                              <!--<a href=javascript:about()><img class=None onmousedown="Check(this,2)" onmouseover="Check(this,1)" onmouseout="Check(this,0)" onmouseup="Check(this,1)" src="Images/EditIcon//about.gif" align="absmiddle" border="0" style="cursor:hand;" alt="关于本系统"></a> 
          <iframe style="top:2px" ID="UploadFiles" src="../upme.htm" frameborder=0 scrolling=no width="360" height="25"></iframe>-->
                                            </td>
                                          </tr>
                                          <tr>
                                            <td align="center"> 
                                              <script language="javascript">
		    	document.write ('<iframe src="../textbox1.asp?action=<%=action%>" id="message" width="412" height="300" align=center></iframe>')
                frames.message.document.designMode = "On";
                </script>
                                            </td>
                                          </tr>
                                          <tr> 
                                            <td align="center"> 
                                              <input type="button" value=" 返 回 " onClick="javascript:history.go(-1)"  class="go-wenbenkuang" name="button">
                                              &nbsp;&nbsp; 
                                              <input type="submit" value=" 修 改 " name="Submit"  class="go-wenbenkuang" onClick="document.form1.Content.value = frames.message.document.body.innerHTML;">
                                              &nbsp; 
                                              <input type="reset" value=" 清 除 " name="Reset"  class="go-wenbenkuang">
                                              <input type="hidden" name="Content" value="">
                                            </td>
                                          </tr>
                                        </table>
                                        <p>&nbsp; </p>
                                      </div>
                                    </td>
                                  </tr>
                                </form>
                              </table>
                              <br />
                            </td>
                          </tr>
                        </table>
<%end select%>
                        <br />
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
