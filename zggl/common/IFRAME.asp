<HTML>
<HEAD><title>插入网页文件</title>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<link rel="stylesheet" type="text/css" href="Style.css">
<SCRIPT event=onclick for=Ok language=JavaScript>
  window.returnValue = a.value+"*"+b.value+"*"+c.value+"*"+d.value+"*"+e.value
  window.close();
</SCRIPT>
<script>
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
</script>
<BODY>
<FORM name=ifrm>
<IFRAME name=ad src="../upme3.htm" frameBorder=0 width="100%" scrolling=no height=20></IFRAME>
<BR>&nbsp;&nbsp;网页类型：htm,mht，上传限制：2000K。<BR>&nbsp;&nbsp;网页地址：<INPUT 
id=a title=可直接输入网上网页的地址，或由上传程序自动产生网页地址 style="WIDTH: 200px" value="" 
name=a class="wenbenkuang" size="20"><BR>&nbsp;&nbsp;滚 动 条：<select id=b  class="wenbenkuang"><option value=noshade>无<option value=yes>有</select>
边框线: <select id=c  class="wenbenkuang"><option value=0>无<option value=1>有</select><br>
  &nbsp;&nbsp;上下边距：<input id=d  class="wenbenkuang" maxlength=2 size=2 ONKEYPRESS="event.returnValue=IsDigit();" name="1" >上下边距必须填写数字,范围在1-99之间<br>
  &nbsp;&nbsp;左右边距：<input id=e  class="wenbenkuang" maxlength=2 size=2 ONKEYPRESS="event.returnValue=IsDigit();" name="2" >左右边距必须填写数字,范围在1-99之间<br>
  <BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT id=Ok title=点击“插入”按钮，在编辑器中插入该图片   class="go-wenbenkuang" type=button value=插入></FORM></BODY>
  </HTML>