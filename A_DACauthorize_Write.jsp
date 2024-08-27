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
String user=request.getParameter("uname");
String status=request.getParameter("status");

String sql="";
Statement st=connection.createStatement();

if(status.equalsIgnoreCase("No")){
String st1="Permited";
sql="UPDATE userdacrequest SET wr='"+st1+"' where username='"+user+"' and id="+id+" ";
st.executeUpdate(sql);

}


response.sendRedirect("A_ViewDACReq.jsp");

%>

</body>
</html>