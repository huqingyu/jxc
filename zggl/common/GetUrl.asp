<%
On Error Resume Next 
Server.ScriptTimeOut=9999999

Function getHTTPPage(url)
	dim http
	set http=createobject("MSXML2.XMLHTTP")
	Http.open "GET",url,false
	Http.send()
	if Http.readystate<>4 then 
	exit Function
	end if
	getHTTPPage=bytes2BSTR(Http.responseBody)
	set http=nothing
	if err.number<>0 then err.Clear 
End Function

Function bytes2BSTR(vIn)
	dim strReturn
	dim i,ThisCharCode,NextCharCode
	strReturn = ""
	For i = 1 To LenB(vIn)
	ThisCharCode = AscB(MidB(vIn,i,1))
	If ThisCharCode < &H80 Then
	strReturn = strReturn & Chr(ThisCharCode)
	Else
	NextCharCode = AscB(MidB(vIn,i+1,1))
	strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
	i = i + 1
	End If
	Next
	bytes2BSTR = strReturn
End Function
%>