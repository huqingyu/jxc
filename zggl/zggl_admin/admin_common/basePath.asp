<%
function GetBasePath()
	dim p,l,c
	p = server.mappath("/")
	l = Len(p)
	
	for i=l-1 to 1 step -1
		c = Mid(p, i, 1)
		if c = "/" or c = "\" then
			p=left(p, i)
			exit for
		end if
	next
	
	GetBasePath = p
end function

%>