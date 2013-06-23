<%
dim webname,webemail,dizhi,youbian,dianhua,copyright,webbanner,weblogo,weburl,gonggao

set rs=server.CreateObject("adodb.recordset")
rs.Open "select B_mid,B_Key,gonggao from config",conn,1,1
webname="中国国旅CITS-海南省中国国际旅行社"
B_mid=trim(rs("B_mid"))
B_Key=trim(rs("B_Key"))
gonggao=trim(rs("gonggao"))
rs.Close
set rs=nothing

Rem 过滤HTML代码
function HTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(9), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
    fString = Replace(fString, CHR(10), "<BR> ")

    'fString=ChkBadWords(fString)
    HTMLEncode = fString
else
   HTMLEncode=fstring
end if
end function

Rem 过滤SQL非法字符
function checkStr(str)
	if isnull(str) then
		checkStr = ""
		exit function 
	end if
	checkStr=replace(str,"'","''")
end function

Rem 判断数字是否整形
function isInteger(para)
       on error resume next
       dim str
       dim l,i
       if isNUll(para) then 
          isInteger=false
          exit function
       end if
       str=cstr(para)
       if trim(str)="" then
          isInteger=false
          exit function
       end if
       l=len(str)
       for i=1 to l
           if mid(str,i,1)>"9" or mid(str,i,1)<"0" then
              isInteger=false 
              exit function
           end if
       next
       isInteger=true
       if err.number<>0 then err.clear
end function
%>