<!--#include file="_sql.asp"-->
<%
dim db
db="/zggl_admin/zggl_db/#tinct@zggl_db.asa"
'On Error Resume Next
dim ConnStr,Conn
ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath(db)
'dbpath="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connstr
'If Err Then
'err.Clear
'Set Conn = Nothing
'Response.Write " �����ڵ�λ��:������Conn.asp �����ڵ�λ��:�������á�"
'Response.End
'End If
%>