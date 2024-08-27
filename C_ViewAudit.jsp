<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Audit</title>
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
.style3 {color: #69BCCE}
.style7 {font-family: "Courier New", Courier, monospace}
.style8 {font-family: "Times New Roman", Times, serif; font-weight: bold; font-size: 14px; color: #330033; }
.style9 {
	color: #FF0000;
	font-weight: bold;
}
.style11 {font-family: "Courier New", Courier, monospace; color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li><a href="CloudDataServer.jsp"><span>Home Page</span></a></li>
          <li class="active"><a href="CloudAuditServer.jsp"><span>Cloud Audit Server </span></a></li>
		   <li><a href="CloudDataServer.jsp"><span>Cloud Data Server </span></a></li>
           <li><a href="TPA.jsp"><span>TPA</span></a></li>
           <li><a href="DataOwner.jsp"><span>Data Owner </span></a></li>
           <li><a href="EndUser.jsp"><span>End User </span></a></li>
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
          <h2>View <span class="style3"> Audit</span> Files</h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
			  	<table width="965" border="1" align="center" cellspacing="0" cellpadding="5">
  <tr>
   <td width="178" bgcolor="#339999"><div align="center" class="style8"> Id</div></td>
    <td width="178" bgcolor="#339999"><div align="center" class="style8"> User</div></td>
      <td width="178" bgcolor="#339999"><div align="center" class="style8">File Name</div></td>
        <td width="140" height="32" bgcolor="#339999"><div align="center" class="style8">MAC</div></td>
   <td width="140" height="32" bgcolor="#339999"><div align="center" class="style8">Sk</div></td>
	  <td width="115" bgcolor="#339999"><div align="center" class="style8">Date</div></td>
  </tr>

<%
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		 
      		
      		String query="select * from opor_cloudaudit "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);

		%>

  <tr>
    <td height="29"><div align="center" class="style7 style9"><%=i%></div></td>
    <td height="29"><div align="center" class="style11"><%=s2%></div></td>
    <td><div align="center" class="style11"><%=s3%></div></td>
    <td><div align="center" class="style11"><%=s4%></div></td>
    <td><div align="center" class="style11"><%=s5%></div></td>
	  <td><div align="center" class="style11"><%=s6%></div></td>
  </tr>

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
			  	</p>
                <p>&nbsp;</p>
                <p><a href="CloudAuditServerMain.jsp">Go Back</a>
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