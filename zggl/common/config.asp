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
		title="����"
		case "70"
		title="����ָ��"
		case "73"
		title="�߶���"
		case "75"
		title="����"
		case "76"
		title="���γ�ʶ"
		case "82"
		title="�⳵"
	End Select

	GetNewsTitle = title
End Function
%>
