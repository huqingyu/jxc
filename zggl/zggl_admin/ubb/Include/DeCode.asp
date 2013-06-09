<%
' Copyright: seirsoft.com
' xWebEditor - seirsoft�����ı��༭��
' Email:huqingyu@gmail.com

'================================================
' ��ʾ���ͺ��������ظ��ݲ���������ʾ�ĸ�ʽ�ַ�����������÷����ɴӺ�̨������
' ���������
'	s_Content	:	Ҫת���������ַ���
'	s_Filters	:	Ҫ���˵��ĸ�ʽ�����ö��ŷָ����
'================================================
Function xWebEditor_DeCode(s_Content, sFilters)
	Dim a_Filter, i, s_Result, s_Filters
	xWebEditor_Decode = ""
	If IsNull(s_Content) Then Exit Function
	If s_Content = "" Then Exit Function
	s_Result = s_Content
	s_Filters = sFilters

	' ����Ĭ�Ϲ���
	If sFilters = "" Then s_Filters = "script,object"

	a_Filter = Split(s_Filters, ",")
	For i = 0 To UBound(a_Filter)
		s_Result = xWebEditor_DecodeFilter(s_Result, a_Filter(i))
	Next
	xWebEditor_DeCode = s_Result
End Function

%>

<Script Language=JavaScript RunAt=Server>
//===============================================
// ��������
// ���������
//	s_Content	:	Ҫת���������ַ���
//	s_Filter	:	Ҫ���˵��ĵ�����ʽ
//===============================================
function xWebEditor_DecodeFilter(html, filter){
	switch(filter.toUpperCase()){
	case "SCRIPT":		// ȥ�����пͻ��˽ű�javascipt,vbscript,jscript,js,vbs,event,...
		html = xWebEditor_execRE("</?script[^>]*>", "", html);
		html = xWebEditor_execRE("(javascript|jscript|vbscript|vbs):", "$1��", html);
		html = xWebEditor_execRE("on(mouse|exit|error|click|key)", "<I>on$1</I>", html);
		html = xWebEditor_execRE("&#", "<I>&#</I>", html);
		break;
	case "TABLE":		// ȥ�����<table><tr><td><th>
		html = xWebEditor_execRE("</?table[^>]*>", "", html);
		html = xWebEditor_execRE("</?tr[^>]*>", "", html);
		html = xWebEditor_execRE("</?th[^>]*>", "", html);
		html = xWebEditor_execRE("</?td[^>]*>", "", html);
		break;
	case "CLASS":		// ȥ����ʽ��class=""
		html = xWebEditor_execRE("(<[^>]+) class=[^ |^>]*([^>]*>)", "$1 $2", html) ;
		break;
	case "STYLE":		// ȥ����ʽstyle=""
		html = xWebEditor_execRE("(<[^>]+) style=\"[^\"]*\"([^>]*>)", "$1 $2", html);
		break;
	case "XML":			// ȥ��XML<?xml>
		html = xWebEditor_execRE("<\\?xml[^>]*>", "", html);
		break;
	case "NAMESPACE":	// ȥ�������ռ�<o:p></o:p>
		html = xWebEditor_execRE("<\/?[a-z]+:[^>]*>", "", html);
		break;
	case "FONT":		// ȥ������<font></font>
		html = xWebEditor_execRE("</?font[^>]*>", "", html);
		break;
	case "MARQUEE":		// ȥ����Ļ<marquee></marquee>
		html = xWebEditor_execRE("</?marquee[^>]*>", "", html);
		break;
	case "OBJECT":		// ȥ������<object><param><embed></object>
		html = xWebEditor_execRE("</?object[^>]*>", "", html);
		html = xWebEditor_execRE("</?param[^>]*>", "", html);
		html = xWebEditor_execRE("</?embed[^>]*>", "", html);
		break;
	default:
	}
	return html;
}

// ============================================
// ִ��������ʽ�滻
// ============================================
function xWebEditor_execRE(re, rp, content) {
	oReg = new RegExp(re, "ig");
	r = content.replace(oReg, rp);
	return r; 
}

</Script>