<%
if request.Cookies("Gemisum")("username")="" then
  response.write "<script LANGUAGE='javascript'>alert('���糬ʱ��������û�е�¼,���¼��');history.go(-1);</script>"
end if
%>
<!--#include file="../common/conn.asp"-->
<!--#include file="../common/webconfig.asp"-->

<!--#include file="md52.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../style.css" type="text/css">
<title><%=webname%>--����֧��</title>
</head>
<body>
<script>

window.moveTo(300, 150);

window.resizeTo(400, 460);

window.onresize=new Function("window.resizeTo(400, 460);")

</script>
<SCRIPT ID=clientEventHandlersVBS LANGUAGE=vbscript>
<!--
Sub button1_onclick
	window.history.back 
End Sub
-->
</SCRIPT>

<%
	dim v_rcvname,v_rcvaddr,v_rcvtel,v_rcvpost,v_ordername,v_orderemail,v_amount
	dim yy,mm,dd,v_ymd,xiaoshi,fenzhong,miao,BillNo,v_mid,key,v_oid,v_moneytype,v_orderstatus,v_url
	'����������ҳ���ж�����Ϣ
	v_rcvname = replace(Request.Form("v_rcvname"), "'", "''")
	v_rcvaddr = replace(Request.Form("shouhuorendizhi"), "'", "''")
	v_rcvtel = replace(Request.Form("shouhuorendianhua"), "'", "''")
	v_rcvpost = replace(Request.Form("shouhuorenyoubian"), "'", "''")
	v_ordername = replace(Request.Form("dinghuorenxingming"), "'", "''")
	v_orderemail = replace(Request.Form("v_orderemail"), "'", "''")
	v_amount = replace(Request.Form("v_amount"), "'", "''")
	
	'����ϵͳʱ�������������ʽ��YYYYMMDD HHMMSS
	yy=year(date)
	mm=right("00"&month(date),2)
	dd=right("00"&day(date),2)
	v_ymd=yy&mm&dd

	'���ɶ�������������Ԫ��,��ʽΪ��Сʱ�����ӣ���
	xiaoshi=right("00"&hour(time),2)
	fenzhong=right("00"&minute(time),2)
	miao=right("00"&second(time),2)

	'����6λ������BillNo
	BillNo=xiaoshi&fenzhong&miao

	'������ر�Ҫ���������̻��š�˽Կ���Ƽ��ı�׼��ʽ�����š����֡����״̬������url��ַ
	v_mid = ""&B_mid&""
	key = ""&B_key&""
	'����v_oidΪ�����Ƽ���׼������
	v_oid=v_ymd&"-"&v_mid&"-"&BillNo
	v_moneytype = "0" '0Ϊrmb 1Ϊdollor
	v_orderstatus = "0" '0δ���� 1Ϊ����
	v_url="http://"&weburl&"/userinfo/receive.asp" 'Ʃ��http://www.xxx.com/xxx.asp
	
dim iii,ooo
iii=split(v_amount,".")
if ubound(iii)=0 then
v_amount=cstr(v_amount) & ".00"
else
if len(iii(1))=1 then v_amount=cstr(iii(0)) & "." &cstr(iii(1)) & "0"
if len(iii(1))=2 then v_amount=cstr(v_amount)
if len(iii(1))>2 then v_amount=cstr(iii(0)) & "." & left(iii(1),2)
end if

key_key = v_moneytype&v_ymd&v_amount&v_oid&v_mid&v_url&key
'ƴ�մ�����ʹ�������ַ���ĿǰMD5��ASP��asp.net��java�Ȼ����¶����Ĵ�����ƫ������
f=Ucase(trim(md5(key_key)))
'md5.asp�ļ��У�LCase�ǽ��ַ�ת��ΪСд; Ucase�ǽ��ַ�ת��Ϊ��д
'����֧��ƽ̨��MD5ֵֻ�ϴ�д�ַ���������Сд��MD5ֵ��ת��Ϊ��д
%>
<br>
<table border="0" width="85%" align=center>
  <tr>
    <td width="100%" height="44"><div align="center"><img src="images/ad2.gif" width="355" height="60"></div></td>
  </tr>
  <tr>
    <td>����ȷ������Ҫ�ύ��Ԥ�����Ϣ:<br>
      <table border="0" width="100%" align="center"
    bgcolor="#f0f0f0">
        <tr>
          <td align="left" width="56%">�û����������ڱ�վע����û�����</td>
          <td width="44%"><%=v_ordername%> </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><br>
      ���˴�֧���ܽ��Ϊ:<font color=red><%=v_amount%></font> 
      <p>�������������ȷ������ǰ����������֧��ƽ̨���ѡ�</td>
  </tr>
  <form method="post" action="https://pay.chinaebank.cn/select_bank.jsp" name="E_FORM" target=new><tr>
    <td height="35"><div align="center">

    <input type=submit name=v_action value="��������֧��ƽ̨">
    <input type="hidden" name="v_md5info" value="<%=f%>">
    <input type="hidden" name="v_mid" value="<%=v_mid%>">
    <input type="hidden" name="v_oid" value="<%=v_oid%>">
    <input type="hidden" name="v_rcvname" value="<%=v_rcvname%>">
    <input type="hidden" name="v_rcvaddr" value="<%=v_rcvaddr%>">
    <input type="hidden" name="v_rcvtel" value="<%=v_rcvtel%>">
    <input type="hidden" name="v_ymd" value="<%=v_ymd%>">
    <input type="hidden" name="v_rcvpost" value="<%=v_rcvpost%>">
    <input type="hidden" name="v_amount" value="<%=v_amount%>">
    <input type="hidden" name="v_orderstatus"  value="<%=v_orderstatus%>">
    <input type="hidden" name="v_ordername"  value="<%=v_ordername%>">
    <input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
    <input type="hidden" name="v_url" value="<%=v_url%>">
  </div></td>
  </tr></form>
</table>


</body>
</html>