
<HTML><HEAD><TITLE>����MediaPlay�ļ�</TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<link rel="stylesheet" type="text/css" href="Style.css"><SCRIPT event=onclick for=Ok language=JavaScript>
  window.returnValue = a.value+"*"+b.value+"*"+c.value+"*"+d.value+"*"+e.value+"*"+f.value+"*"+g.value+"*"+h.value
  window.close();
</SCRIPT>
<script>
function IsDigit()
{
  return ((event.keyCode >= 48) && (event.keyCode <= 57));
}
</script>
</HEAD>
<BODY>
<form name=media>
&nbsp;&nbsp;�ļ���ַ��<input id=a name=a value='http://' style='width:200' title='��ֱ����������MediaPlay�ļ��ĵ�ַ�������ϴ������Զ�����MediaPlay�ļ���ַ' size="20">
����������Ƶ�ļ�֧�ָ�ʽΪ��avi��wmv��asf<br>
&nbsp;&nbsp;�ļ�ע�ͣ�<input id=h name=h style='width:200' title='��ע�ͽ��Զ���ʾ���ļ����·�' size="20">
<br>
&nbsp;&nbsp;�������ţ�<select id=b class="wenbenkuang"><option value="-1">��<option value="0">��</select>
&nbsp;&nbsp;ѭ�����ţ�<select id=c class="wenbenkuang"><option value="-1">��<option value="0">��</select><br>
&nbsp;&nbsp;��ʾ�˵���<select id=d class="wenbenkuang"><option value="-1">��<option value="0">��</select>
&nbsp;&nbsp;�ļ�λ�ã�<select id=g class="wenbenkuang"><option value="left">����<option value="center">����<option value="right">����</select><br>
&nbsp;&nbsp;<font color=red>�������ź���ʾ�˵���Ҫͬʱѡ����</font><br>
&nbsp;&nbsp;���Ÿ߶ȣ�<input id=e class="wenbenkuang" value='352' style='width:50' ONKEYPRESS="event.returnValue=IsDigit();" size="20">&nbsp;&nbsp;���ſ��ȣ�<input id=f value='288' class="wenbenkuang" style='width:50' ONKEYPRESS="event.returnValue=IsDigit();" size="20">
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button  class="go-wenbenkuang"value='����' id=Ok title='��������롱��ť���ڱ༭���в����MediaPlay�ļ�'></form>