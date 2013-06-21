<!--#include file="_sql.asp"-->
<!--#include file="basePath.asp"-->
<%
dim db
db= GetBasePath() & "db\#tinct@zggl_db.asa"
'On Error Resume Next
dim ConnStr,Conn
ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & db
'dbpath="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnStr
'Response.Write ConnStr
%>