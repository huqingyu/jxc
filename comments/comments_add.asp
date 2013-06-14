<!--#include file="common/conn.asp"-->
<% 
	city = request("txtCity")
	'Response.Write city

	name = request("txtName")
	'Response.Write name
	
	credit = request("txtCredit")
	if credit<>"" then
		credit = clng(credit)
	end if
	'Response.Write credit
	
	gender = request("txtGender")
	'Response.Write gender
	
	tel = request("txtTel")
	'Response.Write tel
	
	email = request("txtEmail")
	'Response.Write email
	
	income = request("txtIncome")
	if income<>"" then
		income = clng(income)
	end if	
	'Response.Write income

	set rs= Server.CreateObject("adodb.recordset")
	sql="select top 1 * from comments"
	rs.open sql,conn,1,3
	rs.addnew
	rs("city")=city
	rs("name")=name
	rs("credit")=credit
	rs("gender")=gender
	rs("tel")=tel
	rs("email")=email
	rs("income")=income
	rs.update
	
	response.Redirect("comments_add_ok.html")
 %>
