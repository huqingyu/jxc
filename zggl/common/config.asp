<%
function GetNewsTitle(tp)
	dim title
	select case tp
		case "63"
		title="公告信息"
		case "64"
		title="新闻中心"
		case "66"
		title="签证"
		case "67"
		title="景区"
		case "70"
		title="旅游指南"
		case "73"
		title="高尔夫"
		case "75"
		title="会议"
		case "76"
		title="旅游常识"
		case "82"
		title="租车"
	End Select

	GetNewsTitle = title
End Function
%>
