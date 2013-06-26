<!--#include file="_sql.asp"-->
<!--#include file="basePath.asp"-->
<%
dim db,ConnStr,Conn

db= GetBasePath() & "db/#tinct@zggl_db.mdb"
'On Error Resume Next

ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & db
'dbpath="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open ConnStr
'Response.Write ConnStr
%>