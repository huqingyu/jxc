<% 
Dim Query_Badword,Form_Badword,i,Err_Message,Err_Web,name

Err_Message = 1
'����ʽ��1=��ʾ��Ϣ,2=ת��ҳ��,3=����ʾ��ת��

Err_Web = "Err.Asp"	

Query_Badword="'��and��select��update��chr��delete��%20from��;��insert��mid��master.��set��chr(37)��="     

'���ⲿ�ݶ���get�Ƿ�����,ʹ��"��"�ż��     
Form_Badword="'��%��&��*��#��(��)��=" 

'----- filter get query
if request.QueryString<>"" then
	Chk_badword=split(Query_Badword,"��")
	for EACH Query_Name IN Request.QueryString
		for i=0 to ubound(Chk_badword)
		If Instr(LCase(request.QueryString(Query_Name)),Chk_badword(i))<>0 Then
		Select Case Err_Message
			Case "1"
			Response.Write "<Script Language=JavaScript>alert(' �����ڵ�λ��: "&name&" �����ڵ�λ��:�ַ�����\n\n �����ڵ�λ��:���֣�and update delete ; insert mid master �ȷǷ��ַ���');window.close();</Script>"
			Case "2"
			Response.Write "<Script Language=JavaScript>location.href='"&Err_Web&"'</Script>"
			Case "3"
			Response.Write "<Script Language=JavaScript>alert(' �����ڵ�λ��: "&name&" �����ڵ�λ��:�ַ�����\n\n �����ڵ�λ��:���֣�and update delete ; insert mid master �ȷǷ��ַ���');location.href='"&Err_Web&"';</Script>"
		End Select
		Response.End
		End If
		NEXT
	NEXT
End if

'----- filter post query
if request.form<>"" then
	Chk_badword=split(Form_Badword,"��")
	for EACH name IN Request.Form
		for i=0 to ubound(Chk_badword)
		If Instr(LCase(request.form(name)),Chk_badword(i))<>0 Then
		Select Case Err_Message
			Case "1"
			Response.Write "<Script Language=JavaScript>alert('�����ˣ��� "&name&" �����ڵ�λ��:�ַ�����\n\n �����ڵ�λ��:���֣� % & * # ( ) �ȷǷ��ַ���');window.close();</Script>"
			Case "2"
			Response.Write "<Script Language=JavaScript>location.href='"&Err_Web&"'</Script>"
			Case "3"
			Response.Write "<Script Language=JavaScript>alert('�����ˣ����� "&name&" �����ڵ�λ��:�ַ�����\n\n �����ڵ�λ��:���֣� % & * # ( )  �ȷǷ��ַ���');location.href='"&Err_Web&"';</Script>"
		End Select
		Response.End
		End If
		NEXT
	NEXT
end if
%>
