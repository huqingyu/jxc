<%
function zk(values)
if values>=0 then
   v=10
end if
if values>=1000 then
   v=9.5
end if
if values>=2000 then
   v=9
end if
if values>=3000 then
   v=8.5
end if
if values>=4000 then
   v=8
end if      
response.Write int(v)
end function
%>