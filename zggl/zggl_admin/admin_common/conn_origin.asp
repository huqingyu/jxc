<!--#include file="basePath.asp"-->
<%
dim db
db= GetBasePath() & "db/#tinct@zggl_db.asa"

dim ConnStr,Conn
'ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath(db)
ConnStr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & db

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connstr

%>