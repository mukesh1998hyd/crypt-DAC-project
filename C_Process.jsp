<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <%
  try 
	{
      		String id=request.getParameter("id");
      		String fname=request.getParameter("fname");
      		String sts=request.getParameter("sts");      		
String query="select * from cloudserver where fname='"+fname+"' "; 
Statement st5=connection.createStatement();
ResultSet rs=st5.executeQuery(query);

if ( rs.next() )
{
int i=rs.getInt(1);
String mac=rs.getString(5);
String sk=rs.getString(6);
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      	
			 Statement st=connection.createStatement();
	
			if(sts.equalsIgnoreCase("No"))
			{
				String resp="Yes";
				
				Statement stss=connection.createStatement();
stss.executeUpdate("Update userrequest set resdate='"+dt+"', resstatus='"+resp+"',mac='"+mac+"',secretkey='"+sk+"' where id='"+id+"' ; "); 
			
			}
			if(sts.equalsIgnoreCase("Yes"))
			{
				String resp="No";
				mac="req";
				sk="req";
				Statement stss=connection.createStatement();
stss.executeUpdate("Update userrequest set resdate='"+dt+"', resstatus='"+resp+"',mac='"+mac+"',secretkey='"+sk+"' where id='"+id+"' ; "); 
			

			}
      		
      		response.sendRedirect("C_ViewReq.jsp");
	
%>
<%

}

           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
            e.printStackTrace();
          }
%>
</body>
</html>