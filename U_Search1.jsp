<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%> <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>search</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style14 {color: #00FF00}
.style19 {color: #FFFF00; font-weight: bold; font-style: italic; }
.style20 {color: #FF0000}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="U_Upload.jsp"><span>Upload</span></a></li>
         
		   <li><a href="CloudDataServer.jsp"><span>Cloud Data Server </span></a></li>
           
           <li><a href="DataOwner.jsp"><span>Data Owner </span></a></li>
           <li class="active"><a href="EndUser.jsp"><span>Data User </span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"><a href="#"><img src="images/slide1.jpg" width="940" height="271" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="940" height="271" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="940" height="271" alt="" /></a></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
        <div class="article">
          <h2>&nbsp;</h2>
          <h2>&nbsp;</h2>
          <h2 align="center">View<span class="style14"> Top k Searched Files By Keyword</span></h2>
          <p align="center" class="infopost">&nbsp;</p>
          <div class="clr"></div>
           <table width="625" border="1" align="center">
            <tr>
              <td width="86" height="29" bgcolor="#FF0000"><div align="center" class="style19"><span class="style4 ">File ID </span></div></td>
              <td width="204" bgcolor="#FF0000"><div align="center" class="style19"><span class="style4">File Name </span></div></td>
              <td width="97" bgcolor="#FFFFFF"><div align="center" class="style19"><span class="style4 style20">Rank </span></div></td>
              <td width="210" bgcolor="#FF0000"><div align="center" class="style19"><span class="style4">Download</span></div></td>
			  
		<%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          String keyword = request.getParameter("t14");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		String search = new String(Base64.encode(keyword.getBytes()));
			String per ="";	
      		String uname=(String)application.getAttribute("ename");
      		
			String yes="Yes";
			
			String query1="select * from searchrequest  where uname='"+uname+"' and res='"+yes+"'"; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
		
						
		   	
	if ( rs1.next() )
	   {
			per="Yes";
			
      		String query="select * from cloudserver order by rank desc"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(3);// Fname
		s3=rs.getString(7);//rank
		s4=rs.getString(4); //desc
		
		c.init(Cipher.DECRYPT_MODE,key);
		String decryptedValue = new String(Base64.decode(s4.getBytes()));
			
      	
	   
		if(decryptedValue.toLowerCase().contains(keyword.toLowerCase()))
		{
			String strQuery1 = "select * from cloudserver where fname='"+s2+"'";
			ResultSet rs11 = connection.createStatement().executeQuery(strQuery1);
			{
			if(rs11.next()==true)
			{
				String rank=rs11.getString(7);
				int updaterank = Integer.parseInt(rank)+1;
				String strQuery2 = "update cloudserver set rank='"+updaterank+"' where fname='"+s2+"'";
				connection.createStatement().executeUpdate(strQuery2);
			}
			}
			
			
		%>
            <tr>
              <td height="28"><div align="center"><%=i%></div></td>
              <td><div align="center"><%=s2%></div></td>
              <td bgcolor="#FFFFFF"><div align="center"><%=s3%></div></td>
              <td><div align="center"><a href="U_Search_Download.jsp?Fname=<%=s2%>"> <%=s2%> </a></div></td>
            </tr>
            <%
			
			}else
	   {
	   		
	   }
	   }
	  }
	  
	  else
	   {
	   per="No";
	   
	  
	  %>
	  
	   <p><h2>You Don't Have Permission To Access !!!</h2></p><br />
						
	   		
	<%  
	
	
		 }
	
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
          </table>
           <p>&nbsp;</p>
           <p>&nbsp;</p>
           <p><a href="UserMain.jsp">Go Back</a>
          </p>
           <div class="clr"></div>
        </div>
       
      </div>
    
      <div class="clr"></div>
    </div>
  </div>
   <div class="fbg">
    <div class="fbg_resize">
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>