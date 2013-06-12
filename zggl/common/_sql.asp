<% 
Dim Query_Badword,Form_Badword,i,Err_Message,Err_Web,name

Err_Message = 1
'处理方式：1=提示信息,2=转向页面,3=先提示再转向

Err_Web = "Err.Asp"	

Query_Badword="'∥and∥select∥update∥chr∥delete∥%20from∥;∥insert∥mid∥master.∥set∥chr(37)∥="     

'在这部份定义get非法参数,使用"∥"号间隔     
Form_Badword="'∥%∥&∥*∥#∥(∥)∥=" 

'----- filter get query
if request.QueryString<>"" then
	Chk_badword=split(Query_Badword,"∥")
	for EACH Query_Name IN Request.QueryString
		for i=0 to ubound(Chk_badword)
		If Instr(LCase(request.QueryString(Query_Name)),Chk_badword(i))<>0 Then
		Select Case Err_Message
			Case "1"
			Response.Write "<Script Language=JavaScript>alert(' 您现在的位置: "&name&" 您现在的位置:字符串！\n\n 您现在的位置:出现：and update delete ; insert mid master 等非法字符！');window.close();</Script>"
			Case "2"
			Response.Write "<Script Language=JavaScript>location.href='"&Err_Web&"'</Script>"
			Case "3"
			Response.Write "<Script Language=JavaScript>alert(' 您现在的位置: "&name&" 您现在的位置:字符串！\n\n 您现在的位置:出现：and update delete ; insert mid master 等非法字符！');location.href='"&Err_Web&"';</Script>"
		End Select
		Response.End
		End If
		NEXT
	NEXT
End if

'----- filter post query
if request.form<>"" then
	Chk_badword=split(Form_Badword,"∥")
	for EACH name IN Request.Form
		for i=0 to ubound(Chk_badword)
		If Instr(LCase(request.form(name)),Chk_badword(i))<>0 Then
		Select Case Err_Message
			Case "1"
			Response.Write "<Script Language=JavaScript>alert('出错了！表单 "&name&" 您现在的位置:字符串！\n\n 您现在的位置:出现： % & * # ( ) 等非法字符！');window.close();</Script>"
			Case "2"
			Response.Write "<Script Language=JavaScript>location.href='"&Err_Web&"'</Script>"
			Case "3"
			Response.Write "<Script Language=JavaScript>alert('出错了！参数 "&name&" 您现在的位置:字符串！\n\n 您现在的位置:出现： % & * # ( )  等非法字符！');location.href='"&Err_Web&"';</Script>"
		End Select
		Response.End
		End If
		NEXT
	NEXT
end if
%>
