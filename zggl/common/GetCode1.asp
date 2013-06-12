<%
Call Com_CreatValidCode("ValidCode")

Sub Com_CreatValidCode(pSN)

Response.Expires = -9999 
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","no-cache must-revalidate"
Response.ContentType = "image/BMP"

Randomize

Dim i, ii, iii

Const cOdds = 6 	' noise radom %
Const cAmount = 10 	' total chars
Const cCode = "0123456789"

Dim vColorData(10)
vColorData(0) = ChrB(110) & ChrB(255) & ChrB(255) ' background-color: yellow
vColorData(1) = ChrB(255) & ChrB(255) & ChrB(0) ' background-color: yellow
vColorData(2) = ChrB(255) & ChrB(0) & ChrB(0)  ' color : blue
vColorData(3) = ChrB(33) & ChrB(66) & ChrB(99)  ' color : red
vColorData(4) = ChrB(66) & ChrB(100) & ChrB(100)  ' color : black
vColorData(5) = ChrB(33) & ChrB(33) & ChrB(255)  ' color : red
vColorData(6) = ChrB(66) & ChrB(66) & ChrB(66)  ' color : red

' radom chars
Dim vCode(4), vCodes
For i = 0 To 3
  vCode(i) = Int(Rnd * cAmount)
  vCodes = vCodes & Mid(cCode, vCode(i) + 1, 1)
Next

session("GetCode")=vCodes   ' set Session

' 0-9
Dim vNumberData(35)
vNumberData(0) = "1100000011" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1001111001" &_
				 "1100000011"
				 
vNumberData(1) ="1111000111" &_
				"1100000111" &_
				"1111000111" &_
				"1111000111" &_
				"1111000111" &_
				"1111000111" &_
				"1111000111" &_
				"1111000111" &_
				"1111000111" &_
				"1110000011"
				
vNumberData(2) ="1100000001" &_                                                                               
				"1111111001" &_
				"1111111001" &_
				"1111111001" &_
				"1100000001" &_
				"1100000001" &_
				"1100111111" &_
				"1100111111" &_
				"1100111111" &_
				"1100000001"
				
vNumberData(3) ="1000000001" &_                                                                               
				"1111111001" &_
				"1111111001" &_
				"1111111001" &_
				"1000000001" &_
				"1000000001" &_
				"1111111001" &_
				"1111111001" &_
				"1111111001" &_
				"1000000001"
				
vNumberData(4) ="1111100111" &_                                                                               
				"1111000111" &_
				"1110000111" &_
				"1100100111" &_
				"1001100111" &_
				"1001100111" &_
				"1000000001" &_
				"1110000001" &_
				"1111100111" &_
				"1111000011"
				
vNumberData(5) ="1000000001" &_                                                                               
				"1011111111" &_
				"1011111111" &_
				"1000000001" &_
				"1000000001" &_
				"1111111101" &_
				"1111111101" &_
				"1111111101" &_
				"1111111101" &_
				"1000000001"
				
vNumberData(6) ="1000000001" &_
				"1000111111" &_
				"1000111111" &_
				"1000111111" &_
				"1000000001" &_
				"1000000001" &_
				"1000111001" &_
				"1000111001" &_
				"1000111001" &_
				"1000000001"
				
vNumberData(7) ="1000000001" &_                                                                               
				"1000000001" &_
				"1111110001" &_
				"1111110001" &_
				"1111110001" &_
				"1111110001" &_
				"1111110001" &_
				"1111110001" &_
				"1111110001" &_
				"1111110001"
				
vNumberData(8) ="1100000011" &_                                                                               
				"1001111001" &_
				"1001111001" &_
				"1001111001" &_
				"1000000011" &_
				"1001111011" &_
				"1001111001" &_
				"1001111001" &_
				"1001111001" &_
				"1100000011"
				
vNumberData(9) ="1000000001" &_                                                                               
				"1000000001" &_
				"1001111001" &_
				"1001111001" &_
				"1000000001" &_
				"1000000001" &_
				"1111111001" &_
				"1111111001" &_
				"1000000001" &_
				"1000000001"
                                                                                                               
Dim width, height, totalSize, ts1, ts2                                                                         

width=40
height=15

'totalSize = width*height*3+54
ts1=62 ' totalSize mod 256
ts2=7	' totalSize / 256

tts1=8	
tts2=7



' output IMG file header (14-bits)
Response.BinaryWrite ChrB(66) & ChrB(77) & ChrB(ts1) & ChrB(ts2) &_
  ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_
  ChrB(0) & ChrB(0) & ChrB(54) & ChrB(0) & ChrB(0) & ChrB(0) 

' output IMG info header (40-bits)
Response.BinaryWrite ChrB(40) & ChrB(0) & ChrB(0) & ChrB(0) &_
  ChrB(width) & ChrB(0) & ChrB(0) & ChrB(0) &_
  ChrB(height) & ChrB(0) & ChrB(0) & ChrB(0) &_
  ChrB(1) & ChrB(0) & ChrB(24) & ChrB(0) &_
  ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_
  ChrB(tts1) & ChrB(tts2) & ChrB(0) & ChrB(0) &_
  ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) &_
  ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) &_
  ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0)

  
dim f1
Randomize

f1 = Round(100.0 * (20.0)/40.0)

For i = 1 to 0 Step -1
isFirst = true
For ii = 39 to 0 Step -1
	tmpf1 = Round(100.0 * (i+1.0) / (ii+1.0))
	if isFirst and tmpf1 > f1 then
		Response.BinaryWrite vColorData(5)
		isFirst = false
	else
		Response.BinaryWrite vColorData(Rnd*1)
	End if
Next
Next

For i = 9 To 0 Step -1  ' rows
	isFirst=true
	For ii = 0 To 3  ' chars
		For iii = 1 To 10 ' pix
			tmpf1 = Round(100.0 * (i+3.0) / (iii+11.0 + ii*10.0))
			if isFirst and tmpf1 > f1 then
				Response.BinaryWrite vColorData(5)
				isFirst=false
			else
			
	
				If Rnd * 99 + 1 < cOdds Then ' radom noise
				
					Response.BinaryWrite vColorData(Rnd*1)
				Else
					dim data
					data = Mid(vNumberData(vCode(ii)), i * 10 + iii, 1)
					if data = "1" then
						Response.BinaryWrite vColorData(Rnd*1)
					else
						Response.BinaryWrite vColorData(2+Rnd*4)
					end if
				End If
			
			End if
		Next
	Next
Next

For i = 2 to 0 Step -1
isFirst = true
For ii = 39 to 0 Step -1
	tmpf1 = Round(100.0 * (i+1.0) / (ii+1.0))
	if isFirst and tmpf1 = f1 then
		Response.BinaryWrite vColorData(5)
		isFirst = false
	else
		Response.BinaryWrite vColorData(Rnd*1)
	end if
Next
Next

END SUB
%>
