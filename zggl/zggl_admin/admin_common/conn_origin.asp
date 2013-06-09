<%
dim db
db="/admin/database/#tianen@hauudata.asa"

dim ConnStr,Conn
ConnStr ="driver={Microsoft Access Driver (*.mdb)};dbq=" & server.mappath(db)
'dbpath="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connstr

%>