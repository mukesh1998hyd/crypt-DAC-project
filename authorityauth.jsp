<title>Authentication Page</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%
	String name = request.getParameter("userid");
	String pass = request.getParameter("pass");


	try {
	%>
	<h2>On sec</h2>
	<%

		String sql = "SELECT * FROM onsec_authority where username='" + name
				+ "' and password='" + pass + "' ";
		Statement stmt = connection.createStatement();
		%>
		<h2>On secttttt <%=sql %></h2>
		<%

		ResultSet rs = stmt.executeQuery(sql);
		String utype = "";
		out.print("aaa");
		SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdf1=new SimpleDateFormat("HH:mm:ss");
		Date d=new Date();
		Date d1=new Date();
		
		String dt1=sdf.format(d);
		String dt2=sdf1.format(d1);
		
		String dt=dt1+" "+dt2;
		application.setAttribute("LinA",dt);
		if (rs.next()) {
			
			stmt.executeUpdate("INSERT INTO onsec_aalog (name,login) value('"+name+"','"+dt+"')");

				response.sendRedirect("AttributeAMain.jsp");

			} else {
			response.sendRedirect("wronglogin.html");

	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

