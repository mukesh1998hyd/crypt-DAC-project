<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="connect.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View Data Access Control</title>
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
.style14 {color: #FFFF00}
.style17 {font-family: "Courier New", Courier, monospace; color: #FF0000; }
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
          
		   <li class="active"><a href="CloudDataServer.jsp"><span>Cloud  Server </span></a></li>
          
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
          <h2>&nbsp;</h2>
          <h2>&nbsp;</h2>
          <h2>View Data Access Control</h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
			         <table width="965" border="1" align="center" cellpadding="10" cellspacing="0">
  <tr>
      <td width="178" bgcolor="#FF0000"><div align="center" class="style15 style13 style7 style18 style14"><strong>User Name </strong></div></td>
   <td width="140" height="32" bgcolor="#FF0000"><div align="center" class="style15 style13 style7 style18 style14"><strong>Request Date and Time </strong></div></td>
        
    <td width="205" bgcolor="#FF0000"><div align="center" class="style14 style14"><span class="style7">Read Data</span></div></td>
	    <td width="205" bgcolor="#FF0000"><div align="center" class="style14 style14"><span class="style7">Write Data</span></div></td>
  </tr>

<%

	
	String s22="",s33="",s44="",s55="",s66="";
    int i=0;

      	try 
	{
        
         
      	   String query="select * from userdacrequest"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
        i=rs.getInt(1);
		s22=rs.getString(2);//username
		s33=rs.getString(3);//reqdt
		s44=rs.getString(4);//resdt
		s55=rs.getString(5);//rd
		s66=rs.getString(6);//wr
		
		

		%>

  <tr>
     
    <td height="29"><div align="center" class="style17"><%=s22%></div></td>
    <td><div align="center" class="style17"><%=s33%></div></td>
	
	
	
	<td><div align="center" class="style17"><%=s55%></div></td>
	
	
		<td><div align="center" class="style17"><%=s66%></div></td>

	

   
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
                <p><a href="CloudDataServerMain.jsp">Go Back</a>          </p>
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