<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.Statement"%>
<%@include file="connect.jsp" %><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
String status=request.getParameter("st");

String sql="";
Statement st=connection.createStatement();

if(status.equalsIgnoreCase("Waiting")){
String st1="Authorized";
sql="UPDATE owner SET status='"+st1+"' where id='"+id+"'";
}
if(status.equalsIgnoreCase("Authorized")){
	String st2="Waiting";
	sql="UPDATE owner SET status='"+st2+"' where id='"+id+"'";
	}
st.executeUpdate(sql);

response.sendRedirect("C_ViewOwner.jsp");

%>

</body>
</html>