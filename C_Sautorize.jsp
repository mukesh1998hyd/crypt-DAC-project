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
String uname=request.getParameter("uname");
String status=request.getParameter("status");

out.print(uname+status);

String sql="";
Statement st=connection.createStatement();

if(status.equalsIgnoreCase("No")){
String st1="Yes";
sql="UPDATE searchrequest SET res='"+st1+"' where uname='"+uname+"'";
st.executeUpdate(sql);

}


response.sendRedirect("C_ViewSearchReq.jsp");

%>

</body>
</html>