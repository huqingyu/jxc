<!--#include file="sql.asp" -->
<%
Dim db, connstr, conn

db="admin/cm_db/#seirsoft@cm_db.mdb"

'connstr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath(db)
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connstr
%>