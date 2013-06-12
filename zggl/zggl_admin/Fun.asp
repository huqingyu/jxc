<%
'取酒店名
Function GetHotelName(ZZID)
	
	if trim(ZZID)="" then
   		exit Function
  	end if 
  	
	set rec=server.createobject("adodb.recordset")
	strsql="select c_name from hotelb where Id=" & ZZID & ""
	rec.open strsql,conn,1,1
  	
  	If Not rec.Eof Then
  		GetHotelName=rec("c_name")
  	Else
  		GetHotelName=""
  	End IF

  	rec.close
End Function

'取房型名
Function GetRoomName(ZZID)
	
	if trim(ZZID)="" then
   		exit Function
  	end if 
  	
	set rec=server.createobject("adodb.recordset")
	strsql="select type from roomb where Id=" & ZZID & ""
	rec.open strsql,conn,1,1
  	
  	If Not rec.Eof Then
  		GetRoomName=rec("type")
  	Else
  		GetRoomName=""
  	End IF

  	rec.close
End Function
%>