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
		title="旅游景点"
		case "70"
		title="旅游指南"
		case "73"
		title="海南特产"
		case "75"
		title="会议考察"
		case "76"
		title="旅游常识"
	End Select

	GetNewsTitle = title
End Function
%>
