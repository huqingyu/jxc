<%
function GetNewsTitle(tp)
	dim title
	select case tp
		case "63"
		title="������Ϣ"
		case "64"
		title="��������"
		case "66"
		title="ǩ֤"
		case "67"
		title="���ξ���"
		case "70"
		title="����ָ��"
		case "73"
		title="�����ز�"
		case "75"
		title="���鿼��"
		case "76"
		title="���γ�ʶ"
	End Select

	GetNewsTitle = title
End Function
%>
