<%
'=============================================
'����:LastNextPage
'����:��ҳ�ĵ���
'=============================================
Sub LastNextPage(pagecount,page,resultcount)
Dim query, a, x, temp
action = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("SCRIPT_NAME")
query = Split(Request.ServerVariables("QUERY_STRING"), "&")
For Each x In query
     a = Split(x, "=")
     If StrComp(a(0), "page", vbTextCompare) <> 0 Then
         temp = temp & a(0) & "=" & a(1) & "&"
     End If
Next

Response.Write("<table cellspacing=0 cellpadding=0 border=0>" & vbCrLf )  
Response.Write("<form method=get onsubmit=""document.location = '" & action & "?" & temp & "Page='+ this.page.value;return false;""><TR>" & vbCrLf )
Response.Write("<TD align=right>" & vbCrLf )
' Response.Write(font_style & vbCrLf ) 
  
if page<=1 then
  Response.Write ("��ҳ " & vbCrLf)  
  Response.Write ("��һҳ " & vbCrLf)
else  
  Response.Write("<A HREF=" & action & "?" & temp & "Page=1>��ҳ</A> " & vbCrLf)
  Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page-1) & ">��һҳ</A> " & vbCrLf)
end if

if page>=pagecount then
  Response.Write ("��һҳ " & vbCrLf)
  Response.Write ("βҳ" & vbCrLf)   
else
  Response.Write("<A HREF=" & action & "?" & temp & "Page=" & (Page+1) & ">��һҳ</A> " & vbCrLf)
  Response.Write("<A HREF=" & action & "?" & temp & "Page=" & pagecount & ">βҳ</A>" & vbCrLf)   
end if
  
Response.Write(" ��" & "&nbsp;<INPUT TYEP=TEXT NAME=page SIZE=2 Maxlength=4 VALUE=" & page & ">&nbsp;" & "ҳ"  & vbCrLf & "<INPUT type=submit value=GO>")
Response.Write(" �� " & pageCount & " ҳ" &  vbCrLf)   
Response.Write(" " & resultcount & " ����Ϣ" &  vbCrLf)   
Response.Write("</TD>" & vbCrLf )    
Response.Write("</TR></form>" & vbCrLf )  
Response.Write("</table>" & vbCrLf )  
End Sub
%>