<%
'=================================
'
'           �� �� �� ��
'
'=================================

is_ipcheck	= true			' �Ƿ����÷�ˢ�¹��ܣ�true��ʾ���ã�false��ʾ������

name="kaede"           '����Ա����
password="1120"     '����Ա����

mURL		= "http://hotelreg.net/"	' վ������
mName		= "��֮��"				' վ������
mNameEn		= "hotelreg"			' վ��Ӣ������

if is_ipcheck=true then
	is_echo=cbool(Request.Cookies(mNameEn & "echo")("lao"))
	if is_echo <> true then
	Response.Cookies(mNameEn & "echo")("lao")=true
	Response.Cookies(mNameEn & "echo").Expires=now()+0.01
	end if
end if
%>