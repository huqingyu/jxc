<%
' Copyright: seirsoft.com
' xWebEditor - seirsoft在线文本编辑器
' Email:huqingyu@gmail.com

'================================================
' 显示解释函数，返回根据参数允许显示的格式字符串，具体调用方法可从后台管理获得
' 输入参数：
'	s_Content	:	要转换的数据字符串
'	s_Filters	:	要过滤掉的格式集，用逗号分隔多个
'================================================
Function xWebEditor_DeCode(s_Content, sFilters)
	Dim a_Filter, i, s_Result, s_Filters
	xWebEditor_Decode = ""
	If IsNull(s_Content) Then Exit Function
	If s_Content = "" Then Exit Function
	s_Result = s_Content
	s_Filters = sFilters

	' 设置默认过滤
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
// 单个过滤
// 输入参数：
//	s_Content	:	要转换的数据字符串
//	s_Filter	:	要过滤掉的单个格式
//===============================================
function xWebEditor_DecodeFilter(html, filter){
	switch(filter.toUpperCase()){
	case "SCRIPT":		// 去除所有客户端脚本javascipt,vbscript,jscript,js,vbs,event,...
		html = xWebEditor_execRE("</?script[^>]*>", "", html);
		html = xWebEditor_execRE("(javascript|jscript|vbscript|vbs):", "$1：", html);
		html = xWebEditor_execRE("on(mouse|exit|error|click|key)", "<I>on$1</I>", html);
		html = xWebEditor_execRE("&#", "<I>&#</I>", html);
		break;
	case "TABLE":		// 去除表格<table><tr><td><th>
		html = xWebEditor_execRE("</?table[^>]*>", "", html);
		html = xWebEditor_execRE("</?tr[^>]*>", "", html);
		html = xWebEditor_execRE("</?th[^>]*>", "", html);
		html = xWebEditor_execRE("</?td[^>]*>", "", html);
		break;
	case "CLASS":		// 去除样式类class=""
		html = xWebEditor_execRE("(<[^>]+) class=[^ |^>]*([^>]*>)", "$1 $2", html) ;
		break;
	case "STYLE":		// 去除样式style=""
		html = xWebEditor_execRE("(<[^>]+) style=\"[^\"]*\"([^>]*>)", "$1 $2", html);
		break;
	case "XML":			// 去除XML<?xml>
		html = xWebEditor_execRE("<\\?xml[^>]*>", "", html);
		break;
	case "NAMESPACE":	// 去除命名空间<o:p></o:p>
		html = xWebEditor_execRE("<\/?[a-z]+:[^>]*>", "", html);
		break;
	case "FONT":		// 去除字体<font></font>
		html = xWebEditor_execRE("</?font[^>]*>", "", html);
		break;
	case "MARQUEE":		// 去除字幕<marquee></marquee>
		html = xWebEditor_execRE("</?marquee[^>]*>", "", html);
		break;
	case "OBJECT":		// 去除对象<object><param><embed></object>
		html = xWebEditor_execRE("</?object[^>]*>", "", html);
		html = xWebEditor_execRE("</?param[^>]*>", "", html);
		html = xWebEditor_execRE("</?embed[^>]*>", "", html);
		break;
	default:
	}
	return html;
}

// ============================================
// 执行正则表达式替换
// ============================================
function xWebEditor_execRE(re, rp, content) {
	oReg = new RegExp(re, "ig");
	r = content.replace(oReg, rp);
	return r; 
}

</Script>