<title>Authentication Page</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>

<%
	String name = request.getParameter("userid");
	String pass = request.getParameter("pass");
String stat="Accepted";
String status="Authorized";


	try {
		application.setAttribute("ename", name);
		String sql = "SELECT * FROM user where name='" + name
				+ "' and pass='" + pass + "'   and status='"+status+"' ";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			int i = rs.getInt(1);

				response.sendRedirect("UserMain.jsp");

			} else {
				response.sendRedirect("U_Wrong_Login.jsp");
			}
	} catch (Exception e) {
		out.print(e);
		e.printStackTrace();
	}
%>